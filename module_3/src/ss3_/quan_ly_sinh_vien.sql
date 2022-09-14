drop database if exists quan_li_sinh_vien;
create database  quan_li_sinh_vien;
use quan_li_sinh_vien;
create table class(
class_id int primary key auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
`status` bit);
create table student(
student_id int primary key auto_increment,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
`startus` bit,
class_id int not null,
foreign key(class_id) references class(class_id));
create table `subject`(
sub_id int primary key auto_increment,
sub_name varchar(30) not null,
credit tinyint not null default 1 check(credit>=1),
`status` bit);
create table mark(
mark_id int primary key auto_increment,
sub_id int,
student_id int,
mark float default 0 check(mark between 0 and 100),
exam_times tinyint default 1,
unique (sub_id, student_id),
foreign key (sub_id) references subject(sub_id),
foreign key (student_id) references student (student_id));


insert into class value 
(1, 'A1', '2008-12-20', 1),
(2, 'A2', '2008-12-22', 1),
(3, 'B3', current_date, 0);
insert into student (student_name, address, phone, `startus`, class_id) value 
('Hung', 'Ha Noi', '0912113113', 1, 1),
('Hoa', 'Hai phong',null,  1, 1),
('Manh', 'HCM', '0123123123', 0, 2);
insert into `subject` value 
(1, 'CF', 5, 1),
(2, 'C', 6, 1),
(3, 'HDJ', 5, 1),
(4, 'RDBMS', 10, 1);
insert into  mark (sub_id, student_id, mark, exam_times) value
 (1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);

use quan_li_sinh_vien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from quan_li_sinh_vien.student
 where student_name like "H%"; 

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from quan_li_sinh_vien.class
 where month(start_date) = 12;
 
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
 select * from quan_li_sinh_vien.`subject`
  where credit between 3 and 5; 
 
 -- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
update student
set class_id = 2 
where student_name =  'Hung';

 -- Hiển thị các thông tin: StudentName, SubName, Mark. 
 -- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student.student_name, subject.sub_name, mark.mark as diem
from mark
		inner join subject on  mark.mark_id = subject.sub_id
		inner join student on  mark.mark_id = student.student_id
order by diem desc, student_name asc;
 
 
 