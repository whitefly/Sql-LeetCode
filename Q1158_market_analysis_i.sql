select u.user_id as buyer_id, any_value(u.join_date) as join_date , count(o.order_id) as orders_in_2019
from Users2 u
         left join Orders2 o on u.user_id = o.buyer_id and o.order_date between '2019-01-01' and '2019-12-31'
group by u.user_id


