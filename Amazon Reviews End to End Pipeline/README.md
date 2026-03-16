---
TITLE: Amazon Reviews End-to-End Pipeline
AUTHOR: Priyanka Rajeev Hichkad
---

# Amazon Reviews End-to-End Pipeline

## Project Overview

This project is a **complete end-to-end data science pipeline** built using real-world Amazon product reviews data. It demonstrates skills across **data cleaning, exploratory data analysis (EDA), natural language processing (NLP), machine learning, SQL, data visualization, and deployment**.

The goal is to extract meaningful insights from customer reviews, understand sentiment patterns, and present results through **SQL analysis, Tableau dashboards, and a Streamlit web app** — making it a strong **portfolio-ready project**.

---

## Objectives

* Clean and unify raw Amazon review datasets
* Perform structured EDA on ratings, brands, and categories
* Apply NLP techniques (VADER & BERT) for sentiment analysis
* Store processed data and results in MySQL
* Write exploratory and advanced SQL queries
* Build interactive dashboards (Tableau & Streamlit)
* Showcase full-stack data science workflow

---

## Project Structure

```
Amazon-Reviews-Analysis/
│
├── data/
│   ├── raw/                     # Original CSV files
│   ├── processed/               # Cleaned dataset
│   │   └── amazon_reviews_cleaned.csv
│
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_data_dictionary.ipynb
│   ├── 03_data_cleaning.ipynb
│   ├── 04_eda.ipynb
│   ├── 05_feature_engineering.ipynb
│   ├── 06_modeling.ipynb
│   └── 07_sentiment_advanced.ipynb
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   ├── 03_insert_data.ipynb
│   ├── 03_insert_data.sql
│   ├── 04_queries_exploratory.sql
│   └── 05_queries_advanced.sql
│
├── tableau/
│   └── Amazon_Reviews.twb
│
├── app/
│   └── app.py
│
├── models/
│   ├── vader_sentiment_results.csv
│   ├── rating_data.pkl
│   ├── rating_rf_model.pkl
│   ├── sentiment_data.pkl
│   ├── sentiment_rf_model.pkl
│   ├── tfidf_vectorizer.pkl
│   └── bert_sentiment_results.csv
│
├── environment.yml
└── README.md
```

---

## Dataset Description

* Source: **Datafiniti Amazon Consumer Reviews**
* Size: ~50k+ reviews (after cleaning)
* Key Columns:

  * `product_name`
  * `brand`
  * `category`
  * `rating`
  * `review_text`
  * `clean_text`

* Dataset download from - https://www.kaggle.com/datasets/datafiniti/consumer-reviews-of-amazon-products
* Cleaned dataset - https://drive.google.com/drive/folders/1kSfAKyWRRTfjnwQmJqrYKd3tvzdX7bAw?usp=drive_link

---

## Data Cleaning & Preprocessing

* Merged multiple Amazon review CSVs
* Standardized column names
* Handled missing values without dropping critical data
* Removed duplicates
* Cleaned text (lowercasing, punctuation removal, stopwords)
* Created NLP-ready features

---

## Exploratory Data Analysis (EDA)

* Rating distribution analysis
* Brand-wise and category-wise review trends
* Review length vs rating
* Helpful votes vs sentiment
* Word frequency and word clouds

---

## NLP & Sentiment Analysis

### Models Used

1. **VADER Sentiment Analyzer**

   * Rule-based
   * Fast and interpretable

2. **BERT (Transformer-based)**

   * Context-aware sentiment classification
   * Higher accuracy on nuanced reviews

### Outputs

* Stored sentiment labels and scores
* Compared model behavior and agreement
* Saved results in `/models` folder (https://drive.google.com/drive/folders/1kSfAKyWRRTfjnwQmJqrYKd3tvzdX7bAw?usp=drive_link)

---

## SQL Integration (MySQL)

* Designed relational schema
* Inserted cleaned data into MySQL
* Wrote optimized queries for insights

### Key SQL Analyses

* Top brands by average rating
* Sentiment distribution by category
* Rating vs sentiment mismatch analysis
* High-volume negative review detection

SQL Files:

* `04_queries_exploratory.sql`
* `05_queries_advanced.sql`

---

## Tableau Dashboard

An interactive Tableau dashboard showcasing:

* Overall sentiment distribution
* Brand-wise rating trends
* Category performance
* Filters for brand, rating, and sentiment

Designed for **non-technical stakeholders**

---

## Streamlit Web App

A fully interactive web application featuring:

* Filters for brand, category, and rating
* Rating and sentiment visualizations
* NLP word cloud
* Review search functionality

Run locally:

```bash
streamlit run app.py
```

---

## Tech Stack

* **Languages:** Python, SQL
* **Libraries:** Pandas, NumPy, scikit-learn, NLTK, Transformers
* **Databases:** MySQL
* **Visualization:** Matplotlib, Seaborn, Plotly, Tableau
* **Deployment:** Streamlit

---

## Key Learnings

* Handling large, messy real-world datasets
* Practical NLP using both classical and transformer models
* End-to-end project structuring
* SQL + Python integration
* Dashboarding for storytelling

---

