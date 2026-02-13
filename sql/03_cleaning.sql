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

/* Checking for duplicate rows using window functions */
WITH dup_olist_customers_dataset AS
(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state ORDER BY customer_id) AS row_num
FROM olist_customers_dataset)

SELECT *
FROM dup_olist_customers_dataset
WHERE row_num > 1
-- No duplicates found

/* --------------------------
   Table: Geolocation Dataset
   -------------------------- */

/* Checking for duplicate rows using window functions */
WITH dup_olist_geolocation_dataset AS
(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state ORDER BY geolocation_zip_code_prefix) AS row_num
FROM olist_geolocation_dataset)

SELECT *
FROM dup_olist_geolocation_dataset
WHERE row_num > 1
ORDER BY row_num DESC
-- This table contains duplicates and some rows repeating up to 314 times and can be removed. To remove duplicates I am going to instead create
-- a new table and import the CTE data with the row_num column and remove all rows with row_num greater than 1. Afterwards I will remove the row_num
-- column and use this new cleaned table as the olist_geolocation_dataset table.

/* Creating table for cleaned table with the new row_num column*/
CREATE TABLE brazil_ecommerce.olist_geolocation_dataset_cleaned(
   geolocation_zip_code_prefix CHAR(5),
   geolocation_lat DOUBLE,
   geolocation_lng DOUBLE,
   geolocation_city VARCHAR(50),
   geolocation_state CHAR(2),
   row_num SMALLINT UNSIGNED
)

/* Importing CTE table into new table */
INSERT INTO olist_geolocation_dataset_cleaned
SELECT *,
	ROW_NUMBER() OVER(
      PARTITION BY geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state ORDER BY geolocation_zip_code_prefix) AS row_num
FROM olist_geolocation_dataset

/* Deleting duplicate values */
DELETE
FROM olist_geolocation_dataset_cleaned
WHERE row_num > 1
-- Removed 279667 duplicate rows from the olist_geolocation_dataset_cleaned table

/* Removing row_num column*/
ALTER TABLE olist_geolocation_dataset_cleaned
DROP COLUMN row_num

/* --------------------------
   Table: Order Items Dataset
   -------------------------- */

/* Checking for duplicate rows using window functions */
WITH dup_olist_order_items_dataset AS
(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value ORDER BY order_id) AS row_num
FROM olist_order_items_dataset)

SELECT *
FROM dup_olist_order_items_dataset
WHERE row_num > 1
-- No duplicates found

/* -----------------------
   Table: Payments Dataset
   ----------------------- */

/* Checking for duplicate rows using window functions */
WITH dup_olist_order_payments_dataset AS
(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY order_id, payment_sequential, payment_type, payment_installments, payment_value ORDER BY order_id) AS row_num
FROM olist_order_payments_dataset)

SELECT *
FROM dup_olist_order_payments_dataset
WHERE row_num > 1
-- No duplicates found

/* ----------------------------
   Table: Order Reviews Dataset
   ---------------------------- */

/* Checking for duplicate rows using window functions */
WITH dup_olist_order_reviews_dataset AS
(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp ORDER BY review_id) AS row_num
FROM olist_order_reviews_dataset)

SELECT *
FROM dup_olist_order_reviews_dataset
WHERE row_num > 1
-- No duplicates found

/* --------------------
   Table: Orders Dataset
   -------------------- */

/* Checking for duplicate rows using window functions */
WITH dup_olist_orders_dataset AS
(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date ORDER BY order_id) AS row_num
FROM olist_orders_dataset)

SELECT *
FROM dup_olist_orders_dataset
WHERE row_num > 1
-- No duplicates found

/* -----------------------
   Table: Products Dataset
   ----------------------- */

/* Checking for duplicate rows using window functions */
WITH dup_olist_products_dataset AS
(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm ORDER BY product_id) AS row_num
FROM olist_products_dataset)

SELECT *
FROM dup_olist_products_dataset
WHERE row_num > 1
-- No duplicates found

/* ----------------------
   Table: Sellers Dataset
   ---------------------- */

/* Checking for duplicate rows using window functions */
WITH dup_olist_sellers_dataset AS
(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY seller_id, seller_zip_code_prefix, seller_city, seller_state ORDER BY seller_id) AS row_num
FROM olist_sellers_dataset)

SELECT *
FROM dup_olist_sellers_dataset
WHERE row_num > 1
-- No duplicates found

/* --------------------------------
   Table: Category Name Translation
   -------------------------------- */

/* Checking for duplicate rows using window functions */
WITH dup_product_category_name_translation AS
(SELECT *,
	ROW_NUMBER() OVER(PARTITION BY product_category_name, product_category_name_english ORDER BY product_category_name) AS row_num
FROM product_category_name_translation)

