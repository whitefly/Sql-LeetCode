-- 笛卡尔积和 left join的综合题

select s1.student_id,
       any_value(s1.student_name) as student_name,
       s2.subject_name,
       count(e.subject_name)      as attended_exams
from Students s1
         cross join Subjects s2
         left join Examinations e on s1.student_id = e.student_id and s2.subject_name = e.subject_name
group by 1, 3
order by 1

