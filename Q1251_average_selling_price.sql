select u.product_id, round(sum(units * p.price)/sum(units),2 ) as average_price
from UnitsSold u
         join Prices p on u.product_id = p.product_id and u.purchase_date between p.start_date and p.end_date
group by u.product_id
