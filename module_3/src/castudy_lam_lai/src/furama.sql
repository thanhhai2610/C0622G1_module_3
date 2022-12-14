drop database if exists Furama_case_study_2;
create database  Furama_case_study_2;
use Furama_case_study_2;

create table position (
id int primary key auto_increment,
name varchar(45)
);
create table education_degree (
id int primary key auto_increment,
name varchar(45)
);
create table division(
id int primary key auto_increment,
name varchar(45)
);
create table customer_type(
id int primary key auto_increment,
name varchar(45)
);
create table rent_type (
id int primary key auto_increment,
name varchar(45)
);

create table facility_type (
id int primary key auto_increment,
name varchar(45)
);

create table attach_facility (
id int primary key auto_increment,
name varchar(45),
cost double,
unit varchar(45),
status varchar(45)
);
CREATE TABLE user(
username VARCHAR(255) primary key,
password VARCHAR(255)
);
CREATE TABLE role(
role_id int primary key auto_increment,
role_name VARCHAR(255)
);
CREATE TABLE user_role(
role_id int,
username VARCHAR(255),
FOREIGN KEY (role_id) REFERENCES role(role_id),
FOREIGN KEY (username) REFERENCES user(username)
);
create table employee(
id int primary key auto_increment,
name varchar(45),
date_of_birth date,
id_card varchar(45),
salary double,
phone_number varchar(45),
emai varchar(45),
eddress varchar(45),
position_id int,
education_degree_id int,
division_id int,
username VARCHAR(255),
status_display bit default 0,
FOREIGN KEY (username) REFERENCES user(username),
FOREIGN KEY(position_id) REFERENCES position (id),
FOREIGN KEY(education_degree_id) REFERENCES division (id),
FOREIGN KEY(division_id) REFERENCES division(id)
);

create table customer(
id int primary key auto_increment,
customer_type_id int,
foreign key (customer_type_id) references customer_type(id) ,
name varchar(45),
date_of_birth date,
gender bit,
id_card varchar(45),
phone_number varchar(45),
emai varchar(45),
address varchar(45)
);

create table facility(
id int primary key auto_increment,
name varchar(45),
are int,
cost double,
max_people int,
rent_type_id int,
facility_type_id int,
foreign key (rent_type_id) references rent_type(id),
foreign key(facility_type_id) references facility_type (id),
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
facility_free text
);

create table contract(
id int primary key auto_increment,
start_date datetime,
end_date datetime,
deposit double,
employee_id int,
customer_id int,
facility_id int,
foreign key (employee_id) references employee(id),
foreign key (customer_id) references customer(id),
foreign key (facility_id) references facility(id)
);

create table contract_detail(
id int primary key auto_increment,
contract_id int,
attach_facility_id int,
foreign key (contract_id) references contract(id),
foreign key (attach_facility_id) references attach_facility(id),
quantity int
);

