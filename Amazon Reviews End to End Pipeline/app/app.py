import streamlit as st
import pandas as pd
import plotly.express as px
import matplotlib.pyplot as plt

# ----------------------------
# Page Configuration
# ----------------------------
st.set_page_config(
    page_title="Amazon Reviews Analysis",
    page_icon="🛒",
    layout="wide"
)

st.title("🛒 Amazon Reviews Analysis Dashboard")
st.markdown(
    """
    This interactive dashboard analyzes **Amazon product reviews** to uncover insights about
    customer sentiment, ratings, brands, and categories.
    
    **Tech Stack:** Python, Pandas, MySQL, Streamlit, Plotly, NLP
    """
)

# ----------------------------
# Load Data
# ----------------------------
@st.cache_data
def load_data():
    return pd.read_csv("amazon_reviews_cleaned.csv")

df = load_data()

# ----------------------------
# Sidebar Filters
# ----------------------------
st.sidebar.header("🔎 Filter Reviews")

brand_options = sorted(df['brand'].dropna().unique())
category_options = sorted(df['category'].dropna().unique())
rating_options = sorted(df['rating'].dropna().unique())

selected_brands = st.sidebar.multiselect(
    "Select Brand(s)", brand_options, default=brand_options
)

selected_categories = st.sidebar.multiselect(
    "Select Category(s)", category_options, default=category_options
)

selected_ratings = st.sidebar.multiselect(
    "Select Rating(s)", rating_options, default=rating_options
)

# Apply filters
filtered_df = df[
    (df['brand'].isin(selected_brands)) &
    (df['category'].isin(selected_categories)) &
    (df['rating'].isin(selected_ratings))
]

# ----------------------------
# Tabs Layout
# ----------------------------
tab1, tab2, tab3 = st.tabs([
    "📊 Overview",
    "📈 Visual Insights",
    "🔍 Review Explorer"
])

# ----------------------------
# TAB 1: Overview
# ----------------------------
with tab1:
    st.subheader("Key Metrics")

    col1, col2, col3, col4 = st.columns(4)

    col1.metric("Total Reviews", len(filtered_df))
    col2.metric("Average Rating", round(filtered_df['rating'].mean(), 2))
    col3.metric("Unique Brands", filtered_df['brand'].nunique())
    col4.metric("Categories", filtered_df['category'].nunique())

    st.subheader("Dataset Preview")
    st.dataframe(filtered_df.head(20), use_container_width=True)

# ----------------------------
# TAB 2: Visual Insights
# ----------------------------
with tab2:
    st.subheader("Rating Distribution")
    fig_rating = px.histogram(
        filtered_df,
        x="rating",
        nbins=5,
        title="Distribution of Ratings"
    )
    st.plotly_chart(fig_rating, use_container_width=True)

    st.subheader("Sentiment Distribution")
    if 'sentiment' in filtered_df.columns:
        fig_sentiment = px.pie(
            filtered_df,
            names="sentiment",
            title="Customer Sentiment Breakdown"
        )
        st.plotly_chart(fig_sentiment, use_container_width=True)
    else:
        st.info("Sentiment column not found in dataset.")

    st.subheader("6 Brands by Number of Reviews")
    top_brands = filtered_df['brand'].value_counts().nlargest(6).reset_index()
    top_brands.columns = ['brand', 'count']

    fig_brands = px.bar(
        top_brands,
        x='brand',
        y='count',
        title="Top Brands"
    )
    st.plotly_chart(fig_brands, use_container_width=True)

# ----------------------------
# TAB 3: Review Explorer
# ----------------------------
with tab3:
    st.subheader("Search Reviews")

    search_query = st.text_input("Search by keyword (product, feature, issue, etc.)")

    if search_query:
        search_results = filtered_df[
            filtered_df['review_text'].str.contains(search_query, case=False, na=False)
        ]

        st.write(f"🔍 Found {len(search_results)} matching reviews")

        st.dataframe(
            search_results[[
                'product_name',
                'review_title',
                'rating',
                'sentiment',
                'review_text'
            ]].head(50),
            use_container_width=True
        )
