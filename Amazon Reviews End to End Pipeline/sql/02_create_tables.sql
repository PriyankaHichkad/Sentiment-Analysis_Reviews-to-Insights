USE product_reviews;
DROP TABLE IF EXISTS amazon_reviews;
CREATE TABLE amazon_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    id VARCHAR(255),
    product_name TEXT,
    asins VARCHAR(500),
    brand VARCHAR(500),
    category TEXT,
    keywords TEXT,
    manufacturer TEXT,
    review_date DATETIME,
    reviews_dateSeen DATETIME,
    do_recommend FLOAT,
    reviews_numHelpful FLOAT,
    rating FLOAT,
    reviews_sourceURLs TEXT,
    review_text TEXT,
    review_title TEXT,
    reviews_username TEXT,
    sentiment VARCHAR(50),
    clean_text TEXT
);