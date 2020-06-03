select question_id as survey_log
from survey_log s
group by s.question_id
order by (sum(action = 'answer') / (sum(action = 'answer') + sum(action = 'show'))) desc
limit 1




