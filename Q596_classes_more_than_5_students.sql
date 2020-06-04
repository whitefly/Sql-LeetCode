select class from courses
group by class
having count(DISTINCT student)>=5