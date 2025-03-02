-- List of employees of a certain branch, whose contracts expire
-- within the next 12 months

SELECT name AS Name, ssn AS SSN
FROM garagedb.employee
WHERE conEndDate < DATE(CURDATE() + INTERVAL 1 YEAR) AND branchId = '472489';