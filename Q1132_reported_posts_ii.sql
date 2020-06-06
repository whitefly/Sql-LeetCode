select round(avg(spam_percent) * 100, 2) as average_daily_percent
from (select count(r.post_id) / count(spam_report.post_id) as spam_percent
      from (select distinct post_id, action_date
            from Actions
            where extra = 'spam') spam_report
               left join Removals r on spam_report.post_id = r.post_id
      group by action_date) daily_spam_percent