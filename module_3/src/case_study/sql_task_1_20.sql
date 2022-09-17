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
	and (khach_hang.dia_chi like '%Đà Nẵng' or khach_hang.dia_chi like'%Quảng Trị' );
     

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
left join dich_vu_kem_theo dvkt on dvkt.ma_dich_vu_kem_theo = hdct.ma_dich_vu_kem_theo 
group by  hd.ma_hop_dong 
order by  kh.ma_khach_hang ;
 
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
where dv.ma_dich_vu not in (select
							dv.ma_dich_vu
							from dich_vu dv
							join loai_dich_vu ldv on  dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
							join hop_dong hd on  dv.ma_dich_vu = hd.ma_dich_vu
                            where ((month(hd.ngay_lam_hop_dong) between 1 and 3)
									and year(hd.ngay_lam_hop_dong) = '2021')
									group by dv.ten_dich_vu)
group by dv.ten_dich_vu;
                            
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

/* 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi 
những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.*/
 select  dvkt.ten_dich_vu_kem_theo, dvkt.ma_dich_vu_kem_theo
 from loai_khach lkh
 join khach_hang kh on lkh.ma_loai_khach = kh.ma_loai_khach
 join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
 join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
 join dich_vu_kem_theo dvkt on dvkt.ma_dich_vu_kem_theo = hdct.ma_dich_vu_kem_theo
 where lkh.ten_loai_khach = 'Diamond' 
 and kh.dia_chi like ('%Vinh' ) or kh.dia_chi like ('%Quảng Ngãi');
 
 /*12.	Hiển thị thông tin    ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
 ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
 của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.*/
 select
 hd.ngay_lam_hop_dong,  
 hd.ma_hop_dong, 
 nv.ho_va_ten as ho_va_ten_nhan_vien,
 kh.ho_va_ten as ho_va_ten_khach_hang,
 kh.so_dien_thoai as so_dien_thoai_khach_hang,
 dv.ten_dich_vu,
 dvkt.ten_dich_vu_kem_theo,
 count(hdct.ma_dich_vu_kem_theo) as so_luong_dich_vu_di_kem
 from khach_hang kh
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_kem_theo dvkt on dvkt.ma_dich_vu_kem_theo = hdct.ma_dich_vu_kem_theo
 where (quarter(hd.ngay_lam_hop_dong) =4 ) and (year(hd.ngay_lam_hop_dong)=2020)
 and  hd.ngay_lam_hop_dong not in (select
								 hd.ngay_lam_hop_dong
								 from hop_dong hd
								 where (month(hd.ngay_lam_hop_dong) between 1 and 6)  
                                 and (year(hd.ngay_lam_hop_dong)=2021)
                                 group by ma_hop_dong)
 group by ma_hop_dong ;
 
 /*13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
 (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).*/
select 
hdct.ma_dich_vu_kem_theo, 
dvkt.ten_dich_vu_kem_theo,
sum(hdct.so_luong) as so_lan_dat
from  khach_hang kh
 join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
 join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
 join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
 join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
 join dich_vu_kem_theo dvkt on dvkt.ma_dich_vu_kem_theo = hdct.ma_dich_vu_kem_theo
group by dvkt.ma_dich_vu_kem_theo
having sum(hdct.so_luong) >= all (select  sum(hdct.so_luong) as so_lan_dat
									from  khach_hang kh
										 join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
										 join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
										 join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
										 join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
										 join dich_vu_kem_theo dvkt on dvkt.ma_dich_vu_kem_theo = hdct.ma_dich_vu_kem_theo
										group by dvkt.ma_dich_vu_kem_theo);

/*14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).*/
select 
hd.ma_hop_dong,
ldv.ten_loai_dich_vu,
dvkt.ten_dich_vu_kem_theo,
count(hdct.so_luong) as so_lan_dat
from  hop_dong hd
 join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
 join dich_vu_kem_theo dvkt on dvkt.ma_dich_vu_kem_theo = hdct.ma_dich_vu_kem_theo
 join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
 join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
