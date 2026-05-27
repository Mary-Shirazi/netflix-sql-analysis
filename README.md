# 🎬 Netflix Content Strategy — SQL + Python Analysis

> End-to-end data analysis of 8,807 Netflix titles using Python/Pandas for cleaning and SQL for business insights.

---

## 📊 Key Insights

| # | Finding | Detail |
|---|---------|--------|
| 1 | Movies dominate | 69% of catalog is movies (6,131 vs 2,676 TV shows) |
| 2 | US + India = half the platform | USA leads at 2,818 titles; India #2 at 972 |
| 3 | Targeting mature audiences | TV-MA (mature) is 36% of all content |
| 4 | Growth peaked in 2019 | 2,016 titles added that year — the all-time high |
| 5 | Dramas + International rule | Top genre buckets reveal a global strategy |

---

## 🗂 Project Structure

```
├── clean.py              ← Pandas cleaning pipeline
├── sql/
│   └── queries.sql       ← 5 SQL business questions
├── findings.md           ← Full write-up of insights
├── data/
│   ├── netflix_titles.csv    ← Raw Kaggle data
│   └── netflix_cleaned.csv   ← Cleaned output
└── README.md
```

---

## 🛠 Tech Stack

![Python](https://img.shields.io/badge/Python-3.10+-blue?logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-2.x-150458?logo=pandas&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-3-003B57?logo=sqlite&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-5+_queries-orange)

---

## 🚀 How to Run

```bash
# Clone the repo
git clone https://github.com/YOURUSERNAME/netflix-sql-analysis.git
cd netflix-sql-analysis

# Install dependencies
pip install pandas

# Download the dataset
# → https://www.kaggle.com/datasets/shivamb/netflix-shows
# → Save as data/netflix_titles.csv

# Run cleaning
python clean.py

# Open data/netflix.db in DB Browser for SQLite
# Run queries from sql/queries.sql
```

---

## 📁 Data Source

- **Dataset:** [Netflix Movies and TV Shows](https://www.kaggle.com/datasets/shivamb/netflix-shows) via Kaggle
- **License:** CC0 Public Domain
- **Rows:** 8,807 | **Date range:** 2008–2021

---

## 📝 Full Analysis

See [findings.md](findings.md) for the complete write-up including business recommendations for each insight.

---

*Part of a 3-project data analytics portfolio. See also:*
- *[Spotify Streaming Era Analysis](https://github.com/YOURUSERNAME/spotify-streaming-analysis)*
