-- Question 1

select vendname 
from Vendors
where vendcity in ('Bellevue','Ballard','Redmond');

-- Question 2

select P.ProductName, PV.WholesalePrice, V.VendName
from Products P
join Product_Vendors PV
on P.ProductNumber = PV.ProductNumber
join Vendors V
on PV.VendorID = V.VendorID
where PV.WholesalePrice < 100;

-- Question 3

select C.CustFirstName, C.CustLastName, P.ProductName
from Customers C
join Orders O
on C.CustomerID = O.CustomerID
join Order_Details OD
on O.OrderNumber = OD.OrderNumber
join Products P
on OD.ProductNumber = P.ProductNumber
where P.ProductName like '%Helmet%';

-- Question 4

select V.VendName, V.VendState, V.VendPhoneNumber
from Products P
join Product_Vendors PV
on P.ProductNumber = PV.ProductNumber
join Vendors V
on PV.VendorID = V.VendorID
where P.ProductName = 'Shinoman 105 SC Brakes'
order by PV.DaysToDeliver 
limit 1;

-- Question 5

select P.ProductName
from Order_Details OD
right join Products P
on OD.ProductNumber = P.ProductNumber 
where OD.ProductNumber is Null

-- Question 6

select O.OrderNumber, O.ShipDate, OD.QuotedPrice * OD.QuantityOrdered as Revenue
from Order_Details OD
join Orders O
on OD.OrderNumber = O.OrderNumber 
where O.ShipDate between ('2018-01-01') and ('2018-01-31')

-- Question 7

select C.CustFirstName, C.CustLastName, C.CustPhoneNumber
from Customers C
join Orders O
on C.CustomerID = O.CustomerID
join Order_Details OD
on O.OrderNumber = OD.OrderNumber
join Products P
on OD.ProductNumber = P.ProductNumber 
where P.ProductName = 'Shinoman Deluxe TX-30 Pedal';

