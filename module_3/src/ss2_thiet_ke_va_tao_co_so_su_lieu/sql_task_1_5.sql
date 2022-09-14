-- 2.	Hiển thị thông tin của tất cả nhân viên 
-- có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” 
-- và có tối đa 15 kí tự
use furama;
select * from nhan_vien
 where  (ho_va_ten regexp '^[HKT]') 
		and (CHAR_LENGTH(ho_va_ten) <= 15);

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select * from khach_hang
 where (YEAR(curdate())-YEAR(khach_hang.ngay_sinh) between 18 and 50)
	and (khach_hang.dia_chi like '%Đà Nẵng'
        or khach_hang.dia_chi like'%Quảng Trị' );
     

-- 4.  Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.

-- SELECT ...
-- FROM bảng_trái INNER JOIN bảng_phải
-- ON điều_kiện_khớp_nối
-- mệnh đề where, order ... nếu có]

SELECT 
    khach_hang.ho_va_ten, count(khach_hang.ho_va_ten) AS so_lan_dat_phong
FROM
khach_hang 
inner join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
inner join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
WHERE
    khach_hang.ma_loai_khach = 1

GROUP BY ho_va_ten -- chỉ xuất ra trường ho_va_ten
ORDER BY so_lan_dat_phong; -- xắp sếp

 -- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, 
 -- ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
 -- (Với tổng tiền được tính theo công thức như sau:
 -- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, 
 -- hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
 -- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
 
 
 
 
 
 
 