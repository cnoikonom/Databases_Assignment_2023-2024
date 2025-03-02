-- List of customers who created their accounts within the last 12 months

SELECT *
FROM garagedb.customer
WHERE accCreationDate > CURDATE() - INTERVAL 1 YEAR;