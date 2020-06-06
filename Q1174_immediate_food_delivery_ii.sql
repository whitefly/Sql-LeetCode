select round(sum(isFirst)*100 / count(isFirst), 2) as immediate_percentage
from (select customer_id, min(order_date) = min(customer_pref_delivery_date) as isFirst
      from Delivery
      group by customer_id) t