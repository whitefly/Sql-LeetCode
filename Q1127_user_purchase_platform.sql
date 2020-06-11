--  组内分开的plus版
--  每天同时购买的人, 以user_id 和 spend_date 分组
-- 题比较简单,主要是构造那个没有数据的both
--  先找出用户二次卖的商品是什么 按order_date 和 id 分组, 组内是比自己先卖的商品
select allKind.spend_date, platform, ifnull(total_amount, 0) as total_amount, ifnull(total_users, 0) as total_users
from (select spend_date, platform
      from (select distinct spend_date from Spending) temp1,
           (select 'mobile' as platform union select 'desktop' union select 'both') temp2) allKind
         left join
     (select t1.spend_date, t1.kind, sum(amount) as total_amount, count(distinct s1.user_id) as total_users
      from (select user_id,
                   spend_date,
                   (case
                        when count(distinct platform) = 1 and any_value(platform) = 'mobile' then 'mobile'
                        when count(distinct platform) = 1 and any_value(platform) = 'desktop' then 'desktop'
                        else 'both' end) as kind
            from Spending s
            group by 1, 2) t1
               join Spending s1 on t1.user_id = s1.user_id and t1.spend_date = s1.spend_date
      group by t1.spend_date, t1.kind) some on allKind.spend_date = some.spend_date and allKind.platform = some.kind






