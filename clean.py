"""
Project 1: Netflix Dataset — Data Cleaning with Pandas
Dataset: https://www.kaggle.com/datasets/shivamb/netflix-shows
"""

import pandas as pd
import sqlite3
import os

# ─── Load ────────────────────────────────────────────────────────────────────
print("Loading data...")
df = pd.read_csv("data/netflix_titles.csv")
print(f"Raw shape: {df.shape}")
print(f"\nColumn types:\n{df.dtypes}")
print(f"\nMissing values:\n{df.isnull().sum()}")

# ─── Clean ───────────────────────────────────────────────────────────────────
print("\n--- Cleaning ---")

# 1. Fill missing categorical fields
df['director'].fillna('Unknown', inplace=True)
df['cast'].fillna('Unknown', inplace=True)
df['country'].fillna('Unknown', inplace=True)
df['rating'].fillna('Not Rated', inplace=True)
print("✓ Filled missing director / cast / country / rating with 'Unknown'")

# 2. Parse date_added → datetime, extract year + month
df['date_added'] = pd.to_datetime(
    df['date_added'].str.strip(),
    format='%B %d, %Y',
    errors='coerce'
)
df['year_added']  = df['date_added'].dt.year
df['month_added'] = df['date_added'].dt.month
print("✓ Parsed date_added, extracted year_added and month_added")

# 3. Extract numeric duration (movies → minutes, shows → seasons)
df['duration_value'] = df['duration'].str.extract(r'(\d+)').astype(float)
df['duration_unit']  = df['duration'].str.extract(r'([A-Za-z]+)')
print("✓ Split duration into duration_value + duration_unit")

# 4. Normalise text columns
df['type']    = df['type'].str.strip().str.title()
df['country'] = df['country'].str.strip()
df['rating']  = df['rating'].str.strip()

# 5. Drop rows missing release_year (only ~10)
before = len(df)
df.dropna(subset=['release_year'], inplace=True)
print(f"✓ Dropped {before - len(df)} rows with null release_year")

# 6. Cast release_year to int
df['release_year'] = df['release_year'].astype(int)

print(f"\nCleaned shape: {df.shape}")
print(df[['title', 'type', 'date_added', 'year_added', 'duration_value', 'duration_unit']].head())

# ─── Save ─────────────────────────────────────────────────────────────────────
os.makedirs("data", exist_ok=True)
conn = sqlite3.connect("data/netflix.db")
df.to_sql("netflix", conn, if_exists="replace", index=False)
conn.close()
df.to_csv("data/netflix_cleaned.csv", index=False)
print("\n✓ Saved to data/netflix.db  (table: netflix)")
print("✓ Saved to data/netflix_cleaned.csv")
