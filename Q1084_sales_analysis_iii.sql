select p.product_id, p.product_name
from Product p
where p.product_id not in (
    select distinct s.product_id
    from Sales s
    where s.sale_date not  between '2019-01-01' and '2019-03-31'
)