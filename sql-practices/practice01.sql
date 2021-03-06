-- 문제1
-- 사번이 10944인 사원의 이름은(전체 이름)
select concat(first_name, '  ', last_name) as '이름'
from employees
where emp_no = 10944;

-- 문제2.
-- 전체 직원의 다음 정보를 조회하세요.
-- 가장 선임부터 출력이 되도록 하세요.
-- 출력은 이름, 성별, 입사일 순서이고 이름, 성별, 입사일로 컬럼 이름을 대체해 보세요.
select concat(first_name, '  ', last_name) as '이름', gender as '성별', hire_date as '입사일'
from employees
order by hire_date asc;

-- 문제3.
-- 여직원과 남직원은 각각 몇 명 이나 있나요?
-- 함수 2번해서 해결
select count(*) as '여직원 수'
from employees
where gender = 'F';

select count(*) as ' 남직원 수'
from employees
where gender = 'M';

-- 문제4.
-- 현재 근무하고 있는 직원 수는 몇 명입니까? (salaries 테이블을 사용합니다.
-- salaries table에서 to_date가 9999어쩌고인거를 count하면 됨
select count(*) as '현재 근무자 수'
from salaries
where to_date = '9999-01-01';

-- 문제5.
-- 부서는 총 몇개 있나요?
select count(dept_name)
from departments;

-- 문제6.
-- 현재 부서 매니저는 몇 명이나 있나요?
select count(*)
from dept_manager
where to_date = '9999-01-01';

-- 문제7.
-- 전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해보세요. (length 사용)
select dept_name, length(dept_name)
from departments
order by length(dept_name) desc;


-- 문제8.
-- 현재 급여가 120,000이상 받는 사원은 몇명이나 있습니까?
-- where 절이 2개.
select count(*)
from salaries
where salary >= 120000
and to_date = '9999-01-01';

-- 문제9.
-- 어떤 직책들이 있나요? 중복 없이 이름이 긴 순서대로 출력해보세요.
-- 중복 distinct 하고 order by 하면 됨
select distinct title, length(title)
from titles
order by length(title) desc;

-- 문제10.
-- 현재 Engineer 직책의 사원은 총 몇명입니까?
-- to_date 하고 999하고 해결
select count(*)
from titles
where title = 'Engineer'
and to_date = '9999-01-01';

-- 문제 11.
-- 사번이 13250(Zeydy)인 직원이 직책 변경 상황을 시간순으로 출력해보세요.
select *
from titles
where emp_no = 13250
order by from_date asc;

-- 그냥 필기?? 써있었음
select * from salaries;

desc salaries;

select count(salary) from salaries;
select count(salary) from salaries;