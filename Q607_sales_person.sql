select `name` from salesperson where
not exists (
    select * from orders join company  on company.com_id =  orders.com_id  and company.name='RED'
    where orders.sales_id=salesperson.sales_id
)