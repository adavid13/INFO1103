select distinct p.productid, p.productdescription
from product_t p join orderline_t o
     on p.productid = o.productid
where orderedquantity>10;
order by p.productdescription


select count(*)
from salesperson_t s join order_t o
     on s.salespersonid = o.salespersonid
     join customershipaddress_t sa
     on o.shipadrsid=sa.shipaddressid
where s.salespersonname = 'Pepe Lepue' and sa.shipstate='NJ';


select p.productdescription, sum(orderedquantity)
from productline_t pl join product_t p
     on pl.productlineid = p.productlineid
     join orderline_t o
     on o.productid = p.productid
where pl.productlinename = 'Antique'
group by p.productdescription
order by p.productdescription;


select c.customername, count(*)
from customer_t c join order_t o
     on c.customerid = o.customerid
group by c.customername
having count(*)>5
order by customername;


select c.customername
from customer_t c join order_t o
     on c.customerid = o.customerid
where extract(year from o.orderdate) = 2009
intersect
select c.customername
from customer_t c join order_t o
     on c.customerid = o.customerid
where extract(year from o.orderdate) = 2010;


select distinct productid, productdescription
from product_t 
minus
select distinct p. productid, p.productdescription
from order_t o join orderline_t ol
     on o.orderid = ol.orderid
     join product_t p
     on ol.productid = p.productid
where extract(year from o.orderdate) = 2010;


