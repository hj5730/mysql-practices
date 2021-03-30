select *
from departments;

select first_name, last_name, hire_date
from employees;

-- alias
select first_name as '이름', last_name as '성', hire_date as '입사일'
from employees;

-- 함수
select concat(first_name, '   ', last_name) as '이름', hire_date as '입사일'
from employees;

select concat(first_name, '   ', last_name) as '이름',
  	   length(first_name),
       gender as '성별',
       hire_date as '입사일'
  from employees;
  
-- distinct
select * from titles;
select distinct title from titles; -- 중복되는 직책 삭제. 여러개 안나오고 한개씩만 나옴

-- 정렬 (order by)
  select concat(first_name, '  ', last_name) as '이름',
		 length(first_name),
         gender as '성 별',
         hire_date as '입사일'
    from employees
order by hire_date desc; -- 신참순서대로 (내림차순) (디폴트는 asc(오름차순))


-- 1. salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급순으로 출력
-- Like 검색
select * from salaries;
select * from salaries where from_date like '2001%'; -- 2001로 시작하는 모든 것
select * from salaries where from_date like '2001-06%'; -- 2001년 6월로 시작하는 모든 것

select * from employees where first_name like 'pe%'; -- % 붙으면 엑셀에서의 *를 의미 (만능)
select * from employees where first_name like 'p__'; -- 3개짜리 이름을 가진 사람중 p로 시작하는 사람 (_2개니까 p땡땡) 자리수까지 지정

-- 문제 정답
  select emp_no, salary
    from salaries
   where from_date like '2001-%'
order by salary desc;

-- 2. salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급순으로 출력
-- like 검색을 모를 때
  select emp_no, salary
    from salaries
   where from_date > '2000-12-31'
     and from_date <'2002-01-01'
order by salary desc;

-- 3. employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
  select first_name, gender, hire_date
    from employees
   where hire_date < '1991-01-01'
order by hire_date desc;

-- 4. employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 입사일을 출력
  select first_name, gender, hire_date
    from employees
   where hire_date < '1989-01-01'
	 and gender = 'F'
order by hire_date desc;


-- date_format
  select first_name, gender, date_format(hire_date, '%Y년 %m월 %d일 %h:%i%s') as '입사일'
    from employees
   where hire_date < '1989-01-01'
	 and gender = 'F'
order by hire_date desc;