SELECT *
FROM dup_product_category_name_translation
WHERE row_num > 1
-- No duplicates found


/* ------------------------------------------------
   Checking & Removing Null and Empty String Values
   ------------------------------------------------ */

   /* ------------------------
   Table: Customers Dataset
   ------------------------ */

/* Checking for null and empty values using WHERE */
SELECT *
FROM olist_customers_dataset
WHERE customer_id IS NULL OR customer_id = ''
   OR customer_unique_id IS NULL OR customer_unique_id = ''
   OR customer_zip_code_prefix IS NULL OR customer_zip_code_prefix = ''
   OR customer_city IS NULL OR customer_city = ''
   OR customer_state IS NULL OR customer_state = ''
-- No NULL or empty string values found

/* --------------------------
   Table: Geolocation Dataset
   -------------------------- */

/* Checking for null and empty values using WHERE */
SELECT *
FROM olist_geolocation_dataset_cleaned
WHERE geolocation_zip_code_prefix IS NULL OR geolocation_zip_code_prefix = ''
	OR geolocation_lat IS NULL OR geolocation_lat = ''
   OR geolocation_lng IS NULL OR geolocation_lng = ''
   OR geolocation_city IS NULL OR geolocation_city = ''
   OR geolocation_state IS NULL OR geolocation_state = ''
-- No NULL or empty string values found

/* --------------------------
   Table: Order Items Dataset
   -------------------------- */

/* Checking for null and empty values using WHERE */
SELECT *
FROM olist_order_items_dataset
WHERE order_id IS NULL OR order_id = ''
	OR order_item_id IS NULL OR order_item_id = ''
   OR product_id IS NULL OR product_id = ''
   OR seller_id IS NULL OR seller_id = ''
   OR shipping_limit_date IS NULL OR shipping_limit_date = ''
   OR price IS NULL OR price = ''
   OR freight_value IS NULL OR freight_value = ''
-- No NULL or empty string values found

/* -----------------------
   Table: Payments Dataset
   ----------------------- */

/* Checking for null and empty values using WHERE */
SELECT *
FROM olist_order_payments_dataset
WHERE order_id IS NULL OR order_id = ''
	OR payment_sequential IS NULL OR payment_sequential = ''
   OR payment_type IS NULL OR payment_type = ''
   OR payment_installments IS NULL OR payment_installments = ''
   OR payment_value IS NULL OR payment_value = ''
-- No NULL or empty string values found

/* ----------------------------
   Table: Order Reviews Dataset
   ---------------------------- */

/* Checking for null and empty values using WHERE */
SELECT *
FROM olist_order_reviews_dataset
WHERE review_id IS NULL OR review_id = ''
   OR order_id IS NULL OR order_id = ''
   OR review_score IS NULL OR review_score = ''
   OR review_comment_title IS NULL OR review_comment_title = ''
   OR review_comment_message IS NULL OR review_comment_message = ''
   OR review_creation_date IS NULL OR review_creation_date = ''
   OR review_answer_timestamp IS NULL OR review_answer_timestamp = ''
-- Empty values are tolerable in the review comment sections because not every customer will have
-- something to say about their purchase and most do not comment at all

/* --------------------
   Table: Orders Dataset
   -------------------- */

/* Checking for null and empty values using WHERE */
SELECT *
FROM olist_orders_dataset
WHERE order_id IS NULL OR order_id = ''
   OR customer_id IS NULL OR customer_id = ''
   OR order_status IS NULL OR order_status = ''
   OR order_purchase_timestamp IS NULL OR order_purchase_timestamp = ''
   OR order_approved_at IS NULL OR order_approved_at = ''
   OR order_delivered_carrier_date IS NULL OR order_delivered_carrier_date = ''
   OR order_delivered_customer_date IS NULL OR order_delivered_customer_date = ''
   OR order_estimated_delivery_date IS NULL OR order_estimated_delivery_date = ''
-- No NULL or empty string values found

/* -----------------------
   Table: Products Dataset
   ----------------------- */

/* Checking for null and empty values using WHERE */
SELECT *
FROM olist_products_dataset
WHERE product_id IS NULL OR product_id = ''
	OR product_category_name IS NULL OR product_category_name = ''
    OR product_name_lenght IS NULL OR product_name_lenght = ''
    OR product_description_lenght IS NULL OR product_description_lenght = ''
    OR product_photos_qty IS NULL OR product_photos_qty = ''
    OR product_weight_g IS NULL OR product_weight_g = ''
    OR product_length_cm IS NULL OR product_length_cm = ''
    OR product_height_cm IS NULL OR product_height_cm = ''
    OR product_width_cm IS NULL OR product_width_cm = ''
