show databases;
create database vit;
show tables from vit;
drop database vit;
create table cse(
s_id int,
s_name varchar(40),
s_mark int);
 use vit;
select * from cse;
insert into cse values(101,'Aditya',89);
insert into cse values(101,'Aditya',89);
create database sample;
create table firstO(
name1 varchar(10),
age int);
use sample;

insert into firstO values('ram',10);
insert into firstO values('sam',15);
insert into firstO values('varun',16);
insert into firstO values('raju',19);
insert into firstO values('siva',20);
insert into firstO values('isha',19);
insert into firstO values('krishna',8);
insert into firstO values('sita',16);
insert into firstO values('raghu',15);
insert into firstO values('radha',10);
insert into firstO values('bhanu',14);
insert into firstO values('ravi',8);

select * from firstO;
create table firstT(
name1 varchar(10),
qualification varchar(10));

insert into firstT values('ram','BE');
insert into firstT values('sam','BE');
insert into firstT values('siva','MCA');
insert into firstT values('isha','Btech');
insert into firstT values('radha','Law');
insert into firstT values('krishna','MBBS');
insert into firstT values('ganesh','MBA');
insert into firstT values('sidhu','Mtech');
insert into firstT values('buvan','Bcom');
insert into firstT values('bhoomi','Btech');

show databases;
show tables from sample;
select * from firstT;

alter table firstO add(
address varchar(40));
alter table firstO drop column address;

alter table firstO add (
country varchar(19) default 'india');
alter table firstO drop column country;
update firstO set name1='sravanth' where age=19;
update firstO set age=age+1;
 
start transaction;
insert into cse values(101,'Aditya',89);
savepoint a11;
insert into cse values(102,'Adi',44);
savepoint a12;
insert into cse values(103,'ravi',84);
savepoint a13;
insert into cse values(104,'Aditya',67);
insert into cse values(105,'krishna',45);
insert into cse values(106,'radha',23);
delete from cse where s_id=101;
select * from cse;
rollback  to a13;
select * from cse;
commit;
desc cse;
truncate table cse;

select s_name from cse;
select s_name as name from cse;
#logical operators
select s_name from cse where s_mark<=50;
select s_name,s_id from cse where s_mark<=50;
select s_name,s_mark from cse where s_mark<=50 and s_mark>20;
select s_name,s_mark from cse where s_name='radha' or s_mark=43;
select * from worker where salary<200000 and department='HR' or deparment='admin';
select * from worker where (salary>100000 and salary<300000) and (department='HR' or department='Admin');
#in operator
select * from cse where s_id in (101,102,104);
select * from cse where s_id not in (101,102,104);
select * from cse where s_mark= (select max(s_mark) from cse);
select * from workers where s_id%2=0 and salary=(select max(salary) from workers) and department in ('Admin','HR');
