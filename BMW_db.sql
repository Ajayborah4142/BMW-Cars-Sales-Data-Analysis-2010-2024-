## Create Database 

DROP DATABASE IF EXISTS BMW_db;
CREATE DATABASE BMW_db;

USE BMW_db;

## Create Table 

DROP TABLE IF EXISTS bmw_sales;
CREATE TABLE bmw_sales (
Model VARCHAR(20) ,
Year INT ,
Region VARCHAR(20) ,
Color VARCHAR(20) ,
Fuel_Type VARCHAR(20) ,
Transmission VARCHAR(50) ,
Engine_Size_L FLOAT ,
Mileage_KM INT ,
Price_USD INT ,
Sales_Volume INT ,
Sales_Classification VARCHAR(20)


);

## Import Data 

SET GLOBAL LOCAL_INFILE=ON;
LOAD DATA LOCAL INFILE "C:/Users/Lenovo/OneDrive/Documents/SQL Programming/BMW sales data (2010-2024) (1) (1).csv"  INTO TABLE bmw_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


SELECT * FROM bmw_sales ;

 -- ------------------------ Market & Sales Strategy -----------------------------

## Q.1) Which regions generate the highest sales volume?

SELECT Region, SUM(Sales_Volume) AS Total_Sales 
FROM bmw_sales 
GROUP BY Region
ORDER BY Total_Sales DESC ;


## Q.2) Which models consistently have high sales classification?

SELECT Model, SUM(Sales_Volume) AS Total_Sales 
FROM bmw_sales 
WHERE Sales_Classification = 'High'
GROUP BY Model
ORDER BY Total_Sales DESC ;

## Q.3)  Which colors are most popular by region?

SELECT Region, Color, 
       COUNT(*) AS Total_Count
FROM bmw_sales
GROUP BY Region, Color
ORDER BY Total_Count DESC ;

## Q.4) Are electric and hybrid cars gaining more sales in recent years?

SELECT Fuel_Type, Year, 
       SUM(Sales_Volume) AS Total_Sales 
FROM bmw_sales
WHERE Fuel_Type IN('electric','hybrid')
GROUP BY Fuel_Type, Year
ORDER BY Year DESC ,
		 Total_Sales DESC ;

## Q.5) Do newer or older cars sell more?

SELECT Year, SUM(Sales_Volume) AS total_sales
FROM bmw_sales
GROUP BY Year
ORDER BY Year DESC ;

-- ------------------------------- 🔹 Pricing & Profitability  ---------------------------------

## Q.6) Average price range of high vs low sales cars?

SELECT Sales_Classification, AVG(Price_USD) AS avg_price, 
       MIN(Price_USD) AS min_price, 
       MAX(Price_USD) AS max_price
FROM bmw_sales
GROUP BY Sales_Classification;

## Q.7) Do lower-priced cars generate higher sales volume?

SELECT CASE
         WHEN Price_USD < 30000 THEN 'Budget'
         WHEN Price_USD BETWEEN 30000 AND 70000 THEN 'Mid-Range'
         ELSE 'Premium'
       END AS Price_Category,
       AVG(Sales_Volume) AS avg_sales
FROM bmw_sales
GROUP BY Price_Category
ORDER BY avg_sales DESC;

## Q.8) Which regions are more price-sensitive? 

SELECT Region, AVG(Price_USD) AS avg_price, SUM(Sales_Volume) AS total_sales
FROM bmw_sales
GROUP BY Region
ORDER BY avg_price ASC;


## Q.9) Are electric cars overpriced compared to petrol/diesel?

SELECT Fuel_Type, AVG(Price_USD) AS Avg_Price ,
       AVG(Sales_Volume) AS Avg_Sales_Volume
FROM bmw_sales
WHERE Fuel_Type IN ('Electric', 'Petrol', 'Diesel')
GROUP BY Fuel_Type ;

## Q.10) Should we reduce prices in low-sales regions?

SELECT Region, AVG(Price_USD) AS Avg_Sales ,
       SUM(Sales_Volume) AS Total_Sales
FROM bmw_sales
WHERE Sales_Classification = 'Low'
GROUP BY Region
ORDER BY Total_Sales ;

-- ---------------------------- Product & Engineering Decisions ----------------------------

## Q.11) Preferred engine sizes in different regions

SELECT Region, 
       ROUND(AVG(Engine_Size_L),1) AS  avg_engine_size
FROM bmw_sales
GROUP BY Region
ORDER BY avg_engine_size DESC ;

## Q.12)  Correlation check: engine size vs mileage

SELECT Engine_Size_L AS Avg_Engine_Size_L ,
       ROUND(AVG(Mileage_KM),1) AS Avg_Mileage_KM 
FROM bmw_sales 
GROUP BY Engine_Size_L
ORDER BY Avg_Mileage_KM DESC ;

## Q.13)  Transmission preference by region

SELECT Region, Transmission,
       COUNT(*) AS Count 
FROM bmw_sales
GROUP BY Region, Transmission 
ORDER BY Region ASC ,
         Count DESC ;

## Q.14)  Do low-mileage cars sell at higher prices?

SELECT Model, ROUND(AVG(Mileage_KM),1) AS Avg_Mileage_KM , 
       ROUND(AVG(Price_USD),1) AS Avg_Price_USD
FROM bmw_sales
GROUP BY Model
ORDER BY Avg_Mileage_KM ASC ,
         Avg_Price_USD DESC ;

## Q.15)  Which fuel type balances price, mileage, and sales?

SELECT Fuel_Type,
       AVG(Price_USD) AS Avg_Price_USD ,
       AVG(Mileage_KM) AS Avg_Mileage_KM ,
       AVG(Sales_Volume) AS Avg_Sales_Volume
FROM bmw_sales
GROUP BY Fuel_Type
ORDER BY Avg_Price_USD ASC ,
         Avg_Mileage_KM ASC ,
         Avg_Sales_Volume ASC ;


-- ---------------------------- Future Trends & Investments ----------------------------

## Q.16)  Sales trend of electric cars over years

SELECT Year, 
       SUM(Sales_Volume) AS Toal_Sales_Volume
FROM bmw_sales
WHERE Fuel_Type = 'Electric'
GROUP BY Year 
ORDER BY Year ASC ;


## Q.17)  Hybrid adoption by region

SELECT Region, SUM(Sales_Volume) AS hybrid_sales
FROM bmw_sales
WHERE Fuel_Type = 'Hybrid'
GROUP BY Region
ORDER BY hybrid_sales DESC;

## Q.18)  Are diesel cars declining?

SELECT Year, SUM(Sales_Volume) AS diesel_sales
FROM bmw_sales
WHERE Fuel_Type = 'Diesel'
GROUP BY Year
ORDER BY Year ASC;

## Q.19)  Sales comparison: new (2020+) vs older models

SELECT CASE
         WHEN Year >= 2020 THEN 'New Models'
         ELSE 'Old Models'
       END AS Model_Age,
       SUM(Sales_Volume) AS total_sales
FROM bmw_sales
GROUP BY Model_Age;

## Q.20)  SUV vs Sedan demand (based on Model name containing 'X' for SUVs and 'Series' for Sedans)

SELECT CASE
       WHEN Model LIKE '%X%' THEN 'SUVs' 
	   WHEN Model LIKE '%Series%' THEN 'Sedans' 
       ELSE 'Others'
       END AS Car_Type,
       ROUND(AVG(Sales_Volume),1) AS Avg_Sales_Volume
FROM bmw_sales
GROUP BY Car_Type
ORDER BY Avg_Sales_Volume DESC ;
 
