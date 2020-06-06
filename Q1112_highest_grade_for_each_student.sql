select student_id, min(course_id) as course_id, any_value(grade) as grade
from Enrollments e1
where (e1.student_id, e1.grade) in (select student_id, max(grade)
                                    from Enrollments as e
                                    group by student_id)
group by student_id
order by student_id

