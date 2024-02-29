/**Cerat New Database**/
CREATE DATABASE project2; 
USE project2;
/**Modify the data type of a column in a table**/
ALTER TABLE Car_Sales
ALTER COLUMN DATE DATE;

SELECT * FROM Car_Sales;

                                           /*******  SQL Queries For The First Report  *******/

/**What are the most popular car Company**/
SELECT  Company,COUNT(Company) AS 'count of car by company '
FROM Car_Sales
GROUP BY Company
ORDER BY 'count of car by company ' DESC ;

/**the relationship between the car's color and Gender**/
SELECT Gender,Color,COUNT(Color) as CONUTE
FROM Car_Sales 
GROUP BY Gender,Color
ORDER BY Color,Gender;

/** identify any patterns in customer preferences based on their gender And income level using the available data **/
SELECT   top(5)Gender,Color,Model, COUNT(Model)as vv
FROM Car_Sales
WHERE Gender='Female'
GROUP BY Gender,Model,Color
ORDER BY vv DESC ;

/**What are the top ten best-selling models among customers**/
SELECT TOP (10) Model,Company,COUNT(Model)AS 'Count CARS'
FROM Car_Sales
GROUP BY Company,Model
ORDER BY [Count CARS]DESC;

/** Determine the most popular (engine type, transmission, body style) among customers **/ 
SELECT Engine,COUNT(Engine)AS COUNT_OF_Engine
FROM Car_Sales
GROUP BY Engine;

SELECT Transmission,COUNT(Transmission)AS COUNT_OF_Transmission
FROM Car_Sales
GROUP BY Transmission;

SELECT [Body Style],COUNT([Body Style])AS 'COUNT_OF_Body Style'
FROM Car_Sales
GROUP BY [Body Style];

                                           /*******  SQL Queries For The Second Report  *******/

/** How Do The Type, Model And Other Characteristics Of The Car Affect Its Price **/
SELECT [Body Style],Engine,Transmission,ROUND(AVG([Price ($)]),2)AS Price
FROM Car_Sales
GROUP BY [Body Style],Engine,Transmission
ORDER BY [Body Style],Engine,Transmission DESC;

/** The difference between total prices and average annual income in each region **/
SELECT Dealer_Region,ROUND(SUM([Price ($)]),2)AS 'PRICE',ROUND(AVG([Annual Income]),2)AS'AVG Annual Income'
FROM Car_Sales
GROUP BY Dealer_Region;
/** Sum Price By Dealer Name **/
SELECT Dealer_Name,ROUND(SUM([Price ($)]),2)AS 'PRICE'
FROM Car_Sales
GROUP BY Dealer_Name
ORDER BY Dealer_Name;

                                           /*******  SQL Queries For The Third Report  *******/

SELECT Dealer_Region,Dealer_Name,ROUND(SUM([Price ($)]),2)AS 'PRICE'
FROM Car_Sales
GROUP BY Dealer_Region,Dealer_Name
ORDER BY Dealer_Region,PRICE DESC;

SELECT Dealer_Name,COUNT(Dealer_Name)AS Cuont,SUM([Price ($)])AS PRICE
FROM Car_Sales
GROUP BY  Dealer_Name
ORDER by PRICE DESC;

                                           /*******  SQL Queries For The Fourth Report  *******/

SELECT Company,SUM([Price ($)])AS PRICE,Date
FROM Car_Sales
GROUP BY Company,Date
ORDER BY Company;

SELECT SUM([Price ($)])AS PRICE,Date
FROM Car_Sales
GROUP BY Date;

SELECT Dealer_Region,Date,SUM([Price ($)])AS PRICE
FROM Car_Sales
GROUP BY Dealer_Region,Date
ORDER BY Date;