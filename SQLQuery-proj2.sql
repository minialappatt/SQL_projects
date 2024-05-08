--Define relations/attributes
-- Define primary keys
--Create foreign keys

--1) Insert data into each of the above tables. With at least two rows in each of the table, make sure, that you have created respective foreign keys.

Create Table role ( ID int primary key, role_name	varchar(100) )

INSERT INTO Role values
				(667,'Clerk'),
				(668,'Staff'),
				(669,'Analyst'),
				(670,'Sales Person'),
				(671,'Manager' ),
				(672,'President');
select * from role

Create table user_account ( ID int primary key ,
							user_name varchar(100) Not null,
							email varchar(254) Not null, 
							password varchar(200) Not null , 
							password_salt varchar(50) Null,
							password_hash_algorithm varchar(50) Not null)

INSERT INTO User_account
			    SELECT 145,'SMITH','smith@cnn.com','dksjfl',NULL,'lo5fa0s9djfo' UNION ALL
				SELECT 146,'ALLEN','allen@ubc.com','kosaid','923459ksdfe6','etw59ks54' UNION ALL
				SELECT 147,'DOYLE','doyle@nbc.com','0jasdlfk',NULL,'sdf59ksdfjee' UNION ALL
				SELECT 148,'DENNIS','dennis@got.com','j4r34ks','23459kssidouf','ksdfj7j'

select * from user_account

Create table user_has_role ( ID int primary key, 
				role_start_time datetime not null,
				role_end_time datetime Null,
				user_account_id int foreign key references user_account(id),
				role_id int foreign key references role(id))

INSERT INTO User_has_role values
				(122,'10:50:34','7:20:27',145,667 ),
				(123,'0:10:44',NULL,146,668 ),
				(124,'13:30:54','4:31:11',147,669 ),
				(167,'2:51:04',NULL,148,670);

select * from user_has_role

Create table Status (ID int Primary key ,
					 Status_Name varchar(100) not null,
					 is_user_working bit not null)

INSERT INTO Status values
					(11,'active',1 ),
					(45,'inactive',0 ),
					(79,'dormant',0 ),
					(113,'new',1);
select * from Status

Create table user_has_status1( ID int primary key,
								 status_start_time datetime Not null,
								 status_end_time datetime null,
								 User_account_id int Not null foreign key references user_account(id),
								 Status_id int Null foreign key references status(id))
select * from user_has_status1

INSERT INTO user_has_status1
				(88,'9:20:00','7:20:27',145,11),
				(74,'2:10:12',NULL,146,45 ),
				(60,'18:59:50','4:31:11',147,79 ),
				(46,'11:49:28',NULL,148,113);

--2) Delete all the data from each of the tables.

TRUNCATE TABLE User_has_status1 DELETE FROM Status WHERE id > 0

ALTER TABLE User_has_role DROP CONSTRAINT FK_User_account

DELETE FROM User_account WHERE id > 0

DELETE FROM User_has_role WHERE id > 0

DELETE FROM Role WHERE id > 0

TRUNCATE table Role

