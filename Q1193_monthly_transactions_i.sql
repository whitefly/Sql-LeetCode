select t.month,
       t.country,
       count(t.id)               as trans_count,
       sum(t.state = 'approved') as approved_count,
       sum(t.amount)             as trans_total_amount,
       sum(if(state = 'approved', amount, 0)) as approved_total_amount
from (select id, country, state, amount, date_format(trans_date, '%Y-%m') as month
      from Transactions) t
group by t.month, t.country

