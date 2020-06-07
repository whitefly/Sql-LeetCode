-- 注意求时间的差值直接用 - 号 会导致错误
select c1.visited_on, sum(c2.amount) as amount, round(avg(c2.amount), 2) as average_amount
from (select visited_on, sum(amount) as amount from Customer3 group by visited_on) c1
         join
     (select visited_on, sum(amount) as amount from Customer3 group by visited_on) c2
     on datediff(c1.visited_on, c2.visited_on) <= 6 and 0 <= datediff(c1.visited_on, c2.visited_on)
group by c1.visited_on
having count(*) = 7


