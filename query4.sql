-- Contact details of customers with upcoming repairs for their modified cars 

SELECT customer.customerId, customer.name, customer.phoneNum, customer.email
FROM garagedb.car JOIN garagedb.repair   ON repair.carPlateNum = car.licensePlateNum
              JOIN garagedb.customer ON customer.customerId = car.ownerId
WHERE repair.date > CURDATE() AND repair.branch_Id = '478923' AND car.isModified = 'Yes';