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

function json(obj) {
  return new Response(JSON.stringify(obj), {
    headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Cache-Control": "no-store",
    },
  });
}
