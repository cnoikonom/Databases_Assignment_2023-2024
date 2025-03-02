CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpass';
-- Role: Administrator
-- The administrator has complete control of the entire database.
GRANT ALL PRIVILEGES ON garagedb.* TO 'admin'@'localhost';

CREATE ROLE 'supervisor';
-- Role: Branch supervisor
-- The supervisor oversees his employees, the expenses and the
-- repairs of the branch he is managing.
GRANT SELECT ON garagedb.* TO 'supervisor';
GRANT INSERT ON garagedb.employee TO 'supervisor';
GRANT INSERT ON garagedb.monthly_branch_expenses TO 'supervisor';
GRANT INSERT ON garagedb.repair TO 'supervisor'; 
GRANT UPDATE ON garagedb.employee TO 'supervisor';
GRANT UPDATE ON garagedb.repair TO 'supervisor';
GRANT DELETE ON garagedb.employee TO 'supervisor';
GRANT DELETE ON garagedb.repair TO 'supervisor';

CREATE ROLE 'employee';
-- Role: Branch employee (mechanic)
-- A mechanic, apart from handling repairs, has control over anything
-- regarding spare parts orders.
GRANT SELECT ON garagedb.* TO 'employee';
REVOKE SELECT ON garagedb.monthly_branch_expenses FROM 'employee';
REVOKE SELECT ON garagedb.all_finances FROM 'employee';
GRANT INSERT ON garagedb.repair TO 'employee';
GRANT INSERT ON garagedb.spare_parts_order TO 'employee';
GRANT INSERT ON garagedb.order_includes_part TO 'employee';
GRANT UPDATE ON garagedb.repair TO 'employee';
GRANT UPDATE ON garagedb.spare_parts_order TO 'employee';
GRANT UPDATE ON garagedb.order_includes_part TO 'employee';
GRANT DELETE ON garagedb.spare_parts_order TO 'employee';
GRANT DELETE ON garagedb.order_includes_part TO 'employee';

CREATE ROLE 'customer';
-- Role: Customer
-- The customer can access data about their account and
-- cars, as well as rate branches they have visited
-- and book/update repairs. 
GRANT SELECT ON garagedb.branch TO 'customer';
GRANT SELECT ON garagedb.car TO 'customer';
GRANT SELECT ON garagedb.customer TO 'customer';
GRANT SELECT ON garagedb.customer_rates_branch TO 'customer';
GRANT SELECT ON garagedb.repair TO 'customer';
GRANT INSERT ON garagedb.car TO 'customer';
GRANT INSERT ON garagedb.customer TO 'customer';
GRANT INSERT ON garagedb.customer_rates_branch TO 'customer';
GRANT INSERT ON garagedb.repair TO 'customer';
GRANT UPDATE ON garagedb.car TO 'customer';
GRANT UPDATE ON garagedb.customer TO 'customer';
GRANT UPDATE ON garagedb.repair TO 'customer';
GRANT DELETE ON garagedb.car TO 'customer';

CREATE USER 'supervisor_example'@'localhost' IDENTIFIED BY 'supervisorpass';
CREATE USER 'supervisor_example'@'%' IDENTIFIED BY 'supervisorpass';
GRANT 'supervisor' TO 'supervisor_example'@'localhost';
GRANT 'supervisor' TO 'supervisor_example'@'%';

CREATE USER 'employee_example'@'localhost' IDENTIFIED BY 'mechanicpass';
CREATE USER 'employee_example'@'%' IDENTIFIED BY 'mechanicpass';
GRANT 'employee' TO 'employee_example'@'localhost';
GRANT 'employee' TO 'employee_example'@'%';

CREATE USER 'customer_example'@'localhost' IDENTIFIED BY 'customerpass';
CREATE USER 'customer_example'@'%' IDENTIFIED BY 'customerpass';
GRANT 'customer' TO 'customer_example'@'localhost';
GRANT 'customer' TO 'customer_example'@'%';