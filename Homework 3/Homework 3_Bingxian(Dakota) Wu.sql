-- Question 1

select country, count(*) number_of_customers
from Customers
group by country
order by number_of_customers desc
limit 5

-- Question 2

select C.CategoryName, count(*) total_products
from Products P
join Categories C
on P.CategoryID = C.CategoryID
group by C.CategoryName

-- Question 3

select ProductID, ProductName
from Products 
where UnitsInStock + UnitsOnOrder <= ReorderLevel and Discontinued = 0

-- Question 4

select date_part('year', O.ShippedDate) ship_year, count(*) total
from Orders O
join Shippers S
on O.ShipVia = S.ShipperID
where date_part('year', O.ShippedDate) = 1997 and S.CompanyName = 'United Package'
group by ship_year

-- Question 5

select ShipCountry, avg(Freight) average_freight
from Orders 
where date_part('year', OrderDate) = 1996
group by ShipCountry
order by average_freight desc
limit 3

-- Question 6

select E.LastName, E.FirstName, count(*) as total_late_orders
from Orders as O
join Employees as E
on E.employeeid = O.employeeid
where O.RequiredDate <= O.ShippedDate
group by E.Employeeid
having count(*) >= 5

-- OR

with table1 as(
	select EmployeeID, count(*) total_late_orders
	from Orders
	where RequiredDate <= ShippedDate 
	group by EmployeeID
	having count(*) >= 5)

select E.LastName, E.FirstName, total_late_orders
from Employees E
join table1 T
on E.EmployeeID = T.EmployeeID

-- Question 7

select C.CompanyName, O.OrderID, sum(OD.UnitPrice * OD.Quantity * (1-OD.Discount)) total_order_amount
from Customers C
join Orders O
on C.CustomerID = O.CustomerID
join OrderDetails OD
on O.OrderID = OD.OrderID
where date_part('year', O.OrderDate) = 1996 
group by C.CompanyName, O.OrderID
having sum(OD.UnitPrice * OD.Quantity * (1-OD.Discount)) >= 10000




