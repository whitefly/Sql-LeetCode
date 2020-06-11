select t1.user_id as seller_id, ifnull(result, 'no') as 2nd_item_fav_brand
from Users2 t1
         left join
     (select any_value(o1.seller_id)                                              as seller_id,
             if(any_value(u.favorite_brand) = any_value(item_brand), 'yes', 'no') as result
      from Orders2 o1
               join Orders2 o2 on o1.order_date >= o2.order_date and o1.seller_id = o2.seller_id
               join Users2 u on u.user_id = o1.seller_id
               join Items i on i.item_id = o1.item_id
      group by o1.order_id
      having count(*) = 2) flag on t1.user_id = flag.seller_id