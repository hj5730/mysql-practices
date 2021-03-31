-- 예제: salaries 테이블에서 현재 전체 직원의 평균급여 출력
select avg(salary), max(salary)
from salaries
where to_date = '9999-01-01';

select emp_no, max(salary) -- 원래 에러가 나야하는 구문. 집계함수를 쓰고 다른 칼럼을 쓰면 에러남.
from salaries
where to_date = '9999-01-01'; -- 결과는 나오지만 맞는 결과가 아님.


-- 예제2
-- salaries 테이블에서 사번이 10060인 직원의 급여 평균과 총합계를 출력
select avg(salary), sum(salary)
from salaries
where emp_no = 10060;


-- 예제3
-- 이 예제 직원의 최저 임금을 "받은 시기"와 최대 임금을 "받은 시기"를 각각 출력해보세요.
-- select 절에 집계함수가 있으면 다른 컬럼은 올 수 없다.
-- 따라서 "받은 시기"는 조인이나 서브쿼리를 통해서 구해야 한다.
select max(salary), min(salary)
from salaries
where emp_no = 10060;


-- 예제4
-- dept_emp 테이블에서 d008에 현재 근무하는 인원수는?
select count(*)
from dept_emp
where dept_no = 'd008'
and to_date = '9999-01-01';

-- 예제5
-- 각 사원별로 평균연봉 출력
select emp_no, avg(salary)
from salaries
group by emp_no
order by avg(salary) desc; -- 위의 avg(salary)로 group by 하겠다는 이야기

-- 예제6
-- salaries 테이블에서 현재 전체 직원별로(group by) 평균급여가 35000 이상인 직원의 평균 급여를
-- 큰 순서로 출력하세요.
select emp_no, avg(salary)
from salaries
where to_date = '9999-01-01'
group by emp_no -- group by는 select에서 쓴 변수만 쓸 수 있음
having avg(salary) > 35000 -- where 다음에 and로 하면 안됨
order by avg(salary) desc;

-- 예제7
-- 사원별로 몇 번의 직책 변경이 있었는지 조회해 보세요.
select emp_no, count(*)
from titles
group by emp_no;

-- 예제8
-- 현재 직책별로 직원 수를 구하되 직원 수가 100명 이상인 직책만 출력하세요.
  select title, count(*) as cnt
    from titles
   where to_date = '9999-01-01'
group by title
  having cnt >= 100
order by cnt desc;