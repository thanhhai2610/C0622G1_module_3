DROP DATABASE IF EXISTS demo_user_basic_intelij;
CREATE DATABASE demo_user_basic_intelij;
USE demo_user_basic_intelij;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
select id,name,email,country from users where name = "thanh hai"