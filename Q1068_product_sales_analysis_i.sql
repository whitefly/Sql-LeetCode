--  大水题
select p.product_name, s.year, s.price
from Sales s
         join Product2 p on s.product_id = p.product_id
