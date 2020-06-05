select buyer_id
from Sales2 s,
     (select @S8_id := product_id from Product3 where product_name = 'S8') temp1,
     (select @iphone_id := product_id from Product3 where product_name = 'iPhone') temp2
group by s.buyer_id
having sum(s.product_id = @S8_id)>0 and   sum(s.product_id = @iphone_id)=0





