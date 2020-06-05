select customer_id
from Customer2,
     (select @total := COUNT(*) from Product) temp
group by customer_id
having count(distinct product_key) = @total;
