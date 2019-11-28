select P.PRODUCTID, P.PRODUCTDESCRIPTION
from PRODUCT_T P JOIN ORDERLINE_T OL ON P.PRODUCTID = OL.PRODUCTID
where OL.orderedquantity > 10
order by P.productdescription;

SELECT COUNT(*)
FROM ORDER_T O JOIN SALESPERSON_T SP ON O.SALESPERSONID = SP.SALESPERSONID JOIN CUSTOMERSHIPADDRESS_T CA ON CA.SHIPADDRESSID = O.SHIPADRSID
WHERE CA.SHIPSTATE = 'NJ' AND SP.SALESPERSONNAME = 'Pepe Lepue';

select p.productdescription, sum(ol.orderedquantity)
from product_t p join productline_t pl on p.productlineid = pl.productlineid join ORDERLINE_T ol on p.productid = ol.productid
where pl.productlinename = 'Antique'
group by p.productdescription
order by p.PRODUCTDESCRIPTION;

select c.customername, count(*)
from customer_t c join order_t o on c.customerid = o.customerid
group by c.customerid, c.customername
having count(*) > 5
order by c.customername;

select c.customername
from customer_t c join order_t o on c.customerid = o.customerid
where extract(year from o.orderdate)='2009'
intersect
select c.customername
from customer_t c join order_t o on c.customerid = o.customerid
where extract(year from o.orderdate)='2010';

select p.productid, p.productdescription
from product_t p join orderline_t ol on p.productid = ol.productid join order_t o on o.orderid = ol.orderid
minus
select p.productid, p.productdescription
from product_t p join orderline_t ol on p.productid = ol.productid join order_t o on o.orderid = ol.orderid
where extract(year from o.orderdate)='2010';

