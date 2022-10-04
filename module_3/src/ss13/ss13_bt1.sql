DROP DATABASE IF EXISTS ss13_bt1;
CREATE DATABASE ss13_bt1;
USE ss13_bt1;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

INSERT INTO users (name, email, country) VALUES ("thanh hai","mail" , "viet nam");


DELIMITER $$
CREATE PROCEDURE SELECT_ALL_USERS()
BEGIN
select * from users order by name ;
end $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DELETE_USERS_SQL(in user_id int)
BEGIN
delete from users where id = user_id;
end $$
DELIMITER ;
