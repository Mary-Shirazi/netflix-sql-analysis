-- ═══════════════════════════════════════════════════════════════════════════
-- Project 1: Netflix Dataset — 5 Business Questions
-- Database: data/netflix.db  |  Table: netflix
-- Run in: DB Browser for SQLite  (sqlitebrowser.org)
-- ═══════════════════════════════════════════════════════════════════════════


-- ─────────────────────────────────────────────────────────────────────────────
-- Q1: What is the split between Movies and TV Shows?
-- Business question: Are we primarily a movie platform or TV platform?
-- ─────────────────────────────────────────────────────────────────────────────
SELECT
    type,
    COUNT(*)                                                      AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix), 1)  AS pct_of_catalog
FROM netflix
GROUP BY type
ORDER BY total DESC;
-- Expected: Movie ~69%, TV Show ~31%


-- ─────────────────────────────────────────────────────────────────────────────
-- Q2: Which countries produce the most Netflix content?
-- Business question: Where should Netflix invest in local productions?
-- ─────────────────────────────────────────────────────────────────────────────
SELECT
    country,
    COUNT(*) AS total_titles
FROM netflix
WHERE country NOT IN ('Unknown', '')
  AND country NOT LIKE '%,%'        -- single-country only for clarity
GROUP BY country
ORDER BY total_titles DESC
LIMIT 15;
-- Expected top 3: United States, India, United Kingdom


-- ─────────────────────────────────────────────────────────────────────────────
-- Q3: What content ratings dominate the catalog?
-- Business question: Which audience segment is Netflix targeting most?
-- ─────────────────────────────────────────────────────────────────────────────
SELECT
    rating,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix), 1) AS pct
FROM netflix
WHERE rating NOT IN ('Unknown', 'Not Rated', '')
GROUP BY rating
ORDER BY total DESC
LIMIT 10;
-- Expected: TV-MA dominates at ~36%


-- ─────────────────────────────────────────────────────────────────────────────
-- Q4: How has Netflix catalog growth changed year over year?
-- Business question: Is the platform accelerating or slowing content additions?
-- ─────────────────────────────────────────────────────────────────────────────
SELECT
    year_added,
    COUNT(*)                            AS titles_added,
    SUM(COUNT(*)) OVER (
        ORDER BY year_added
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    )                                   AS running_total,
    COUNT(*) - LAG(COUNT(*)) OVER (
        ORDER BY year_added
    )                                   AS yoy_change
FROM netflix
WHERE year_added IS NOT NULL
  AND year_added BETWEEN 2015 AND 2021
GROUP BY year_added
ORDER BY year_added;
-- Expected: peak 2019 (2,016 titles), post-2020 slowdown


-- ─────────────────────────────────────────────────────────────────────────────
-- Q5: What are the top genres on Netflix?
-- Business question: What content buckets should we invest more in?
-- ─────────────────────────────────────────────────────────────────────────────
-- Simple version (full listed_in string)
SELECT
    listed_in,
    COUNT(*) AS total
FROM netflix
GROUP BY listed_in
ORDER BY total DESC
LIMIT 15;

-- ─────────────────────────────────────────────────────────────────────────────
-- BONUS Q: Average movie duration by rating — do mature movies run longer?
-- ─────────────────────────────────────────────────────────────────────────────
SELECT
    rating,
    ROUND(AVG(duration_value), 1) AS avg_minutes,
    COUNT(*)                       AS num_movies
FROM netflix
WHERE type = 'Movie'
  AND duration_unit = 'min'
  AND rating NOT IN ('Unknown', 'Not Rated')
GROUP BY rating
ORDER BY avg_minutes DESC;
