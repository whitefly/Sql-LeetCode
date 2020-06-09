-- 组内分开统计即可, 中等题?
select  sale_date  sum(if(fruit='apples',sold_num,-sold_num)) as diff
from Sales
group  by sale_date
order by sale_date
