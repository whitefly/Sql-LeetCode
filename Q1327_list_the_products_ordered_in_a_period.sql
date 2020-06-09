-- 水题
select product_name, sum(unit) as unit from
Products p join  Orders o on p.product_id = o.product_id
and order_date between '2020-02-01' and '2020-02-29'
group by product_name
having sum(unit)>=100