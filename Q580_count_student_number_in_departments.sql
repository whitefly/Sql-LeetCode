select any_value(d.dept_name) as dept_name ,  count(s1.student_id) as  student_number from
student s1 right join department d on s1.dept_id=d.dept_id
group by d.dept_id
order by count(s1.student_id) desc,dept_name