group by hdct.ma_dich_vu_kem_theo
having so_lan_dat <=1; 
 
 /*
15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi
 mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.*/
select
 nv.ma_nhan_vien,  hd.ngay_lam_hop_dong, count(hd.ma_hop_dong) as so_lan_ki_hd,
 nv.ho_va_ten,
 trd.ten_trinh_do,
 bp.ten_bo_phan,
 nv.so_dien_thoai,
 nv.dia_chi
from hop_dong hd
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien 
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan 
join trinh_do trd on trd.ma_trinh_do = nv.ma_trinh_do 
group by  hd.ma_nhan_vien
HAVING so_lan_ki_hd <3;

/*16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.*/
set sql_safe_updates = 0;
DELETE from nhan_vien 
WHERE NOT EXISTS ( SELECT 
						 ma_nhan_vien 
						 FROM hop_dong 
						 WHERE ma_nhan_vien = nhan_vien.ma_nhan_vien
                          ) ;
SELECT ma_nhan_vien, ho_va_ten FROM nhan_vien;

/*  17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.*/
 CREATE VIEW kh_can_update AS
							 SELECT 
							  hd.ma_khach_hang,
							  kh.ma_loai_khach,
							 sum(hdct.so_luong*dvkt.gia + dv.chi_phi_cho_thue) as tien_dat_coc
							 FROM hop_dong hd 
                             JOIN khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
                             JOIN hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
                             JOIN dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
                             JOIN dich_vu_kem_theo dvkt on dvkt.ma_dich_vu_kem_theo = hdct.ma_dich_vu_kem_theo
							 GROUP BY  kh.ma_khach_hang
                             HAVING tien_dat_coc > 1000000
                             AND ma_loai_khach =2;
							
set sql_safe_updates = 0;
 UPDATE  khach_hang kh
 SET kh.ma_loai_khach = 1
 WHERE kh.ma_loai_khach IN (SELECT ma_loai_khach FROM kh_can_update);
 SELECT *  FROM khach_hang kh;
 
 /*18.	Xóa những khách hàng có hợp đồng trước năm 2021 
 (chú ý ràng buộc giữa các bảng).*/
DROP VIEW IF EXISTS  delete_hd_truoc_2021;
CREATE VIEW delete_hd_truoc_2021 AS
								SELECT hd .ma_khach_hang, hd.ngay_lam_hop_dong
								FROM hop_dong hd 
								WHERE year(hd.ngay_lam_hop_dong ) <2021;
                        
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM khach_hang
WHERE ma_khach_hang IN (SELECT ma_khach_hang FROM  delete_hd_truoc_2021 );
 
 /*19.	Cập nhật giá cho các      dịch vụ đi kèm 
 được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.*/
 
 DROP VIEW IF EXISTS  dvkt_sd_tren_10_lan;
 CREATE VIEW dvkt_sd_tren_10_lan as
 SELECT hdct.ma_dich_vu_kem_theo, sum(hdct.so_luong ) AS so_lan_su_dung , hd.ngay_lam_hop_dong
 FROM hop_dong_chi_tiet hdct 
 JOIN dich_vu_kem_theo dvkt on dvkt.ma_dich_vu_kem_theo = hdct.ma_dich_vu_kem_theo
 JOIN hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
 WHERE year(hd.ngay_lam_hop_dong) = 2020
 GROUP BY hdct.ma_dich_vu_kem_theo 
 HAVING   so_lan_su_dung >10;
 
 UPDATE dich_vu_kem_theo
 SET dich_vu_kem_theo.gia = dich_vu_kem_theo.gia*2
 WHERE dich_vu_kem_theo.ma_dich_vu_kem_theo IN (SELECT ma_dich_vu_kem_theo FROM dvkt_sd_tren_10_lan  );
 
 /*20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng 
 có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang),
 ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.*/
 
 SELECT nhan_vien.*,khach_hang.*
 FROM nhan_vien nv
 JOIN khach_hang
 GROUP BY nv.ma_nhan_vien ;
 