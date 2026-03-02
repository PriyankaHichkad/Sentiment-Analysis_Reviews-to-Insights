USE product_reviews;

-- 1. Sentiment-based average rating
SELECT sentiment, AVG(rating) AS avg_rating
FROM amazon_reviews
GROUP BY sentiment;

-- 2. Top products with highest positive review percentage
SELECT 
    asins,
    product_name,
    SUM(CASE WHEN sentiment = 'positive' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS positive_percentage
FROM amazon_reviews
GROUP BY asins, product_name
HAVING COUNT(*) > 50  -- to avoid noise from very few reviews
ORDER BY positive_percentage DESC;

-- 3. Products with highest negative sentiment share
SELECT 
    asins,
    product_name,
    SUM(CASE WHEN sentiment = 'negative' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS negative_percentage
FROM amazon_reviews
GROUP BY asins, product_name
HAVING COUNT(*) > 50
ORDER BY negative_percentage DESC;

-- 4. Correlation-like view: helpfulness vs rating
SELECT rating, AVG(reviews_numHelpful) AS avg_helpfulness
FROM amazon_reviews
WHERE reviews_numHelpful IS NOT NULL
GROUP BY rating
ORDER BY rating;

-- 5. Monthly review trends
SELECT DATE_FORMAT(review_date, '%Y-%m') AS review_month,
       COUNT(*) AS reviews_count
FROM amazon_reviews
GROUP BY review_month
ORDER BY review_month;

-- 6. Brand sentiment distribution
SELECT brand,
       SUM(CASE WHEN sentiment = 'positive' THEN 1 END) AS positive_reviews,
       SUM(CASE WHEN sentiment = 'negative' THEN 1 END) AS negative_reviews,
       SUM(CASE WHEN sentiment = 'neutral' THEN 1 END) AS neutral_reviews
FROM amazon_reviews
GROUP BY brand
ORDER BY positive_reviews DESC;

-- 7. Top 20 reviews with unusually high helpfulness
SELECT review_text, reviews_numHelpful, rating, sentiment
FROM amazon_reviews
WHERE reviews_numHelpful > (SELECT AVG(reviews_numHelpful) * 2 FROM amazon_reviews)
ORDER BY reviews_numHelpful DESC
LIMIT 20;

-- 8. Products ranked by average helpfulness
SELECT asins, product_name, AVG(reviews_numHelpful) AS avg_helpfulness
FROM amazon_reviews
GROUP BY asins, product_name
HAVING COUNT(*) > 20
ORDER BY avg_helpfulness DESC;

-- 9. Detecting mismatch: reviews with high rating but negative sentiment
SELECT id, product_name, rating, sentiment, review_text
FROM amazon_reviews
WHERE rating >= 4 AND sentiment = 'negative'
LIMIT 50;

-- 10. Detecting mismatch: reviews with low rating but positive sentiment
SELECT id, product_name, rating, sentiment, review_text
FROM amazon_reviews
WHERE rating <= 2 AND sentiment = 'positive'
LIMIT 50;

-- 11. Top 50 most frequent reviewers (power users)
SELECT reviews_username, COUNT(*) AS review_count
FROM amazon_reviews
GROUP BY reviews_username
ORDER BY review_count DESC
LIMIT 50;

-- 12. Average rating per category
SELECT category, AVG(rating) AS avg_rating
FROM amazon_reviews
GROUP BY category
ORDER BY avg_rating DESC;

-- 13. Review helpfulness distribution per sentiment
SELECT sentiment, AVG(reviews_numHelpful) AS avg_helpful
FROM amazon_reviews
GROUP BY sentiment;