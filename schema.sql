DROP TABLE IF EXISTS candidates;
CREATE TABLE candidates (
  id INTEGER PRIMARY KEY,
  gender TEXT,
  age INTEGER,
  education TEXT,
  city TEXT,
  work_years INTEGER,
  expected_position TEXT,
  salary_min INTEGER,
  salary_max INTEGER,
  work_status TEXT,
  online_status TEXT,
  score REAL,
  source TEXT,
  tags TEXT,
  status TEXT,
  created_at TEXT
);
CREATE INDEX idx_candidates_city ON candidates(city);
CREATE INDEX idx_candidates_education ON candidates(education);
