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

#20 may 
 
create database tuesday;
use tuesday;
drop table products;
create table category(
c_id int primary  key,
c_name varchar(25),
c_details varchar(25));
insert into category values (101,'electronics','ba');
insert into category values (102,'furnitures','bab');
insert into category values (103,'appliances','baba');
insert into category values (104,'machines','baa');

select * from category;
create table products(
p_id int primary key ,
p_name varchar(25),
p_details varchar(25),
c_id int ,
foreign key(c_id) references category(c_id) on update cascade);

create table products(
p_id int primary key ,
p_name varchar(25),
p_details varchar(25),
c_id int ,
foreign key(c_id) references category(c_id) on delete cascade);
insert into products values (501,'samsung','12GB',102);
insert into products values (506,'realme s','12GB',102);
insert into products values (504,'tresaw','16GB',103);
select * from products;
delete from category where c_id=101;
update category set c_id=106 where c_details='ba';

alter table products add constraint p unique (p_name);
alter table products drop index p;

alter table products drop primary key;
insert into products values (505,'tresaw ff','16GB',103);
select * from products;
delete from products where p_id=504;
alter table products add primary key(p_id);

alter table products add constraint c foreign key(c_id) references category(c_id);
alter table products drop foreign key c;


alter table products add check(p_id>500 and p_id<600);

drop table products;
create table products(
p_id int primary key ,
p_name varchar(25),
p_details varchar(25) default 'sravanthi',
c_id int ,
foreign key(c_id) references category(c_id));


#21 may 

select * from products where p_id between 501 and 505;
select * from products where p_id not between 501 and 505;

select * from products where p_id between 501 and 505 and p_id not in (502,504);

#dates
select * from products where p_date between '01/05/2025' and '01/07/2025';
select * from products where p_name like 's%';


#aggrigation 

select min(p_id) from products;
select max(p_id) from products;
select count(p_id) from products;
select avg(p_id) from products;
select sum(p_id) from products;

#union

create table worker(id int primary key,
name1 varchar(25),
age int,
salary int);
insert into worker values (101,'sravanthi',22,20000);
insert into worker values (102,'isha',27,60000);
insert into worker values (103,'siva',32,70000);
insert into worker values (104,'radha',27,28000);
insert into worker values (105,'ram',22,40000);
insert into worker values (106,'sravanthi',21,25000);

create table worker1(id int primary key,
name1 varchar(25),
age int,
salary int);

insert into worker1 values (101,'sravanthi',22,20000);
insert into worker1 values (102,'isha',27,60000);
insert into worker1 values (103,'siva',35,75000);
insert into worker1 values (108,'radha',27,28500);
insert into worker1 values (107,'ram',22,44000);
insert into worker1 values (104,'sravan',23,26000);

select * from worker union select * from worker1;
select * from worker union all select * from worker1;
select distinct name1 from worker;
select * from worker where salary>30000 union select * from worker1 where salary<25000;
select name1,salary,
case 
when salary>=60000 then 'high'
when salary<60000 and salary>30000 then 'middle'
when salary<=30000 then 'less'
else 'not found'
end
as checksalary from worker; 

select * from worker order by salary asc;
select * from worker order by salary desc;
select * from worker order by salary desc,id asc;
select name1 as fullname from worker;
select * from worker where name1 like 's_v%' or name1 like 'i%';
select * from worker where name1 like '%a';

create view  high as
select * from worker where salary>60000;

create  or replace view low  as
select * from worker where salary<60000;

select * from high;
select * from low;
drop view high;