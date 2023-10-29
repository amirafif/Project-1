use classicmodels;
select* from customers;
select country, state, postalcode, creditlimit, customernumber from customers order by country;
select count(country) from customers where country in ('Australia','New Zealand');
select count(country) from customers where country in ('USA','Canada');
select count(country) from customers where country in ('South Africa');
select count(country) from customers where country in ('Hong Kong','Israel','Japan','Philippines','Russia','Singapore');
select count(country) from customers where country in ('Austria','Belgium','Denmark','Finland','France','Germany','Ireland','Italy','Netherlands','Norway','Poland','Portugal','Spain','Sweden','Switzerland','UK');
-- no. of customers from every region

select country from customers group by country;
select count(*), country from customers group by country; -- sama
select count(country), country from customers group by country; -- sama
-- no. of customers from every country

select* from payments;
select sum(amount) as "total amount", customernumber from payments group by customernumber;
-- total payment each customer paid

select payments.customernumber, sum(payments.amount), customers.country
from customers 
inner join payments on customers.customernumber=payments.customernumber
group by customernumber order by country;
-- total payment each customer paid on every country

select sum(payments.amount), customers.country
from customers 
inner join payments on customers.customernumber=payments.customernumber
group by country order by country;
-- total payment paid on each country

select* from customers;
select* from employees;
select concat(firstName,"",lastName) as 'Full name'from employees;
select customers.customernumber, customers.country, employees.employeeNumber, concat(firstName,"",lastName) as 'Full name'
from customers
left join employees
on customers.salesRepEmployeeNumber=employees.employeeNumber
order by country; -- looking at customer that deals with each employee by country
select count(employees.employeeNumber), concat(firstName,"",lastName) as 'Full name'
from customers
left join employees
on customers.salesRepEmployeeNumber=employees.employeeNumber
group by employeeNumber; -- looking at total customers each employee have to deal (22 customers don't provide employeenumber)

select* from employees;
select* from offices;
select concat(firstName,"",lastName) as 'Full name',  employees.email,employees.employeeNumber, offices.phone, concat(addressLine1,"",postalCode,"",city,"",country) as 'officeLocation'
from employees
inner join offices
on employees.officeCode=offices.officeCode;
-- every employees and its offices' contact information

select* from orderdetails;
select productCode, quantityOrdered from orderdetails order by productCode;
select productCode, sum(quantityOrdered) as total_quantity_Ordered from orderdetails group by productCode; -- total quantity of all products ordered
select* from orders where status='Shipped' or status='In Process' or status='On Hold' order by orderNumber; -- all valid orders
select count(status), status from orders group by status; -- no. of all order status' 
select* from orders where not status ='shipped' order by customerNumber; -- details of unshipped orders

select* from products;
select productCode, productLine, quantityInStock from products order by productLine;
select sum(quantityInStock) as total_stock_quantity, productLine from products group by productLine; -- total stock quantity on each produtline

select orderdetails.productCode, sum(orderdetails.quantityOrdered) as total_quantity_Ordered, products.productLine, products.productName
from orderdetails
inner join products on orderdetails.productCode = products.productCode
group by productCode; -- total quantity ordered on each product

select orderdetails.orderNumber, orderdetails.productCode, orderdetails.quantityOrdered, orders.customerNumber
from orderdetails
inner join orders on orderdetails.orderNumber = orders.orderNumber;


-- orderdetails & products (productCode) to get productline
-- orderdetails & orders (orderNumber) to get customernumber
-- orders & cusotomers (customerNumber) to get country


