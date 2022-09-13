drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
cID int primary key,
cName varchar(45),
cAge int
);
create table orders (
oID int primary key,
cID int ,
foreign key (cID) references customer(cID),
oDate date,
oTotalPrice int
);
create table product(
pID int primary key,
pName varchar(45),
pPrice int
);
create table Order_deitail (
oID int,
pID int,
foreign key (oID) references orders(oID),
foreign key (pID) references product(pID),
odQTY varchar(45)
);