drop database if exists student_managament;
create database student_managament;
use student_managament;
create table sinh_vien(
ma_sinh_vien int primary key,
ten_sinh_vien varchar(45),
tuoi_sinh_vien int,
country varchar(45)
);
create table giao_vien(
ma_giao_vien int primary key,
ten_giao_vien varchar(45) ,
tuoi_giao_vien int,
country varchar(45)
);
create table lop(
ma_lop int primary key,
ten_lop varchar(45)
);

select * from sinh_vien;
insert into sinh_vien(ma_sinh_vien,ten_sinh_vien,tuoi_sinh_vien,country) 
				value (1,"Cat Uyen",18,"Da nang");
                
SET SQL_SAFE_UPDATES = 0; update sinh_vien set tuoi_sinh_vien = 20 where ten_sinh_vien = "Cat Uyen"; select * from sinh_vien;




