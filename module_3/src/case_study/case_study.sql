drop database if exists Furama;
create database  Furama;
use Furama;
create table vi_tri(
ma_vi_tri int primary key,
ten_vi_tri varchar(45)
);
create table trinh_do(
ma_trinh_do int primary key,
ten_trinh_do varchar(45)
);
create table bo_phan(
ma_bo_phan int primary key,
ten_bo_phan varchar(45)
);
create table loai_khach(
ma_loai_khach int primary key,
ten_loai_khach varchar(45)
);
create table kieu_thue(
ma_kieu_thue int primary key,
ten_kieu_thue varchar(45)
);
create table loai_dich_vu(
ma_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(45)
);
create table dich_vu_kem_theo(
ma_dich_vu_kem_theo int primary key,
ten_dich_vu_kem_theo varchar(45),
gia double,
don_vi varchar(45),
trang_thai varchar(45)
);

create table nhan_vien(
ma_nhan_vien int primary key,
ho_va_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
emai varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
FOREIGN KEY(ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
FOREIGN KEY(ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
FOREIGN KEY(ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

create table khach_hang(
ma_khach_hang int primary key,
ma_loai_khach int,
foreign key (ma_loai_khach) references loai_khach(ma_loai_khach) ,
ho_va_ten varchar(45),
ngay_sinh date,
gioi_tinh bit,
so_cmnd varchar(45),
so_dien_thoai varchar(45),
emai varchar(45),
dia_chi varchar(45)
);

create table dich_vu(
ma_dich_vu int primary key,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_cho_thue double,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi varchar(45),
dien_ho_boi double,
so_tang int,
dich_vu_mien_phi_di_kem text
);
create table hop_dong(
ma_hop_dong int primary key,
ngay_lam_hop_dong datetime,
ngay_ket_hop_dong datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);

create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key,
ma_hop_dong int,
ma_dich_vu_kem_theo int,
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key (ma_dich_vu_kem_theo) references dich_vu_kem_theo(ma_dich_vu_kem_theo),
so_luong int
);








