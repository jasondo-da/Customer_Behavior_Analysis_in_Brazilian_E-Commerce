/* ------------------------------------------------------------------
   File: 02_import.sql
   Project: Data-Driven Insights into Brazil’s E-Commerce Performance
   Purpose: Import raw CSV data into tables
   SQL Dialect: MySQL
   Notes: File paths are local and may vary by environment
   ------------------------------------------------------------------ */


/* ------------------------
   Table: Customers Dataset
   ------------------------ */

LOAD DATA LOCAL INFILE 'C:/Users/jason/Desktop/DA Projects/SQL/brazil_ecom/olist_customers_dataset.csv'
INTO TABLE olist_customers_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/* --------------------------
   Table: Geolocation Dataset
   -------------------------- */

LOAD DATA LOCAL INFILE 'C:/Users/jason/Desktop/DA Projects/SQL/brazil_ecom/olist_geolocation_dataset.csv'
INTO TABLE olist_geolocation_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/* --------------------------
   Table: Order Items Dataset
   -------------------------- */

LOAD DATA LOCAL INFILE 'C:/Users/jason/Desktop/DA Projects/SQL/brazil_ecom/olist_order_items_dataset.csv'
INTO TABLE olist_order_items_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/* -----------------------
   Table: Payments Dataset
   ----------------------- */

LOAD DATA LOCAL INFILE 'C:/Users/jason/Desktop/DA Projects/SQL/brazil_ecom/olist_order_payments_dataset.csv'
INTO TABLE olist_order_payments_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/* ----------------------------
   Table: Order Reviews Dataset
   ---------------------------- */

LOAD DATA LOCAL INFILE 'C:/Users/jason/Desktop/DA Projects/SQL/brazil_ecom/olist_order_reviews_dataset.csv'
INTO TABLE olist_order_reviews_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/* --------------------
   Table: Orders Dataset
   -------------------- */

LOAD DATA LOCAL INFILE 'C:/Users/jason/Desktop/DA Projects/SQL/brazil_ecom/olist_orders_dataset.csv'
INTO TABLE olist_orders_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/* -----------------------
   Table: Products Dataset
   ----------------------- */

LOAD DATA LOCAL INFILE 'C:/Users/jason/Desktop/DA Projects/SQL/brazil_ecom/olist_products_dataset.csv'
INTO TABLE olist_products_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/* ----------------------
   Table: Sellers Dataset
   ---------------------- */

LOAD DATA LOCAL INFILE 'C:/Users/jason/Desktop/DA Projects/SQL/brazil_ecom/olist_sellers_dataset.csv'
INTO TABLE olist_sellers_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/* --------------------------------
   Table: Category Name Translation
   -------------------------------- */

LOAD DATA LOCAL INFILE 'C:/Users/jason/Desktop/DA Projects/SQL/brazil_ecom/product_category_name_translation.csv'
INTO TABLE product_category_name_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;