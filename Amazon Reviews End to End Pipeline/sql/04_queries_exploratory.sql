USE product_reviews;

-- 1. Count total rows
SELECT COUNT(*) AS total_reviews
FROM amazon_reviews;

-- 2. Number of unique products
SELECT COUNT(DISTINCT asins) AS unique_products
FROM amazon_reviews;

-- 3. Top 10 most reviewed products
SELECT asins, product_name, COUNT(*) AS review_count
FROM amazon_reviews
GROUP BY asins, product_name
ORDER BY review_count DESC
LIMIT 10;

-- 4. Rating distribution
SELECT rating, COUNT(*) AS count_rating
FROM amazon_reviews
GROUP BY rating
ORDER BY rating;

-- 5. Average rating per product
SELECT asins, product_name, AVG(rating) AS avg_rating
FROM amazon_reviews
GROUP BY asins, product_name
ORDER BY avg_rating DESC;

-- 6. Count of positive, negative, neutral sentiments
SELECT sentiment, COUNT(*) AS sentiment_count
FROM amazon_reviews
GROUP BY sentiment;

-- 7. Reviews over time
SELECT DATE(review_date) AS review_day, COUNT(*) AS reviews_on_day
FROM amazon_reviews
GROUP BY DATE(review_date)
ORDER BY review_day;

-- 8. Top 10 most helpful reviews
SELECT review_text, reviews_numHelpful
FROM amazon_reviews
WHERE reviews_numHelpful IS NOT NULL
ORDER BY reviews_numHelpful DESC
LIMIT 10;

-- 9. Count of reviews recommending the product vs not recommending
SELECT do_recommend, COUNT(*) AS count_recommend
FROM amazon_reviews
GROUP BY do_recommend;

-- 10. Total reviews per brand
SELECT brand, COUNT(*) AS review_count
FROM amazon_reviews
GROUP BY brand
ORDER BY review_count DESC;