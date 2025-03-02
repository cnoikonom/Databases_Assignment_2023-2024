-- Number of customers who created their accounts within the last 12 months

SELECT COUNT(customerId) AS 'Number of Customers'
FROM garagedb.customer
WHERE accCreationDate > CURDATE() - INTERVAL 1 YEAR;