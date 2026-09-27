export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const path = url.pathname;

    if (path === "/api/candidates") {
      return listCandidates(url, env);
    }
    if (path === "/api/stats") {
      return getStats(env);
    }
    if (path === "/api/search") {
      return semanticSearch(url, env);
    }
    if (path === "/api/reindex" && request.method === "POST") {
      return rebuildIndex(request, env);
    }

    // 其他路径交给静态资源（assets），未命中时由 not_found_handling 兜底
    return env.ASSETS.fetch(request);
  },
};

async function listCandidates(url, env) {
  const q = (url.searchParams.get("q") || "").trim();
  const city = url.searchParams.get("city") || "";
  const education = url.searchParams.get("education") || "";
  const page = Math.max(1, parseInt(url.searchParams.get("page") || "1", 10));
  const pageSize = Math.min(50, Math.max(1, parseInt(url.searchParams.get("pageSize") || "20", 10)));

  const conds = [];
  const params = [];
  if (q) {
    conds.push("(expected_position LIKE ? OR tags LIKE ?)");
    params.push(`%${q}%`, `%${q}%`);
  }
  if (city) {
    conds.push("city = ?");
    params.push(city);
  }
  if (education) {
    conds.push("education = ?");
    params.push(education);
  }
  const where = conds.length ? `WHERE ${conds.join(" AND ")}` : "";

  const total = await env.DB.prepare(
    `SELECT COUNT(*) AS c FROM candidates ${where}`
  ).bind(...params).first();

  const list = await env.DB.prepare(
    `SELECT * FROM candidates ${where} ORDER BY id LIMIT ? OFFSET ?`
  ).bind(...params, pageSize, (page - 1) * pageSize).all();

  return json({ total: total.c, page, pageSize, data: list.results });
}

async function getStats(env) {
  const total = await env.DB.prepare("SELECT COUNT(*) AS c FROM candidates").first();
  const education = await env.DB.prepare(
    "SELECT education AS k, COUNT(*) AS c FROM candidates WHERE education IS NOT NULL AND education != '' GROUP BY education ORDER BY c DESC"
  ).all();
  const city = await env.DB.prepare(
    "SELECT city AS k, COUNT(*) AS c FROM candidates WHERE city IS NOT NULL AND city != '' GROUP BY city ORDER BY c DESC LIMIT 12"
  ).all();

  return json({ total: total.c, education: education.results, city: city.results });
}

// ---- 语义搜索（Workers AI embedding + Vectorize）----

const EMBED_MODEL = "@cf/qwen/qwen3-embedding-0.6b";

function profileText(c) {
  const parts = [
    c.expected_position,
    c.education,
    c.city,
    c.tags,
    c.work_status,
    c.work_years ? `${c.work_years}年经验` : "",
  ];
  return parts.filter(Boolean).join("，");
}

async function embed(env, text) {
  const r = await env.AI.run(EMBED_MODEL, { text });
  return Array.from(r.data[0]);
}

async function rebuildIndex(request, env) {
  const key = request.headers.get("X-Index-Key") || "";
  if (key !== env.INDEX_SECRET) {
    return new Response("unauthorized", { status: 401 });
  }
  const { results } = await env.DB.prepare("SELECT * FROM candidates ORDER BY id").all();
  const vectors = [];
  let dims = 0;
  for (const c of results) {
    const text = profileText(c);
    const values = await embed(env, text);
    dims = values.length;
    vectors.push({
      id: String(c.id),
      values,
      metadata: {
        id: c.id,
        position: c.expected_position || "",
        city: c.city || "",
        education: c.education || "",
      },
    });
  }
  const up = await env.VECTORIZE.upsert(vectors);
  return json({ indexed: vectors.length, dims, upsert: up });
}

async function semanticSearch(url, env) {
  const q = (url.searchParams.get("q") || "").trim();
  if (!q) {
    return json({ query: "", matches: [] });
  }
  const values = await embed(env, q);
  const result = await env.VECTORIZE.query(values, { topK: 10, returnMetadata: true });

  const rows = [];
  for (const m of result.matches) {
    const c = await env.DB.prepare("SELECT * FROM candidates WHERE id = ?").bind(m.metadata.id).first();
    if (c) {
      rows.push({ ...c, score: Math.round(m.score * 1000) / 1000 });
    }
  }
  return json({ query: q, matches: rows });
}

function json(obj) {
  return new Response(JSON.stringify(obj), {
    headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Cache-Control": "no-store",
    },
  });
}
