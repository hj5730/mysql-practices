-- pet table 생성
create table pets(
name varchar(20),
owner varchar(20),
species varchar(20),
gender char(1),
birth date,
death date
);

-- table schema 확인 (table 만들어졌는지 확인)
desc pets;

-- insert(Create) (table에 내용 삽입)
insert
into pets
values("성탄이", "kickscar", "dog", "m", "2010-12-25", null);

insert
into pets(owner, name, species, gender, birth)
values("kickscar", "choco", "cat", "m", "2015-01-01");

insert
into pets
values("마음이", "kickscar", "dog", "m", "2012-12-25", "2021-03-30");


-- select(R) - read
select * from pets; -- pets의 정보가 전체 다 나옴 (그러나, *사용하는 것보다 아래의 방식 선호)

select name, birth from pets; -- 필요한 정보만 선택해서 추출

select name, birth from pets order by birth desc; -- 내림차순
select name, birth from pets order by birth asc; -- 오름차순


-- select에서 통계
select count(*) from pets; -- 여기서는 * 사용하는 것 선호함
select count(death) from pets; -- 이름을 넣으면 null 인 값은 안나옴. 그래서 count에서는 * 사용 추천
select count(*) from pets where death is not null;


-- update(U)
update pets
set species = 'monkey'
where name = 'choco';


-- delete(D) (update와 delete는 where절 무조건 있어야함)
delete
from pets
where death is not null;