-- No NULL or empty string values found

/* ----------------------
   Table: Sellers Dataset
   ---------------------- */

/* Checking for null and empty values using WHERE */
SELECT *
FROM olist_sellers_dataset
WHERE seller_id IS NULL OR seller_id = ''
	OR seller_zip_code_prefix IS NULL OR seller_zip_code_prefix = ''
    OR seller_city IS NULL OR seller_city = ''
    OR seller_state IS NULL OR seller_state = ''
-- No NULL or empty string values found

/* --------------------------------
   Table: Category Name Translation
   -------------------------------- */

/* Checking for null and empty values using WHERE */
SELECT *
FROM product_category_name_translation
WHERE product_category_name IS NULL OR product_category_name = ''
	OR product_category_name_english IS NULL OR product_category_name_english = ''
-- No NULL or empty string values found


/* -------------------------------
   Standardizing & Optimizing Data
   ------------------------------- */

/* ------------------------
   Table: Customers Dataset
   ------------------------ */

/* Looking at table types to optimize */
DESCRIBE olist_customers_dataset

/* Finding if varchar can be shortened to save space */
SELECT MAX(LENGTH(customer_id)) AS cust_id_len,
	MAX(LENGTH(customer_unique_id)) AS cust_unique_id_len,
   MAX(LENGTH(customer_zip_code_prefix)) AS zip_code_len,
   MAX(LENGTH(customer_city)) AS city_len,
   MAX(LENGTH(customer_state)) AS state_len
FROM olist_customers_dataset
-- The customer_id, customer_unique_id, and customer_city columns can be shortened

/* Optimizing varchar size */
ALTER TABLE olist_customers_dataset
MODIFY customer_id VARCHAR(32)

ALTER TABLE olist_customers_dataset
MODIFY customer_unique_id VARCHAR(32)

ALTER TABLE olist_customers_dataset
MODIFY customer_city VARCHAR(32)

/* Turning column into primary key to update table */
ALTER TABLE olist_customers_dataset
ADD PRIMARY KEY (customer_id)

/* Converting column into snakecase format */
UPDATE olist_customers_dataset
SET customer_city = LOWER(
    REGEXP_REPLACE(
        REGEXP_REPLACE(
            REGEXP_REPLACE(TRIM(customer_city), '[^A-Za-z0-9]+', '_'), /* Replacing all non-alphanumeric characters with the underscore characters */
        '_+', '_'), /* Replacing multiple underscore characters with a single one */
    '^_|_$', '') /* Removing all leading or trailing underscore characters */
)
WHERE customer_id >= ''
-- Converted 51679 rows into snakecase format

/* Converting column into snakecase format */
UPDATE olist_customers_dataset
SET customer_state = LOWER(customer_state)
WHERE customer_id >= ''
-- Converted all rows to snakecase format

/* --------------------------
   Table: Geolocation Dataset
   -------------------------- */

/* Looking at table types to optimize */
DESCRIBE olist_geolocation_dataset_cleaned

/* Looking at the max length of city name to optimize table */
SELECT MAX(LENGTH(geolocation_city))
FROM olist_geolocation_dataset_cleaned
-- The max character size is 38 but the previous city name lengths was 32 from the previous table
-- possibly hinting at non-standardized values in this table

/* Looking at unique values */
SELECT DISTINCT(geolocation_city)
FROM olist_geolocation_dataset_cleaned
ORDER BY geolocation_city
-- Looking at the first few values shows us multiple non-alphanumeric characters indicating non-
-- standardized data and needs to be cleaned

/* Converting column into snakecase format */
UPDATE olist_geolocation_dataset_cleaned
SET geolocation_city = LOWER(
    REGEXP_REPLACE(
        REGEXP_REPLACE(
            REGEXP_REPLACE(TRIM(geolocation_city), '[^A-Za-z0-9]+', '_'), /* Replacing all non-alphanumeric characters with the underscore characters */
        '_+', '_'), /* Replacing multiple underscore characters with a single one */
    '^_|_$', '') /* Removing all leading or trailing underscore characters */
)
WHERE geolocation_zip_code_prefix >= ''
-- Converted 386087 rows to snakecase format
-- All rows now only consist of alphanumeric values and can now be converted to its proper city name

/*  */
UPDATE b
SET b.geolocation_city = a.customer_city
FROM olist_geolocation_dataset_cleaned b
JOIN olist_customers_dataset a
	ON b.geolocation_zip_code_prefix = a.customer_zip_code_prefix

/* --------------------------
   Table: Order Items Dataset
   -------------------------- */

/*  */


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

