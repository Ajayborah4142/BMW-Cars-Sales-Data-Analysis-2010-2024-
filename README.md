#  BMW Sales Data Analysis (2010–2024)

##  Project Overview

This project provides a **comprehensive analysis of BMW sales data (2010–2024)** using **MySQL**.
It focuses on uncovering **market trends, pricing strategy, product performance, and future investment opportunities**.
The dataset includes variables such as model, region, fuel type, transmission, engine size, mileage, price, and sales volume.

---

##  Database Setup

### 1️ Create Database and Table

A structured database named **`BMW_db`** is created to manage and analyze sales data efficiently.

```sql
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

### 2️ Import Data

```sql
LOAD DATA LOCAL INFILE 'path_to_csv_file.csv'
INTO TABLE bmw_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
```

---

##  Key Objectives

* Understand **regional performance** and identify top-selling markets
* Analyze **pricing and profitability** across models and classifications
* Evaluate **engine, fuel type, and transmission preferences**
* Detect **emerging trends** in electric and hybrid adoption
* Support **strategic decisions** for marketing, production, and pricing

---

##  Analysis Categories & Example Insights

###  Market & Sales Strategy

* **Top Regions by Sales:** Identify which regions generate the most revenue
* **Popular Colors:** Discover color preferences across different regions
* **Fuel Trends:** Electric and hybrid vehicles show strong growth post-2020
* **Yearly Sales Patterns:** Sales volumes peak between 2018–2022

###  Pricing & Profitability

* **Price vs Sales Volume:** Mid-range cars (USD 30K–70K) achieve the best balance
* **Price Sensitivity:** Certain regions respond better to affordable pricing
* **Electric Cars Pricing:** Electric models are priced higher but growing in demand

###  Product & Engineering Insights

* **Engine Size:** Larger engines are preferred in specific markets
* **Mileage Correlation:** Higher engine size generally leads to lower mileage
* **Transmission Trends:** Automatic transmissions dominate in most regions
* **Low-Mileage Premium:** Cars with lower mileage command higher prices

### 🔹 Future Trends & Investments

* **Electric Growth:** Electric sales show exponential rise after 2020
* **Hybrid Demand:** Strong adoption in Europe and Asia-Pacific
* **Diesel Decline:** Noticeable decrease in diesel sales post-2018
* **SUV vs Sedan:** SUVs (X-series) outperform sedans in volume

---

##  Business Insights

1. **Shift toward sustainability:** Electric and hybrid sales are increasing rapidly.
2. **Regional focus:** Europe and North America remain strong, but emerging markets show potential.
3. **Pricing strategy:** Maintaining mid-range pricing drives consistent sales.
4. **Product design:** SUVs and automatic transmissions dominate consumer preferences.
5. **Investment direction:** Future investment should prioritize electric innovation and SUV development.

---

##  Tools Used

* **MySQL** – Data management and query analysis
* **Excel / CSV** – Dataset storage and preprocessing
* **Power BI / Tableau (optional)** – For interactive visualization

---

##  Dataset Description

| Column Name          | Description                                  |
| -------------------- | -------------------------------------------- |
| Model                | BMW model name (e.g., X5, 3 Series)          |
| Year                 | Sales year (2010–2024)                       |
| Region               | Market region (e.g., Europe, Asia, USA)      |
| Color                | Car color                                    |
| Fuel_Type            | Fuel type (Petrol, Diesel, Hybrid, Electric) |
| Transmission         | Transmission type (Automatic/Manual)         |
| Engine_Size_L        | Engine capacity in liters                    |
| Mileage_KM           | Average mileage per car                      |
| Price_USD            | Average price per car                        |
| Sales_Volume         | Number of units sold                         |
| Sales_Classification | Sales performance (High/Medium/Low)          |

---

##  Learning Outcomes

* Designed and structured relational databases in MySQL
* Performed **SQL-based data analysis** and business-driven querying
* Gained insights into **automotive sales, pricing, and engineering decisions**
* Developed analytical thinking and storytelling with SQL results

---

##  Future Enhancements

* Integrate **Python (Pandas + Matplotlib)** for visual analytics
* Build **Power BI dashboard** for interactive KPIs
* Automate report generation for stakeholders
---
## Power Bi Attractive Dashboard PNG 

("")
---

##  Author

**Ajay Borah**
📍 Data Analytics | SQL | Power BI | Python | Business Insights
🔗 *GitHub:* [Ajayborah4142](https://github.com/Ajayborah4142)
