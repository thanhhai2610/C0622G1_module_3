drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table phieu_xuat(
so_px int primary key,
ngay_xuat varchar(45)
);
create table phieu_nhap(
so_pn int primary key,
ngay_nhap varchar(45)
);
create table vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar(45)
);
create table nha_dung_cap(
ma_nha_cung_cap int primary key,
ten_nha_cung_cap varchar(45),
dia_chi varchar(45),
so_dien_thoai varchar(45)
);
create table don_dat_hang(
so_don_hang int primary key,
ngay_dat_hang varchar(45),
ma_nha_cung_cap int,
foreign key (ma_nha_cung_cap) references nha_dung_cap(ma_nha_cung_cap)
);

create table chi_tiet_PX(
dg_xuat double,
sl_xuat int,
so_px int,
ma_vat_tu int,
primary key(so_px,ma_vat_tu),
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table chi_tiet_PN(
dg_nhap double,
sl_nhap int,
so_pn int,
ma_vat_tu int,
primary key(so_pn ,ma_vat_tu),
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table chi_tiet_don_dat_hang(
so_don_hang int,
ma_vat_tu int,
primary key(so_don_hang , ma_vat_tu),
foreign key (so_don_hang) references don_dat_hang(so_don_hang),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table so_dien_thoai(
id_so_dien_thoai int primary key auto_increment,
so_dien_thoai varchar(45),
unique(so_dien_thoai),
ma_nha_cung_cap int,
foreign key (ma_nha_cung_cap) references nha_dung_cap(ma_nha_cung_cap)
);



