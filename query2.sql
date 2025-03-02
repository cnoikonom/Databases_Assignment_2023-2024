-- Average rating for each branch

SELECT idBranch, AVG(rating) AS 'Average Rating'
FROM garagedb.customer_rates_branch
GROUP BY idBranch;