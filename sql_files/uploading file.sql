SET GLOBAL local_infile = 1;            --  Allows MySQL to read files from your local machine
SHOW VARIABLES LIKE 'local_infile';   --  local_infile is a MySQL switch (a setting). ON → MySQL is allowed to read files from your computer, OFF → MySQL is not allowed to read local files

SET autocommit = 0;           --  Disables automatic commit after each row. Autocommit ON = very slow imports, Autocommit OFF = bulk insert (fast)
SET foreign_key_checks = 0;    -- Temporarily disables foreign key validation. Prevents MySQL from checking parent tables row by row
SET unique_checks = 0;           -- Disables uniqueness checks on indexed columns. MySQL doesn’t check duplicates during load

LOAD DATA LOCAL INFILE 'C:/Users/mohit/Documents/SQL_files/DataAnalytics_SQL_Project/dataset/dim_customers.csv'
INTO TABLE dim_customers   
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/mohit/Documents/SQL_files/DataAnalytics_SQL_Project/dataset/dim_products.csv'
INTO TABLE dim_products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE
'C:/Users/mohit/Documents/SQL_files/DataAnalytics_SQL_Project/dataset/fact_sales.csv'
INTO TABLE fact_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


COMMIT;

SET foreign_key_checks = 1;
SET unique_checks = 1;
SET autocommit = 1;








