select b.book_id, any_value(b.name) as `name`
from Books B
         left join Orders o on o.book_id = B.book_id and
                               o.dispatch_date >= '2018-06-23'
where B.available_from < '2019-05-23'
group by b.book_id
having ifnull(sum(o.quantity), 0) < 10

