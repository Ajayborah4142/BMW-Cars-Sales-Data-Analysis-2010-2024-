# BMW Sales Data Analysis (2010–2024)

This project explores **BMW sales data** from 2010–2024 (~50,000 rows). The goal is to analyze sales trends, pricing strategies, customer preferences, and regional market performance using **MySQL**.

---

##  Project Overview

* **Database**: `BMW_db`
* **Table**: `bmw_sales`
* **Records**: ~50,000
* **Columns**:

  * `Model`
  * `Year`
  * `Region`
  * `Color`
  * `Fuel_Type`
  * `Transmission`
  * `Engine_Size_L`
  * `Mileage_KM`
  * `Price_USD`
  * `Sales_Volume`
  * `Sales_Classification`

---

##  Setup Instructions

1. Create database and table structure:

   ```sql
   DROP DATABASE IF EXISTS BMW_db;
   CREATE DATABASE BMW_db;
   USE BMW_db;

   CREATE TABLE bmw_sales (
     Model VARCHAR(20),
     Year INT,
     Region VARCHAR(20),
     Color VARCHAR(20),
     Fuel_Type VARCHAR(20),
     Transmission VARCHAR(50),
     Engine_Size_L FLOAT,
     Mileage_KM INT,
     Price_USD INT,
     Sales_Volume INT,
     Sales_Classification VARCHAR(20)
   );
   ```

2. Enable local file import:

   ```sql
   SET GLOBAL LOCAL_INFILE=ON;
   ```

3. Load CSV data:

   ```sql
   LOAD DATA LOCAL INFILE "BMW_sales_data.csv"
   INTO TABLE bmw_sales
   FIELDS TERMINATED BY ','
   ENCLOSED BY '"'
   LINES TERMINATED BY '\r\n'
   IGNORE 1 LINES;
   ```

---

##  Key Business Questions

1. Which **regions** generate the highest sales volume?
2. Which **models** consistently achieve high sales?
3. What **colors** are most popular by region?
4. Are **electric/hybrid cars** gaining more sales recently?
5. Do **lower-priced cars** generate higher sales volume?
6. Which **engine sizes** are preferred in different regions?
7. Are some regions more **price-sensitive** than others?
8. Should prices be adjusted in **low-sales regions**?

---

##  Example Insights

* Electric/hybrid adoption trends (2010–2024).
* Regional demand patterns (Europe vs Asia vs North America).
* Pricing strategy: budget vs premium categories.
* Market segmentation based on **engine size & fuel type**.

---

##  Tools Used

* **MySQL** (queries & database design)
* **CSV dataset** (BMW sales 2010–2024)
* **GitHub** (project version control & sharing)

---

##  Next Steps

* Build **Power BI / Tableau dashboard** for visualization.
* Apply **predictive modeling** on sales classification.
* Extend dataset with competitor brands for comparison.

---

## 👨‍💻 Author

Created by **Ajay Borah** as part of a hands-on **SQL + Business Analytics** project.

