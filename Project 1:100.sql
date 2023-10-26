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

select sum(amount) as "total amount",customernumber from payments group by customernumber;
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


select* from products;
select productcode, productline from products order by productline;

select ordernumber, customernumber from orders; -- link dengan table customers untuk tau order dekat setiap region
select ordernumber, productcode from orderdetails order by ordernumber; 
select productcode, productline from products;
-- linkkan table ni
-- productline (products) ke 
-- productcode (products,orderdetails) ke 
-- ordernumber (ordersetails,orders) ke 
-- customernumber (orders,customers) ke 
-- country (customers)
