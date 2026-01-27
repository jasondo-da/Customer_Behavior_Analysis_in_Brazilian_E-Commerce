/* ------------------------------------------------------------------
   File: 03_cleaning.sql
   Project: Data-Driven Insights into Brazil’s E-Commerce Performance
   Purpose: Clean the data for analysis
   SQL Dialect: MySQL
   ------------------------------------------------------------------ */

/* ------------------------------
   Checking & Removing Duplicates
   ------------------------------ */

/* ------------------------
   Table: Customers Dataset
   ------------------------ */

SELECT *, COUNT(*) AS duplicate_count
FROM olist_customers_dataset
GROUP BY customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state
HAVING COUNT(*) > 1

-- No duplicates found

/* --------------------------
   Table: Geolocation Dataset
   -------------------------- */

SELECT *, COUNT(*) AS duplicate_count
FROM olist_geolocation_dataset
GROUP BY geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state
HAVING COUNT(*) > 1

-- Since customers can reorder duplicates in this table is acceptable

/* --------------------------
   Table: Order Items Dataset
   -------------------------- */

SELECT *, COUNT(*) AS duplicate_count
FROM olist_order_items_dataset
GROUP BY order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value
HAVING COUNT(*) > 1

-- No duplicates found

/* -----------------------
   Table: Payments Dataset
   ----------------------- */

SELECT *, COUNT(*) AS duplicate_count
FROM olist_order_payments_dataset
GROUP BY order_id, payment_sequential, payment_type, payment_installments, payment_value
HAVING COUNT(*) > 1

-- No duplicates found

/* ----------------------------
   Table: Order Reviews Dataset
   ---------------------------- */

SELECT *, COUNT(*) AS duplicate_count
FROM olist_order_reviews_dataset
GROUP BY review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp
HAVING COUNT(*) > 1

-- No duplicates found

/* --------------------
   Table: Orders Dataset
   -------------------- */

SELECT *, COUNT(*) AS duplicate_count
FROM olist_orders_dataset
GROUP BY order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date
HAVING COUNT(*) > 1

-- No duplicates found

/* -----------------------
   Table: Products Dataset
   ----------------------- */

SELECT *, COUNT(*) AS duplicate_count
FROM olist_products_dataset
GROUP BY product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm
HAVING COUNT(*) > 1

-- No duplicates found

/* ----------------------
   Table: Sellers Dataset
   ---------------------- */

SELECT *, COUNT(*) AS duplicate_count
FROM olist_sellers_dataset
GROUP BY seller_id, seller_zip_code_prefix, seller_city, seller_state
HAVING COUNT(*) > 1

-- No duplicates found

/* --------------------------------
   Table: Category Name Translation
   -------------------------------- */

SELECT *, COUNT(*) AS duplicate_count
FROM product_category_name_translation
GROUP BY product_category_name, product_category_name_english
HAVING COUNT(*) > 1

-- No duplicates found


/* -------------------------------
   Checking & Removing Null Values
   ------------------------------- */

   /* ------------------------
   Table: Customers Dataset
   ------------------------ */

SELECT *
FROM olist_customers_dataset
WHERE customer_id IS NULL
	OR customer_unique_id IS NULL
    OR customer_zip_code_prefix IS NULL
    OR customer_city IS NULL
    OR customer_state IS NULL;

-- No NULL values found

/* --------------------------
   Table: Geolocation Dataset
   -------------------------- */

SELECT *
FROM olist_geolocation_dataset
WHERE geolocation_zip_code_prefix IS NULL
	OR geolocation_lat IS NULL
    OR geolocation_lng IS NULL
    OR geolocation_city IS NULL
    OR geolocation_state IS NULL;

-- No NULL values found

/* --------------------------
   Table: Order Items Dataset
   -------------------------- */

SELECT *
FROM olist_order_items_dataset
WHERE order_id  IS NULL
	OR order_item_id IS NULL
    OR product_id IS NULL
    OR seller_id IS NULL
    OR shipping_limit_date IS NULL
    OR price IS NULL
    OR freight_value IS NULL;

-- No NULL values found

/* -----------------------
   Table: Payments Dataset
   ----------------------- */



/* ----------------------------
   Table: Order Reviews Dataset
   ---------------------------- */



/* --------------------
   Table: Orders Dataset
   -------------------- */



/* -----------------------
   Table: Products Dataset
   ----------------------- */



/* ----------------------
   Table: Sellers Dataset
   ---------------------- */



/* --------------------------------
   Table: Category Name Translation
   -------------------------------- */
