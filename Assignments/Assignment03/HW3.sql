/* Satish Upadhyaya, Partner: Matthew Strong*/
/* HW 3, Ajay Kedia, CSCI 3308-205*/

/* No 1. */
SELECT firstname, lastname, country as "Country" FROM employees                                                      
where country!='USA' and hiredate <= '2013-11-10' order by firstname, lastname asc;

/* No 2. */
select productid, productname, unitsinstock, unitprice from products where unitsinstock <= reorderlevel and unitsinstock > 0; 

/* No 3. */
select productname, unitprice from products where unitprice = (select max(unitprice) from products) 
or unitprice = (select min(unitprice) from products);

/* No 4. */
select productid, productname, unitsinstock * unitprice as "Total Inventory Value" 
from products where unitsinstock * unitprice > 1000 order by "Total Inventory Value" desc;

/* No 5. */
select shipcountry, count(shipcountry) from orders where shipcountry != 'Germany' and shippeddate >= '2013/10/01' and 
shippeddate < '2013/11/01' group by shipcountry order by shipcountry desc;

/* No 6. */
select customerid, shipname from orders group by customerid, shipname having count(customerid) >= 10;

/* No 7. */
select sum(unitprice * unitsinstock) as "Value of Inventory", supplierid from products group by supplierid having count(supplierid) > 4;

/* No 8. */
select companyname, productname, unitprice from products, suppliers where                                     
(country = 'USA' or country = 'Germany') and suppliers.supplierid=products.supplierid order by unitprice desc;  

/* No 9. */
select lastname, firstname, title, extension, count(orders.employeeid) as "Number Orders" from orders, employees where orders.employeeid = employees.employeeid 
group by lastname, firstname, title, extension having count(orders.employeeid) > 50 order by lastname desc;

/* No 10. */
select customerid, companyname from customers where customerid not in (select customerid from orders); 

/* No 11. */
select companyname, suppliers.contactname, categoryname, description, productname, unitsonorder from suppliers, products, categories 
where unitsinstock = 0 and suppliers.supplierid=products.supplierid and products.categoryid = categories.categoryid; 

/* No 12. */
select productname, companyname, country, unitsinstock from suppliers, products
where (quantityperunit like '%bags%' or quantityperunit like '%bottles%') and suppliers.supplierid = products.supplierid; 

/* No 13. */
DROP TABLE IF EXISTS Top_Items ;
CREATE TABLE Top_Items
   (
   ItemID         int  unique  NOT NULL , 
   ItemCode       int          NOT NULL ,
   ItemName       varchar(40)  NOT NULL , 
   InventoryDate  timestamp    NOT NULL ,
   SupplierID     int          NOT NULL , 
   ItemQuantity   int          NOT NULL , 
   ItemPrice      decimal(9,2) NOT NULL , 
   PRIMARY KEY  (ItemID)
   ) ;

/* No 14. */
insert into Top_Items (itemid, itemcode, itemname, inventorydate, supplierid, itemquantity, itemprice)
select productid, categoryid, productname, CURRENT_DATE, supplierid, unitsinstock, unitprice from products where (unitprice * unitsinstock) > 1500;

/* No 15. */
delete from top_items where supplierid in (select top_items.supplierid from top_items, 
suppliers where (country = 'USA' or country = 'Canada') and top_items.supplierid = suppliers.supplierid);

/* No 16. */
alter table top_items
add InventoryValue decimal(9, 2);

/* No 17. */
update top_items
set inventoryvalue=itemquantity * itemprice;

/* No 18. */
drop table top_items;