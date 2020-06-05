-- 经典题目: 组内最小
select product_id, `year` as first_year, quantity, price
from Sales s1
where (s1.product_id, s1.year) in (
    select s2.product_id, min(s2.year)
    from Sales s2
    group by s2.product_id);
