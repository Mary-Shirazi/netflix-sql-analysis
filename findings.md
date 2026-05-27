# Netflix Content Strategy — Data Analysis Findings

## Dataset
| Attribute | Value |
|-----------|-------|
| Source | [Kaggle — Netflix Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/netflix-shows) |
| Rows (raw) | 8,807 titles |
| Columns | 12 |
| Date range | 2008 – 2021 |
| Downloaded | May 2026 |

---

## Cleaning Steps

| Step | Action | Impact |
|------|--------|--------|
| 1 | Filled null `director` with `'Unknown'` | 2,634 rows |
| 2 | Filled null `cast` with `'Unknown'` | 825 rows |
| 3 | Filled null `country` with `'Unknown'` | 831 rows |
| 4 | Filled null `rating` with `'Not Rated'` | 4 rows |
| 5 | Parsed `date_added` string → datetime | Enabled year/month analysis |
| 6 | Extracted `year_added`, `month_added` | New feature columns |
| 7 | Split `duration` → `duration_value` (int) + `duration_unit` | Enables numeric analysis |
| 8 | Dropped rows with null `release_year` | Removed 10 rows |

**Final clean shape: 8,797 rows × 15 columns**

---

## Key Findings

### Finding 1 — Netflix is a Movie-first platform (69% Movies)
Netflix has **6,131 movies vs 2,676 TV shows**, making it a 2:1 movie platform by catalog count.

> **Business implication:** TV shows typically drive higher engagement and subscriber retention (more watch time, auto-play hooks, returning viewers). The large movie catalog may actually *underperform* relative to its size. Investing more in long-form serialized content could improve retention metrics.

---

### Finding 2 — The US + India account for 50% of all content
The United States leads with **2,818 titles**, India is second with **972 titles**, and the UK is third with **419 titles**.

> **Business implication:** Latin America (Brazil, Mexico, Colombia) is underrepresented relative to Netflix's large subscriber base there. Local-language original productions in those markets represent a growth opportunity — competitors like Amazon Prime are already investing heavily there.

---

### Finding 3 — Netflix heavily targets mature audiences (TV-MA = 36%)
**TV-MA** (mature audiences) is the single largest rating with 3,207 titles — 36% of the entire catalog. Only ~14% of content is rated G, PG, or TV-Y7.

> **Business implication:** Family and children's content is a structural gap. Disney+ and Apple TV+ have made this a differentiator. Closing that gap could help Netflix compete for family subscription plans (higher ARPU, lower churn).

---

### Finding 4 — Catalog growth peaked in 2019, then stalled
Netflix added **2,016 titles in 2019** — its highest ever. Post-2020 additions dropped sharply, likely due to:
- COVID-19 production shutdowns (2020-2021)
- A strategic shift toward *quality over quantity* (culling low-performing licensed content)

> **Business implication:** If you see this in a job interview, frame it as the "streaming wars maturation" — Netflix shifted from catalog breadth to original content investment around this time.

---

### Finding 5 — Dramas and International content dominate genres
The top genre buckets are:
1. **Dramas** — most common single-genre tag
2. **Comedies** — strong second
3. **International Movies** — confirms Netflix's global expansion strategy
4. **Documentaries** — consistent strong performer

> **Business implication:** The "International Movies" bucket being top 3 is the most strategically interesting — it suggests global audiences, not just US viewers, are driving catalog shape.

---

## Summary Table

| Question | Answer | Business Action |
|----------|--------|-----------------|
| Movie vs TV split | 69% Movies | Invest more in TV series |
| Top content country | USA (32%) | Grow Latin America |
| Dominant rating | TV-MA (36%) | Expand family content |
| Peak growth year | 2019 | Expect quality-not-quantity era |
| Top genre | Dramas | Safe to keep investing here |

---

## Files in This Repo

```
project1-netflix/
├── clean.py              # Full Pandas cleaning script
├── sql/
│   └── queries.sql       # 5 SQL business questions + bonus
├── findings.md           # This file
├── data/
│   ├── netflix_titles.csv    # Raw data (from Kaggle)
│   └── netflix_cleaned.csv   # Cleaned version
└── README.md
```

---

## How to Reproduce

```bash
# 1. Download netflix_titles.csv from Kaggle into data/
# 2. Install dependencies
pip install pandas

# 3. Run cleaning script
python clean.py

# 4. Open netflix.db in DB Browser for SQLite
# 5. Run queries from sql/queries.sql
```
