-- 难点在于如何生产 0-n的数列 使用ROW_NUMBER然后筛选
select t1.rnb as transactions_count, ifnull(t2.visits_count, 0) as visits_count
from (
         SELECT 0 AS rnb
         union
         SELECT ROW_NUMBER() OVER () AS rnb
         FROM Transactions
     ) t1
         left join
     (select cnt as transactions_count, count(user_id) as visits_count
      from (select v.user_id, count(t.user_id) as cnt
            from Visits v
                     left join Transactions t on v.user_id = t.user_id and v.visit_date = t.transaction_date
            group by v.user_id, visit_date) frequency
      group by cnt) t2 on t1.rnb = t2.transactions_count
where t1.rnb <= (
    SELECT COUNT(tt2.amount) AS cnt
    FROM Visits tt1
             LEFT JOIN Transactions tt2
                       ON tt1.user_id = tt2.user_id AND tt1.visit_date = tt2.transaction_date
    GROUP BY tt1.user_id, visit_date
    ORDER BY cnt DESC
    LIMIT 1)
order by 1



