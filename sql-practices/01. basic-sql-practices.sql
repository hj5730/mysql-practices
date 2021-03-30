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