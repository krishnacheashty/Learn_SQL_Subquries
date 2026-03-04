			-- Task 01

--Find the products that have a price higher than 
--the average price of all products
SELECT
*
FROM(
	SELECT
	P.ProductID,
	P.Price,
	AVG(P.Price) OVER() AvgPrice
FROM Sales.Products AS P
)t
where Price >AvgPrice;

--Rank customers based on their total amount of sales
SELECT 
*,
RANK() OVER(ORDER BY TotalSum DESC) rankSales
FROM(
	SELECT
	CustomerID,
	SUM(Sales) TotalSum
	FROM Sales.Orders
	GROUP BY CustomerID
)t 


--select subquery
/*used to aggregate data side by side with the -
main query's data,allowing for direct comparison
--> Rule: only scalar subquries are allowed tobe used
*/

--					task-3
--show the product IDs, product name, prices, and the total number of orders.

SELECT 
	ProductID,
	Product,
	Price,
	--subquery
	(SELECT COUNT(*) TotalOrders FROM Sales.Orders) AS TotalOrders
FROM Sales.Products


--					join clause
/* join subquery
-->used to prepare the data(filterin or aggregation) before
joining it with other tables.*/

--					Task-4
-- Show all customer details and find the total orders of
-- each customer
--MAIN QUERY
SELECT
C.*,
O.TotalCount
FROM Sales.Customers C
LEFT JOIN(
	SELECT
	CustomerID,
	COUNT(*) TotalCount
	FROM Sales.Orders O
	GROUP BY CustomerID) o
ON C.CustomerID= O.CustomerID

/*					WHERE SUBQUERY

Used for complex filtering logic logic and makes query
more flexible and dynamic.

Rules: Only Scalar Subqueries are allowed to be used
*/

--					Task-4
--find the products that have a price higher than the 
--average price of all products.

SELECT
ProductID,
Price,
(SELECT AVG(Price) FROM Sales.Products) AvgPrice
FROM Sales.Products
WHERE Price > (SELECT AVG(Price) FROM Sales.Products)


