
use furama;

-- 2.	Hiển thị thông tin của tất cả nhân viên 
-- có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” 
-- và có tối đa 15 kí tự

SELECT nv.*
FROM nhan_vien nv
WHERE nv.ho_va_ten REGEXP '^[H,K,T]'
AND char_length(nv.ho_va_ten) <=15 ;

/* 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”*/

SELECT kh.* , (year(curdate()) - year(kh.ngay_sinh) ) as tuoi
FROM khach_hang kh 
HAVING tuoi BETWEEN 18 AND 50
AND kh.dia_chi LIKE '%Đà Nẵng'
OR kh.dia_chi LIKE '%Quảng Trị' ;

/*4.  Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.*/

SELECT  hd.ma_khach_hang, kh.ho_va_ten, COUNT(hd.ma_hop_dong) AS so_lan_dat_phong
FROM hop_dong hd
JOIN khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
WHERE kh.ma_loai_khach = 1
GROUP BY hd.ma_khach_hang;

/* 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, 
 -- ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
 -- (Với tổng tiền được tính theo công thức như sau:
 -- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, 
 -- hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
 -- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).*/

SELECT kh.ma_khach_hang, kh.ho_va_ten, 
lk.ten_loai_khach,
hd.ma_hop_dong,
dv.ten_dich_vu,
hd.ngay_lam_hop_dong,
hd.ngay_ket_hop_dong,
((ifnull(dv.chi_phi_cho_thue,0) + SUM(ifnull(hdct.so_luong,0)* ifnull(dvkt.gia,0)))) AS tong_tien
FROM khach_hang kh 
LEFT JOIN hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
LEFT JOIN dich_vu_kem_theo dvkt on dvkt.ma_dich_vu_kem_theo = hdct.ma_dich_vu_kem_theo
GROUP BY  kh.ma_khach_hang ;

/*6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,ten_loai_dich_vu
--  của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ
--  quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).*/ 

CREATE VIEW list_kh_dat_dv_qui_1_2021 AS
										SELECT ldv.ten_loai_dich_vu
										FROM hop_dong hd
                                        JOIN dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
                                        JOIN loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
										JOIN khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
										WHERE quarter(hd.ngay_lam_hop_dong) = 1
										AND year(hd.ngay_lam_hop_dong) = 2021
										GROUP BY ldv.ten_loai_dich_vu;

SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_cho_thue,
ldv.ten_loai_dich_vu,
kh.ma_khach_hang,
hd.ma_hop_dong,
hd.ngay_lam_hop_dong
FROM hop_dong hd
JOIN dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
JOIN loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
JOIN khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
WHERE ldv.ten_loai_dich_vu NOT IN (SELECT ten_loai_dich_vu FROM list_kh_dat_dv_qui_1_2021)
GROUP BY dv.ma_dich_vu;

SELECT
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_cho_thue,
    ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
WHERE dv.ma_dich_vu NOT IN (SELECT *
							FROM hop_dong hd
							WHERE(QUARTER(hd.ngay_lam_hop_dong) = 1)
							AND (YEAR(hd.ngay_lam_hop_dong) = 2021));
                            
/* 7.  Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng     đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.*/

SELECT dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_cho_thue, 
ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
JOIN loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
WHERE year(hd.ngay_lam_hop_dong) = 2020 
and dv.ma_dich_vu not in (SELECT hd.ma_dich_vu
							FROM hop_dong hd
							WHERE year(hd.ngay_lam_hop_dong ) = 2021)
GROUP BY ma_dich_vu;							

/*9. Thực hiện thống kê doanh thu theo tháng, nghĩa
--  là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.*/

SELECT count(hd.ma_hop_dong)  as ma_hop_dong,month(hd.ngay_lam_hop_dong) as thang_lam_hop_dong
FROM hop_dong hd
WHERE year(hd.ngay_lam_hop_dong) = 2021
GROUP BY month(hd.ngay_lam_hop_dong);

/*10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
 Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, 
 tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).*/
 
SELECT hd.ma_hop_dong, COUNT(hdct.so_luong) as so_dv_di_kem,
 hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_hop_dong, hd.tien_dat_coc,
 sum(ifnull(hdct.so_luong,0)) as so_luong
from hop_dong_chi_tiet hdct
RIGHT JOIN hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong;

/* 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi 
những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.*/





