drop database if exists demo;
create database demo;
use demo;
create table products(
id int auto_increment primary key,
product_code int,
product_name varchar(50),
product_price double,
product_amount int,
product_description text,
product_status varchar(20)
);
INSERT INTO `demo`.`products` (`product_code`, `product_name`, `product_price`, `product_amount`, `product_status`) VALUES (2, 'Xiaomi 123', 3000000, 15, 'còn hàng');
INSERT INTO `demo`.`products` (`product_code`, `product_name`, `product_price`, `product_amount`, `product_status`) VALUES (3, 'Samsung S8', 4500000, 5, 'còn hàng');
INSERT INTO `demo`.`products` (`product_code`, `product_name`, `product_price`, `product_amount`, `product_status`) VALUES (5, 'Iphone 8', 2500000, 0, 'hết hàng');
INSERT INTO `demo`.`products` (`product_code`, `product_name`, `product_price`) VALUES (8, 'Iphone 10', 6000000);

/*Bước 3:*/
-- explain trước khi tạo index
explain select product_price from products where product_price <3000000;
-- tạo index
create unique index idx_product_code on products (product_code);
create index idx_product on products (product_name, product_price);
-- dùng explain
explain select product_price from products where product_price <3000000;

/*Bước 4:*/
-- tạo view
create view product_view as
select product_code, product_name, product_price, product_status from products;

select * from product_view;
-- sửa view
set sql_safe_updates=0;
update product_view
set product_status = 'chưa có hàng' where (product_status is null);

-- xóa view
drop view product_view;

/*Bước 5: */

-- tạo store procedure
Delimiter //
Create Procedure all_records()
    BEGIN
    Select * from products;
    END//
DELIMITER ;
-- Tạo store procedure thêm một sản phẩm mới
Delimiter //
Create Procedure add_record()
    BEGIN
    Select * from Student_info;
    END//
DELIMITER ;
-- Tạo store procedure sửa thông tin sản phẩm theo id
Delimiter //
Create Procedure edit_record(in p_id INT, p_product_description text)
    BEGIN
    update demo.products
    set product_description = p_product_description where id = p_id;
    END//
DELIMITER ;
-- Tạo store procedure xoá sản phẩm theo id
Delimiter //
Create Procedure delete_record(in p_id INT)
    BEGIN
    delete from demo where id = p_id;
    END//
DELIMITER ;