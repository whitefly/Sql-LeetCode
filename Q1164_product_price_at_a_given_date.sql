-- 求组内最新的价格一样的题目
select t1.product_id, ifnull(new_price.new_price, 10) as price
from (select distinct product_id from Products4 p2) t1
         left join
     (select product_id, new_price
      from Products4 p1
      where (p1.product_id, p1.change_date) in
            (select product_id, max(change_date)
             from Products4 p
             where p.change_date <= '2019-08-16 '
             group by product_id)) new_price on t1.product_id = new_price.product_id



