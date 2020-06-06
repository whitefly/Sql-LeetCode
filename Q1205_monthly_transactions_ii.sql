-- 组内分开统计
select date_format(t.trans_date, '%Y-%m')       as `month`,
       country,
       sum(state = 'approved')                  as approved_count,
       sum(if(state = 'approved', amount, 0))   as approved_amount,
       sum(state = 'Chargeback')                as chargeback_count,
       sum(if(state = 'Chargeback', amount, 0)) as chargeback_amount
from (select *
      from Transactions2
      union
      (select id, country, 'Chargeback' as state, amount, Chargebacks.trans_date as trans_date
       from Chargebacks
                join Transactions2 on trans_id = id)) t
group by 1, 2
having approved_amount
    or chargeback_amount