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