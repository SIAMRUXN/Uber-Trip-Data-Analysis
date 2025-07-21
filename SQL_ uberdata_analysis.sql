-- Uber Trip Data Exploration

SELECT * FROM uber.uberdataset;

-- Clean the data

ALTER TABLE uber.uberdataset RENAME COLUMN ï»¿START_DATE TO START_DATE;

SELECT * FROM uber.uberdataset
WHERE START_DATE IS NULL
	OR END_DATE IS NULL
    OR CATEGORY IS NULL
	OR `START` IS NULL
    OR `STOP` IS NULL
    OR MILES IS NULL
    OR PURPOSE IS NULL;

-- Count the total number of trips  

SELECT COUNT(*)
FROM uberdataset;

-- total miles traveled

SELECT SUM(MILES)
FROM uberdataset;

-- trips over 50 miles

SELECT *
FROM uberdataset
WHERE MILES > 50;

-- Average Trip Distance By Category/Purpose

SELECT category, AVG(MILES)
FROM uberdataset
GROUP BY category;

SELECT PURPOSE, AVG(MILES)
FROM uberdataset
GROUP BY PURPOSE;

-- Extract month and count number of trips per month

SELECT substring(START_DATE,1,2) `Month`, COUNT(*)
FROM uberdataset
GROUP BY `Month`;

-- top 5 most common purposes and their total mileage.

SELECT PURPOSE, SUM(MILES)
FROM uberdataset
GROUP BY PURPOSE
ORDER BY 2 DESC
LIMIT 5;



