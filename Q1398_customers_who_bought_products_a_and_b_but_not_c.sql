--  组内分开统计即可
select o.customer_id, any_value(c.customer_name) as customer_name
from Orders3 o
         join Customers2 c on o.customer_id = c.customer_id
group by o.customer_id
having sum(product_name = 'A') > 0
   and sum(product_name = 'B') > 0
   and sum(product_name = 'C') = 0
