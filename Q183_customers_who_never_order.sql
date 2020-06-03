-- select  `Name` as Customers   from Customers
--     where  not exists (select  *  from Orders where Customers.Id=Orders.id );

-- 使用左链接,找出null值(就是没有匹配上的)

select  `Name`  as Customers
from Customers  left join  Orders
    on  Customers.id=Orders.CustomerId where  Orders.id is null
