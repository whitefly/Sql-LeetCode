-- 自定义变量

select e.left_operand,
       e.operator,
       e.right_operand,
       (case
            when operator = '>' then if(v1.value > v2.value, 'true', 'false')
            when operator = '<' then if(v1.value < v2.value, 'true', 'false')
            else
                if(v1.value = v2.value, 'true', 'false') end) value
from Expressions e
         join Variables v1 on e.left_operand = v1.name
         join Variables v2 on e.right_operand = v2.name


