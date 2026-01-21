/* ------------------------------------------------------------------
   File: 01_schema.sql
   Project: Data-Driven Insights into Brazil’s E-Commerce Performance
   Purpose: Create database schema and tables
   SQL Dialect: MySQL
   ------------------------------------------------------------------ */

/* Creating schema for project */
CREATE SCHEMA IF NOT EXISTS brazil_ecommerce


/* ------------------------
   Table: Customers Dataset
   ------------------------ */

/* Creating table with the optimized data types */
CREATE TABLE brazil_ecommerce.olist_customers_dataset(
   customer_id VARCHAR(35),
   customer_unique_id VARCHAR(35),
   customer_zip_code_prefix MEDIUMINT UNSIGNED,
   customer_city VARCHAR(25),
   customer_state VARCHAR(2)
);

/* --------------------------
   Table: Geolocation Dataset
   -------------------------- */

/* Creating table with the optimized data types */
CREATE TABLE brazil_ecommerce.olist_geolocation_dataset(
   geolocation_zip_code_prefix MEDIUMINT UNSIGNED,
   geolocation_lat FLOAT(2, 20),
   geolocation_lng FLOAT(3, 20),
   geolocation_city VARCHAR(25),
   geolocation_state VARCHAR(2)
);

/* --------------------------
   Table: Order Items Dataset
   -------------------------- */

/* Creating table with the optimized data types */
CREATE TABLE brazil_ecommerce.olist_order_items_dataset(
   order_id VARCHAR(35),
   order_item_id TINYINT UNSIGNED,
   product_id VARCHAR(35),
   seller_id VARCHAR(35),
   shipping_limit_date DATETIME,
   price SMALLINT UNSIGNED,
   freight_value SMALLINT UNSIGNED
);

/* -----------------------
   Table: Payments Dataset
   ----------------------- */

/* Creating table with the optimized data types */
CREATE TABLE brazil_ecommerce.olist_order_payments_dataset(
   order_id VARCHAR(35),
   payment_sequential TINYINT UNSIGNED,
   payment_type VARCHAR(20),
   payment_installments TINYINT UNSIGNED,
   payment_value SMALLINT UNSIGNED
);

/* ----------------------------
   Table: Order Reviews Dataset
   ---------------------------- */

/* Creating table with the optimized data types */
CREATE TABLE brazil_ecommerce.olist_order_reviews_dataset(
   review_id VARCHAR(35),
   order_id VARCHAR(35),
   review_score TINYINT UNSIGNED,
   review_comment_title TINYTEXT,
   review_comment_message TINYTEXT,
   review_creation_date DATETIME,
   review_answer_timestamp DATETIME
);

/* --------------------
   Table: Order Dataset
   -------------------- */

/* Creating table with the optimized data types */
CREATE TABLE brazil_ecommerce.olist_orders_dataset(
   order_id VARCHAR(35),
   customer_id VARCHAR(35),
   order_status VARCHAR(15),
   order_purchase_timestamp DATETIME,
   order_approved_at DATETIME,
   order_delivered_carrier_date DATETIME,
   order_delivered_customer_date DATETIME,
   order_estimated_delivery_date DATETIME
);

/* -----------------------
   Table: Products Dataset
   ----------------------- */

/* Creating table with the optimized data types */
CREATE TABLE brazil_ecommerce.olist_products_dataset(
   product_id VARCHAR(35),
   product_category_name TINYTEXT,
   product_name_lenght TINYINT UNSIGNED,
   product_description_lenght SMALLINT UNSIGNED,
   product_photos_qty TINYINT UNSIGNED,
   product_weight_g SMALLINT UNSIGNED,
   product_length_cm TINYINT UNSIGNED,
   product_height_cm TINYINT UNSIGNED,
   product_width_cm TINYINT UNSIGNED
);

/* ----------------------
   Table: Sellers Dataset
   ---------------------- */

/* Creating table with the optimized data types */
CREATE TABLE brazil_ecommerce.olist_sellers_dataset(
   seller_id VARCHAR(35),
   seller_zip_code_prefix MEDIUMINT UNSIGNED,
   seller_city VARCHAR(35),
   seller_state VARCHAR(2)
);

/* --------------------------------
   Table: Category Name Translation
   -------------------------------- */

/* Creating table with the optimized data types */
CREATE TABLE brazil_ecommerce.product_category_name_translation(
   product_category_name VARCHAR(35),
   product_category_name_english VARCHAR(35)
);