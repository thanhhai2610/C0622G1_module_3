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
WHERE khach_hang.ma_loai_khach = 1
GROUP BY ho_va_ten -- chỉ xuất ra trường ho_va_ten
ORDER BY so_lan_dat_phong; -- xắp sếp

 -- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, 
 -- ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
 -- (Với tổng tiền được tính theo công thức như sau:
 -- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, 
 -- hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
 -- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
 
 select 
    kh.ma_khach_hang,
    kh.ho_va_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_hop_dong,
 (ifnull(dv.chi_phi_cho_thue,0)+ SUM(ifnull(hdct.so_luong,0)*ifnull(dvkt.gia,0))) as tong_tien
 from hop_dong hd
left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join dich_vu_kem_theo dvkt on dvkt.ma_dich_vu_kem_theo = hdct.ma_dich_vu_kem_theo ;
 

 
--  6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,ten_loai_dich_vu
--  của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ
--  quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select
hd.ngay_lam_hop_dong,
dv.ma_dich_vu, 
dv.ten_dich_vu,
dv.dien_tich, 
dv.chi_phi_cho_thue,
ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on  dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on  dv.ma_dich_vu = hd.ma_dich_vu
where not (hd.ngay_lam_hop_dong between '2021-01-1 00:00:00' and '2021-04-1 :00:00')
group by dv.ma_dich_vu;

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

    select 
    hd.ngay_lam_hop_dong,
	dv.ma_dich_vu, 
	dv.ten_dich_vu,
	dv.dien_tich,  
	dv.so_nguoi_toi_da, 
	dv.chi_phi_cho_thue,
	ldv.ten_loai_dich_vu  as table_2020
	from dich_vu dv
	join loai_dich_vu ldv on  dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
	join hop_dong hd on  dv.ma_dich_vu = hd.ma_dich_vu
	where dv.ma_dich_vu not in( select 
								dv.ma_dich_vu
								from dich_vu dv
								join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
								where year(hd.ngay_lam_hop_dong)=2021  
                                group by dv.ma_dich_vu)   
	and  year(hd.ngay_lam_hop_dong)=2020
	group by dv.ma_dich_vu;
	
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, 
-- với yêu cầu ho_ten không trùng nhau.
--  Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- c1
select distinct kh.ho_va_ten
from khach_hang kh;

-- c2
select  kh.ho_va_ten
from khach_hang kh
group by kh.ho_va_ten ;
-- c3
select  kh.ho_va_ten
from khach_hang kh
group by kh.ho_va_ten ;
 
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa
--  là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select 
month(hd.ngay_lam_hop_dong) as thang,
count(hd.ngay_lam_hop_dong) as so_luong_hop_dong
from hop_dong hd
where year(hd.ngay_lam_hop_dong)='2021'
group by thang
order by  thang ;

 /*10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
 Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, 
 tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).*/
 
 
select 
    hop_dong.ma_hop_dong,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_hop_dong,
    hop_dong.tien_dat_coc, 
    COALESCE(sum(hop_dong_chi_tiet.so_luong), 0) as so_luong_dich_vu_di_kem
from
hop_dong
left join  hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
group by   hop_dong.ma_hop_dong;

 