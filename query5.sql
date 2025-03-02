-- Customers who don't own a certain car (for example a Citroen C1), yet have given a branch
-- a low rating (below 5)

SELECT customer.customerId, customer.name, customer_rates_branch.idBranch, customer_rates_branch.rating
FROM garagedb.customer JOIN garagedb.car ON customer.customerId = car.ownerId
                 JOIN garagedb.customer_rates_branch ON customer_rates_branch.customerId = customer.customerId
WHERE rating < 5 AND model != 'C1' AND manufacturer != 'Citroen';