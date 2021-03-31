-- 현재 근무하고 있는 여직원의 이름과 직책을 직원 이름 순으로 출력하세요.
  select a.first_name, b.title    -- a: employees table, b: titles table (from 에서 지정해줬음)
    from employees a , titles b   -- 이렇게만 하면 조건이 없으니까 테이블 정보가 전체 다 나옴 (as a와 같은 의미)
                                  -- from employees a limit 2, 2; 하면 2번째에서 2개만 출력됨
   where a.emp_no = b.emp_no      -- join condition
     and b.to_date = '9999-01-01' -- raw select condition(조건)
     and a.gender = 'F'			  -- raw select condition
order by a.first_name;


-- 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균 급여를 구하세요.
  select a.dept_no, d.dept_name, avg(b.salary) as avg_salary
  -- select a.emp_no, a.dept_no, b.salary, c.title -- emp_no는 아무데서나 가져오면 됨. (공통사항은)
    from dept_emp a, salaries b, titles c, departments d
   where a.emp_no = b.emp_no      -- join condition
     and b.emp_no = c.emp_no      -- join condition
     and a.dept_no = d.dept_no      -- join condition
     and a.to_date = '9999-01-01' -- select condition
     and b.to_date = '9999-01-01' -- select condition
     and c.to_date = '9999-01-01' -- select condition
     and c.title = 'Engineer'     -- 여기까지 join 완료
group by a.dept_no
order by avg_salary desc;

-- 현재, 직책별로 급여의 총합의 구하되 Engineer직책은 제외하세요.
-- 단, 총합이 2,000,000,000 이상인 직책만 나타내며
-- 급여의 총합에 대해서는 내림차순(DESC)으로 정렬하세요.
  select a.title, sum(b.salary)
    from titles a, salaries b
   where a.emp_no = b.emp_no      -- join condition
     and a.to_date = '9999-01-01' -- select condition
     and b.to_date = '9999-01-01' -- select condition
     and a.title != 'Engineer'    -- select condition
group by a.title
  having sum(b.salary) >= 2000000000
order by sum(b.salary) desc;


--
-- ANSI / ISO SQL 1999 JOIN 문법
-- 

-- join ~ on (이 문법이 표준. 위의 결과와 결과는 같지만, 표준이냐 아니냐의 차이)
-- 현재 근무하고 있는 여직원의 이름과 직책을 직원 이름 순으로 출력하세요.
  select a.first_name, b.title    
    from employees a
    join titles b
      on a.emp_no = b.emp_no 	  -- join condition (on에 조건걸어둠) 
   where b.to_date = '9999-01-01' -- select condition
     and a.gender = 'F'			  -- select condition
order by a.first_name;

-- natural join (조건이 없음)
      select a.first_name, b.title    
        from employees a
natural join titles b 				  -- 같은 칼럼이 있으면 자동으로 join을 해줌. 그래서 조건이 X
       where b.to_date = '9999-01-01' -- select condition
         and a.gender = 'F'			  -- select condition
    order by a.first_name;
    
-- natural join의 단점 비교
select count(*)
  from titles a
  join salaries b
    on a.emp_no = b.emp_no
 where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';
   
      select count(*)
        from titles a
natural join salaries b
       where a.to_date = '9999-01-01'
         and b.to_date = '9999-01-01';
-- natural join join 조건으로 하지 말아야 할 조건도 같다고 하니까 안좋음.
-- 그래서 natural join 쓰지 말기.


-- join ~ using
select count(*)
  from titles a
  join salaries b
 using (emp_no) 	-- 어떤 것을 같다고 할지. (공통으로 같다고 하는 폴더 지정)
 where a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01';
-- 얘도 그냥 알아만 두기


-- outer join

-- 1. 테스트 데이터 넣기
insert into dept values(null, '총무');
insert into dept values(null, '개발');
insert into dept values(null, '영업');

insert into emp values(null, '둘리', 2);
insert into emp values(null, '마이콜', 3);
insert into emp values(null, '또치', 2);
insert into emp values(null, '도우넛', 3);
insert into emp values(null, '길동', null);

-- 현재 회사의 직원의 이름과 부서이름을 출력하세요.
select a.name, b.name
from emp a
join dept b
on a.dept_no = b.no;

-- left join
select a.name, b.name
from emp a
left join dept b
on a.dept_no = b.no;

select a.name, ifnull(b.name, '없음')
from emp a
left join dept b
on a.dept_no = b.no;

-- right join
select a.name, b.name
from emp a
right join dept b
on a.dept_no = b.no;

select ifnull(a.name, "직원없음"), b.name
from emp a
right join dept b
on a.dept_no = b.no;