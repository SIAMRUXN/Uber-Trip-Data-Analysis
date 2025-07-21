-- Store Sale Data Exploration 

SELECT * FROM store_sale_project.stores;


-- Clean the data

ALTER TABLE store_sale_project.stores
RENAME COLUMN `Store ID` to `Store_ID`;

SELECT * FROM store_sale_project.stores
WHERE Store_ID IS NULL
	OR Store_Area IS NULL
    OR Items_Available IS NULL
	OR Daily_Customer_Count IS NULL
    OR Store_Sales IS NULL;
        

-- Find the average Store_Sales for all stores

SELECT AVG(Store_Sales) FROM stores;

-- all stores where Daily_Customer_Count is greater than 600.

SELECT * FROM stores
WHERE  Daily_Customer_Count > 600;

-- Group stores by sales performance buckets

SELECT Store_ID, Store_Sales,
CASE
	WHEN Store_Sales > 60000 THEN "High"
    WHEN Store_Sales >= 40000 AND Store_Sales <= 60000 THEN "Medium"
    ELSE "Low"
END SORT
FROM stores
ORDER BY 3,1;

-- Count how many stores fall into each category

WITH COUNT_SORT AS
(
SELECT Store_ID, Store_Sales,
CASE
	WHEN Store_Sales > 60000 THEN "High"
    WHEN Store_Sales >= 40000 AND Store_Sales <= 60000 THEN "Medium"
    ELSE "Low"
END SORT
FROM stores
ORDER BY 3,1
)
SELECT SORT, COUNT(Store_ID) count
FROM COUNT_SORT
GROUP BY SORT;

-- Rank the top 10 stores by Store_Sales.

SELECT * FROM stores
ORDER BY 5 DESC
LIMIT 10;