-- v??? tr??
INSERT INTO `furama_case_study_2`.`position` ( `name`) VALUES
( 'L??? t??n'),
( 'Ph???c v???'),
( 'Chuy??n vi??n'),
( 'Gi??m s??t'),
( 'Qu???n L??'),
( 'Gi??m ?????c');
-- tr??nh ?????
INSERT INTO `furama_case_study_2`.`education_degree` ( `name`) VALUES
( 'Trung C???p'),
( 'Cao ?????ng'),
( '?????i H???c'),
( 'Sau ?????i H???c');
-- ki???u thu??
INSERT INTO `furama_case_study_2`.`rent_type` ( `name`) VALUES
('year'),
('month'),
('day'),
('hour');
-- lo???i d???ch v???
INSERT INTO `furama_case_study_2`.`facility_type` ( `name`) VALUES
('Villa'),
('House'),
('Room');
-- Th??m th??ng tin role
INSERT INTO `furama_case_study_2`.`role` (`role_id`, `role_name`) 
VALUES ('1', 'Admin'),
('2', 'User');
-- d???ch v???
INSERT INTO `furama_case_study_2`.`facility` ( `name`, `are`,`cost`,`max_people`,`rent_type_id`,`facility_type_id`,`standard_room`,`description_other_convenience`,`pool_area`,`number_of_floors`,`facility_free`) VALUES
( 'Villa Beach Front', 25000, 1000000, 10, 3, 1, 'vip', 'C?? h??? b??i', 500, 4,null),
( 'House Princess 01', 14000, 5000000, 7, 2, 2, 'vip',' C?? th??m b???p n?????ng', null, 3, null),
(' Room Twin 01', 5000, 1000000, 2, 4, 3, 'normal', 'C?? tivi', null, null, '1 Xe m??y,1 Xe ?????p'),
( 'Villa No Beach Front', 22000, 9000000, 8, 3, 1, 'normal', 'C?? h??? b??i', 300, 3, 'null'),
('House Princess 02', 10000, 4000000, 5, 3, 2, 'normal', 'C?? th??m b???p n?????ng', null, 2, null),
( 'Room Twin 02', 3000, 900000, 2, 4, 3, 'normal', 'C?? tivi', null, null,' 1 Xe m??y');
-- d???ch v??? k??m theo 
INSERT INTO `furama_case_study_2`.`attach_facility` ( `name`,`cost`,`unit`,`status`) VALUES
( 'Karaoke', 10000, 'gi???', 'ti???n nghi, hi???n t???i'),
( 'Karaoke', 10000, 'gi???', 'ti???n nghi, hi???n t???i'), 
( 'Thu?? xe m??y', 10000, 'chi???c', 'h???ng 1 xe'),
( 'Thu?? xe ?????p', '20000', 'chi???c', 't???t'),
( 'Buffet bu???i s??ng', 15000, 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng'),
('Buffet bu???i tr??a', 90000, 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng'),
('Buffet bu???i t???i', 16000, 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng');

-- b??? ph???n 
 INSERT INTO `furama_case_study_2`.`division` ( `name`) VALUES
( 'Sale-Marketing'),
( 'H??nh ch??nh'),
( 'Ph???c v???'),
( 'Qu???n l??');
-- lo???i khach
 INSERT INTO `furama_case_study_2`.`customer_type` ( `name`) VALUES
('Diamond'),
('Platinium'),
( 'Gold'),
('Silver'),
('Member');
-- kh??ch h??ng
 INSERT INTO `furama_case_study_2`.`customer` ( `customer_type_id`,`name`,`date_of_birth`,`gender`,`id_card`,`phone_number`,`emai`,`address`) VALUES
(5, 'Nguy???n Th??? H??o', '1970-11-07',0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguy???n Ho??ng, ???? N???ng'),
 (3, 'Ph???m Xu??n Di???u', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Th??i Phi??n, Qu???ng Tr???'),
 ( 1, 'Tr????ng ????nh Ngh???', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 ??ng ??ch Khi??m, Vinh'),
 (1, 'D????ng V??n Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 L?? L???i, ???? N???ng'),
( 4, 'Ho??ng Tr???n Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 L?? Th??i T???, Gia Lai'),
 (4, 'T??n N??? M???c Ch??u', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Y??n Th???, ???? N???ng'),
( 1, 'Nguy???n M??? Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 L?? L???i, H??? Ch?? Minh'),
( 3, 'Nguy???n Th??? H??o', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguy???n V??n Linh, Kon Tum'),
(1, 'Tr???n ?????i Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 L?? Th?????ng Ki???t, Qu???ng Ng??i'),
 (2, 'Nguy???n T??m ?????c', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ng?? Quy???n, ???? N???ng');
 -- Nh??n vi??n
INSERT INTO `furama_case_study_2`.`employee` ( `name`,`date_of_birth`,`id_card`,`salary`,`phone_number`,`emai`,`eddress`,`position_id`,`education_degree_id`,`division_id`) VALUES
            ('Nguy???n V??n An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguy???n T???t Th??nh, ???? N???ng', 1, 3, 1),
            ('L?? V??n B??nh', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Y??n B??i, ???? N???ng', 1, 2, 2),
            ('H??? Th??? Y???n', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 ??i???n Bi??n Ph???, Gia Lai', 1, 3, 2),
            ( 'V?? C??ng To???n', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Ho??ng Di???u, Qu???ng Tr???', 1, 4, 4),
            ('Nguy???n B???nh Ph??t', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Y??n B??i, ???? N???ng', 2, 1, 1),
            ( 'Kh??c Nguy???n An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguy???n T???t Th??nh, ???? N???ng', 2, 2, 3),
            ('Nguy???n H???u H??', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguy???n Ch?? Thanh, Hu???', 2, 3, 2),
            (' Nguy???n H?? ????ng','1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com',' 111 H??ng V????ng, H?? N???i', 2, 4, 4),
            ('T??ng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 H??m Nghi, ???? N???ng', 2, 4, 4),
            ( 'Nguy???n C??ng ?????o', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Ho?? Kh??nh, ?????ng Nai', 2, 3, 2);
	-- h???p ?????ng
 INSERT INTO `furama_case_study_2`.`contract` ( `start_date`,`end_date`,`deposit`,`employee_id`,`customer_id`,`facility_id`) VALUES
        ( '2020-12-08', '2020-12-08', 0, 3, 1, 3),
        ( '2020-07-14', '2020-07-21', 200000, 7, 3, 1),
        ( '2021-03-15', '2021-03-17', 50000, 3, 4, 2),
        ( '2021-01-14', '2021-01-18', 100000, 7, 5, 5),
        ( '2021-07-14', '2021-07-15', 0, 7, 2, 6),
        ( '2021-06-01', '2021-06-03', 0, 7, 7, 6),
        ( '2021-09-02', '2021-09-05', 100000, 7, 4, 4),
        ( '2021-06-17', '2021-06-18', 150000, 3, 4, 1),
        ( '2020-11-19', '2020-11-19', 0, 3, 4, 3),
        ('2021-04-12', '2021-04-14', 0, 10, 3, 5),
        ( '2021-04-25', '2021-04-25', 0, 2, 2, 1),
        ( '2021-05-25', '2021-05-27', 0, 7, 10, 1);
-- h???p ?????ng chi ti???t
 INSERT INTO `furama_case_study_2`.`contract_detail` ( `id`,`contract_id`,`attach_facility_id`,`quantity`) VALUES
(1, 2, 4, 5),
(2, 2, 5, 8),
(3, 2, 6, 15),
(4, 3, 1, 1),
(5, 3, 2, 11),
(6, 1, 3, 1),
(7, 1, 2, 2),
(8, 12, 2, 2);

select * from facility order by name;
INSERT INTO `furama_case_study_2`.`employee` (`name`, `date_of_birth`, `id_card`, `salary`, `phone_number`, `emai`, `eddress`, `position_id`, `education_degree_id`, `division_id`, `username`) VALUES ('Nguy???n Thanh H???i2', '1994-01-08', '755434343', '17000000', '0988767111', 'thanhai@gmail.com', '213 H??m Nghi, ???? N???ng', '2', '3', '1', NULL);
SELECT * FROM employee WHERE name like "%thAn%";



DELIMITER $$
CREATE PROCEDURE DELETE_EMPLOYEE(in id_delete int)
BEGIN
update employee 
set status_display = 1
where id =id_delete;
end $$
DELIMITER ;

select * from employee 
where status_display = 0;

DELIMITER $$
CREATE PROCEDURE EDIT_EMPLOYEE(
	in id INT,
	in name varchar(45),
    in date_of_birth date,
    in id_card varchar(45),
    in salary double,
    in phone_number varchar(45),
    in emai varchar(45),
    in eddress varchar(45),
    in position_id int,
    in education_degree_id int,
    in division_id int,
    in username VARCHAR(255))
    BEGIN
update employee 
set name =name, 
date_of_birth =date_of_birth,
id_card  =id_card ,
phone_number  = phone_number ,
date_of_birth =date_of_birth,
emai  =emai ,
eddress  =eddress ,
position_id  =position_id ,
education_degree_id  =education_degree_id ,
division_id  =division_id ,
username  =username 
where id =id;
end $$
DELIMITER ;

UPDATE employee set
name = "vi???t", date_of_birth='1970-11-07',
 id_card = '123321456', salary = '10000000' , phone_number ='0901234121', emai = 'annguyen@gmail.com',
 eddress ='295 Nguy???n T???t Th??nh, ???? N???ng' , position_id =  '1' , education_degree_id =  '3', division_id ='1', username = NULL, status_display = 0
 Where id = 2;



