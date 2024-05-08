create table sample_01(Ename varchar(50), sal numeric(10))
select * from sample_01
create table sample_02(Eid varchar(5), Ename varchar(60),sal numeric(10,2))
insert into sample_02 values('1103','efgh',15000)
select * from sample_02
delete from sample_02 where ename like 'efgh'
alter table sample_02 add constraint cons_unique unique (Eid)
sp_help sample_02
select * from sample_02 
alter table sample_02 add constraint sample_02_sal_check check(sal>=10000)
insert into sample_02 values('1104','efgh',12000)
insert into sample_02 values('1105','efgh',12000)
insert into sample_02 values('1106','efgh',2000)
