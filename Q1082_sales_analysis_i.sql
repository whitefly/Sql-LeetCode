# Write your MySQL query statement below

select s.seller_id
from Sales s,
     (select @max_amount := sum(s2.price) from Sales s2 group by s2.seller_id order by 1 desc limit 1) temp
group by s.seller_id
having sum(s.price) = @max_amount