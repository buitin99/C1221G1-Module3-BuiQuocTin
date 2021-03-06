drop database if exists casestudy_database;
create database casestudy_database;
use casestudy_database;


create table casestudy_database.vi_tri(
ma_vi_tri int,
ten_vi_tri varchar(50),
primary key(ma_vi_tri)
);

create table casestudy_database.trinh_do(
ma_trinh_do int,
ten_trinh_do varchar(50),
primary key(ma_trinh_do));

create table casestudy_database.bo_phan(
ma_bo_phan int,
ten_bo_phan varchar(45),
primary key(ma_bo_phan));

create table casestudy_database.nhan_vien(
ma_nhan_vien int auto_increment,
ho_ten varchar(50) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int not null,
ma_trinh_do int not null,
ma_bo_phan int not null,
primary key(ma_nhan_vien),
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri) ,
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan));

create table casestudy_database.loai_khach(
ma_loai_khach int auto_increment,
ten_loai_khach varchar(50),
primary key(ma_loai_khach));

create table casestudy_database.khach_hang(
ma_khach_hang int auto_increment,
ma_loai_khach int not null,
ho_va_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
primary key(ma_khach_hang),
foreign key(ma_loai_khach) references loai_khach(ma_loai_khach)
);

create table casestudy_database.kieu_thue(
ma_kieu_thue int auto_increment,
ten_kieu_thue varchar(45),
primary key(ma_kieu_thue));

create table casestudy_database.loai_dich_vu(
ma_loai_dich_vu int auto_increment,
ten_loai_dich_vu varchar(45),
primary key(ma_loai_dich_vu));

create table casestudy_database.dich_vu(
ma_dich_vu int auto_increment,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int not null,
ma_loai_dich_vu int not null,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
primary key(ma_dich_vu),
foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu));

create table casestudy_database.hop_dong(
ma_hop_dong int auto_increment,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc_hop_dong datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int not null,
primary key(ma_hop_dong),
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien)  on delete set null,
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang) on delete set null,
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu));

create table casestudy_database.dich_vu_di_kem(
ma_dich_vu_di_kem int,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai varchar(45),
primary key(ma_dich_vu_di_kem));

create table casestudy_database.hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int auto_increment,
ma_hop_dong int not null,
ma_dich_vu_di_kem int not null,
so_luong int not null,
primary key(ma_hop_dong_chi_tiet),
foreign key(ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem));

insert into casestudy_database.vi_tri (ma_vi_tri,ten_vi_tri) 
values (1,"Qu???n L??"),
	   (2,"Nh??n Vi??n");

INSERT INTO `casestudy_database`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) 
VALUES ('1', 'Trung C???p'),
('2', 'Cao ?????ng'),
('3', '?????i H???c'),
('4', 'Sau ?????i H???c');

INSERT INTO `casestudy_database`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) 
VALUES  ('1', 'Sale-Marketing'),
		('2', 'H??nh ch??nh'),
		('3', 'Ph???c v???'),
		('4', 'Qu???n l??');
        
INSERT INTO `casestudy_database`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUES  ('1', 'Nguy???n V??n An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguy???n T???t Th??nh, ???? N???ng', '1', '3', '1'),
		('2', 'L?? V??n B??nh', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Y??n B??i, ???? N???ng', '1', '2', '2'),
		('3', 'H??? Th??? Y???n', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 ??i???n Bi??n Ph???, Gia Lai', '1', '3', '2'),
		('4', 'V?? C??ng To???n', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Ho??ng Di???u, Qu???ng Tr???', '1', '4', '4'),
		('5', 'Nguy???n B???nh Ph??t', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Y??n B??i, ???? N???ng', '2', '1', '1'),
		('6', 'Kh??c Nguy???n An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguy???n T???t Th??nh, ???? N???ng', '2', '2', '3'),
		('7', 'Nguy???n H???u H??', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguy???n Ch?? Thanh, Hu???', '2', '3', '2'),
		('8', 'Nguy???n H?? ????ng', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 H??ng V????ng, H?? N???i', '2', '4', '4'),
		('9', 'T??ng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 H??m Nghi, ???? N???ng', '2', '4', '4'),
		('10', 'Nguy???n C??ng ?????o', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Ho?? Kh??nh, ?????ng Nai', '2', '3','2');

        
insert INTO `casestudy_database`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) 
VALUES  ('1', 'Diamond'),
		('2', 'Platinium'),
		('3', 'Gold'),
		('4', 'Silver'),
		('5', 'Member');
        
INSERT INTO `casestudy_database`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_va_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES  ('1', '5', 'Nguy???n Th??? H??o', '1970-11-07', b'0', '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguy???n Ho??ng, ???? N???ng'),
		('2', '3', 'Ph???m Xu??n Di???u', '1992-08-08', b'1', '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Th??i Phi??n, Qu???ng Tr???'),
		('3', '1', 'Tr????ng ????nh Ngh???', '1990-02-27', b'1', '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 ??ng ??ch Khi??m, Vinh'),
		('4', '1', 'D????ng V??n Quan', '1981-07-08', b'1', '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 L?? L???i, ???? N???ng'),
		('5', '4', 'Ho??ng Tr???n Nhi Nhi', '1995-12-09', b'0', '795453345', '0312345678', 'nhinhi123@gmail.com', '224 L?? Th??i T???, Gia Lai'),
		('6', '4', 'T??n N??? M???c Ch??u', '2005-12-06', b'0', '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Y??n Th???, ???? N???ng'),
		('7', '1', 'Nguy???n M??? Kim', '1984-04-08', b'0', '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 L?? L???i, H??? Ch?? Minh'),
		('8', '3', 'Nguy???n Th??? H??o', '1999-04-08', b'0', '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguy???n V??n Linh, Kon Tum'),
		('9', '1', 'Tr???n ?????i Danh', '1994-07-01', b'1', '432341235', '0643343433', 'danhhai99@gmail.com', '24 L?? Th?????ng Ki???t, Qu???ng Ng??i'),
		('10', '2', 'Nguy???n T??m ?????c', '1989-07-01', b'1', '344343432', '0987654321', 'dactam@gmail.com', '22 Ng?? Quy???n, ???? N???ng');
        
INSERT INTO `casestudy_database`.`kieu_thue` (`ma_kieu_thue`, `ten_kieu_thue`) 
VALUES  ('1', 'year'),
		('2', 'month'),
		('3', 'day'),
		('4', 'hour');


INSERT INTO `casestudy_database`.`loai_dich_vu` (`ma_loai_dich_vu`, `ten_loai_dich_vu`) 
VALUES  ('1', 'Villa'),
		('2', 'House'),
		('3', 'Room');

INSERT INTO `casestudy_database`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`) VALUES ('1', 'Villa Beach Front', '25000', '10000000', '10', '3', '1', 'vip', 'C?? h??? b??i', '500', '4');
INSERT INTO `casestudy_database`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `so_tang`) VALUES ('2', 'House Princess 01', '14000', '5000000', '7', '2', '2', 'vip', 'C?? th??m b???p n?????ng', '3');
INSERT INTO `casestudy_database`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`) VALUES ('3', 'Room Twin 01', '5000', '1000000', '2', '4', '3', 'normal', 'C?? tivi');
INSERT INTO `casestudy_database`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`) VALUES ('4', 'Villa No Beach Front', '22000', '9000000', '8', '3', '1', 'normal', 'C?? h??? b??i', '300', '3');
INSERT INTO `casestudy_database`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `so_tang`) VALUES ('5', 'House Princess 02', '10000', '4000000', '5', '3', '2', 'normal', 'C?? th??m b???p n?????ng', '2');
INSERT INTO `casestudy_database`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`) VALUES ('6', 'Room Twin 02', '3000', '900000', '2', '4', '3', 'normal', 'C?? tivi');


INSERT INTO `casestudy_database`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) 
VALUES  ('1', 'Karaoke', '10000', 'gi???', 'ti???n nghi, hi???n t???i'),
		('2', 'Thu?? xe m??y', '10000', 'chi???c', 'h???ng 1 xe'),
		('3', 'Thu?? xe ?????p', '20000', 'chi???c', 't???t'),
		('4', 'Buffet bu???i s??ng', '15000', 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng'),
		('5', 'Buffet bu???i tr??a', '90000', 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng'),
		('6', 'Buffet bu???i t???i', '16000', 'su???t', '?????y ????? ????? ??n, tr??ng mi???ng');

INSERT INTO `casestudy_database`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc_hop_dong`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) 
VALUES  ('1', '2020-12-08', '2020-12-08', '0', '3', '1', '3'),
		('2', '2020-07-14', '2020-07-21', '200000', '7', '3', '1'),
		('3', '2021-03-15', '2021-03-17', '50000', '3', '4','2'),
		('4', '2021-01-14', '2021-01-18', '100000', '7', '5', '5'),
		('5', '2021-07-14', '2021-07-15', '0', '7', '2', '6'),
		('6', '2021-06-01', '2021-06-03', '0', '7', '7', '6'),
		('7', '2021-09-02', '2021-09-05', '100000', '7', '4', '4'),
		('8', '2021-06-17', '2021-06-18', '150000', '3', '4', '1'),
		('9', '2020-11-19', '2020-11-19', '0', '3', '4', '3'),
		('10', '2021-04-12', '2021-04-14', '0', '10', '3', '5'),
		('11', '2021-04-25', '2021-04-25', '0', '2', '2', '1'),
		('12', '2021-05-25', '2021-05-27', '0', '7', '10', '1');

INSERT INTO `casestudy_database`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) 
VALUES  ('1', '2', '4', '5'),
		('2', '2', '5', '8'),
		('3', '2', '6', '15'),
		('4', '3', '1', '1'),
		('5', '3', '2', '11'),
		('6', '1', '3', '1'),
		('7', '1', '2', '2'),
		('8', '12', '2', '2');


-- 2 Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l?? m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? v?? c?? t???i ??a 15 k?? t???.
SELECT ho_ten FROM nhan_vien WHERE nhan_vien.ho_ten REGEXP '^[HKT]' AND LENGTH(ho_ten) <= 16;

-- 3 Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.
select*from khach_hang where (datediff(curdate() , khach_hang.ngay_sinh)/365 <50 
and datediff(curdate() , khach_hang.ngay_sinh)/365 > 18) 
and (khach_hang.dia_chi like "%???? N???ng%" or khach_hang.dia_chi like "%Qu???ng Tr???%");

-- 4 ?????m xem t????ng ???ng v???i m???i kh??ch h??ng ???? t???ng ?????t ph??ng bao nhi??u l???n. 
-- K???t qu??? hi???n th??? ???????c s???p x???p t??ng d???n theo s??? l???n ?????t ph??ng c???a kh??ch h??ng. 
-- Ch??? ?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?? ???Diamond???.

select khach_hang.ho_va_ten, count(hop_dong.ma_khach_hang) as so_lan_dat_phong from loai_khach join khach_hang 
on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
where loai_khach.ten_loai_khach = 'Diamond' group by khach_hang.ma_khach_hang having so_lan_dat_phong > 0 order by so_lan_dat_phong;

-- 5. Hi???n th??? ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (V???i t???ng ti???n ???????c t??nh theo c??ng th???c nh?? sau: Chi Ph?? Thu?? + S??? L?????ng * Gi??, v???i S??? L?????ng v?? Gi?? l?? t??? b???ng dich_vu_di_kem,
-- hop_dong_chi_tiet) cho t???t c??? c??c kh??ch h??ng ???? t???ng ?????t ph??ng. (nh???ng kh??ch h??ng n??o ch??a t???ng ?????t ph??ng c??ng ph???i hi???n th??? ra).
-- 
select khach_hang.ma_khach_hang, khach_hang.ho_va_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong,
hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc_hop_dong, dich_vu.ten_dich_vu, 
sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia) as tong_tien 
from loai_khach  join khach_hang on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach join hop_dong 
on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong left join dich_vu_di_kem 
on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem group by khach_hang.ma_khach_hang 
order by khach_hang.ma_khach_hang;
--
select khach_hang.ma_khach_hang, khach_hang.ho_va_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong,
hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc_hop_dong, dich_vu.ten_dich_vu, 
sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia) as tong_tien from khach_hang 
left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong 
left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem 
group by hop_dong.ma_hop_dong 
order by khach_hang.ma_khach_hang;

-- 6 Hi???n th??? ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, 
-- ten_loai_dich_vu c???a t???t c??? c??c lo???i d???ch v??? ch??a t???ng ???????c kh??ch h??ng th???c hi???n ?????t t??? qu?? 1 c???a n??m 2021 (Qu?? 1 l?? th??ng 1, 2, 3).
--
select distinct dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu from loai_dich_vu 
right join dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_dich_vu 
right join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu 
where dich_vu.ma_dich_vu 
not in (select hop_dong.ma_dich_vu from hop_dong where hop_dong.ngay_lam_hop_dong between '2020-12-31' and '2021-03-31');
--
select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu from
dich_vu join loai_dich_vu on dich_vu.ma_dich_vu = loai_dich_vu.ma_loai_dich_vu
where not exists(select hop_dong.ma_dich_vu from hop_dong where (hop_dong.ngay_lam_hop_dong between '2020-12-31' and '2021-03-31')
and hop_dong.ma_dich_vu = dich_vu.ma_dich_vu);

-- 7 Hi???n th??? th??ng tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu c???a t???t c??? c??c 
-- lo???i d???ch v??? ???? t???ng ???????c kh??ch h??ng ?????t ph??ng trong n??m 2020 nh??ng ch??a t???ng ???????c kh??ch h??ng ?????t ph??ng trong n??m 2021. 

select distinct dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu 
from loai_dich_vu join dich_vu on loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu join hop_dong 
on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu join khach_hang 
on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang 
where (dich_vu.ma_dich_vu in (select hop_dong.ma_dich_vu from hop_dong where year(hop_dong.ngay_lam_hop_dong)=2020) ) 
and ( dich_vu.ma_dich_vu not in (select hop_dong.ma_dich_vu from hop_dong where year(hop_dong.ngay_lam_hop_dong)=2021));

select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu join loai_dich_vu on dich_vu.ma_dich_vu = loai_dich_vu.ma_loai_dich_vu
where exists(select hop_dong.ma_hop_dong from hop_dong where year(hop_dong.ngay_lam_hop_dong) = '2020' and hop_dong.ma_dich_vu = dich_vu.ma_dich_vu)
and not exists(select hop_dong.ma_hop_dong from hop_dong where year(hop_dong.ngay_lam_hop_dong) = '2021' and hop_dong.ma_dich_vu = dich_vu.ma_dich_vu);
-- 8 Hi???n th??? th??ng tin ho_ten kh??ch h??ng 
-- c?? trong h??? th???ng, v???i y??u c???u ho_ten kh??ng tr??ng nhau.
select khach_hang.ho_va_ten from khach_hang union 
select khach_hang.ho_va_ten from khach_hang;

select distinct ho_va_ten from khach_hang;

select ho_va_ten from khach_hang  group by khach_hang.ho_va_ten;

-- 9.Th???c hi???n th???ng k?? doanh thu theo th??ng, ngh??a l?? t????ng ???ng v???i m???i th??ng trong n??m 2021 
-- th?? s??? c?? bao nhi??u kh??ch h??ng th???c hi???n ?????t ph??ng.

select month(hop_dong.ngay_lam_hop_dong), count(khach_hang.ma_khach_hang) from hop_dong join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang 
where year(hop_dong.ngay_lam_hop_dong) = 2021 group by month(hop_dong.ngay_lam_hop_dong) order by month(hop_dong.ngay_lam_hop_dong);

select 1 as month
union select 2 as month
union select 3 as month
union select 4 as month
union select 5 as month
union select 6 as month
union select 7 as month
union select 8 as month
union select 9 as month
union select 10 as month
union select 11 as month
union select 12 as month

-- 10.Hi???n th??? th??ng tin t????ng ???ng v???i t???ng h???p ?????ng th?? ???? s??? d???ng bao nhi??u d???ch v??? ??i k??m. K???t qu??? hi???n th??? bao g???m ma_hop_dong, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (???????c t??nh d???a tr??n vi???c sum so_luong ??? dich_vu_di_kem).

select hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc_hop_dong, hop_dong.tien_dat_coc,
 sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem
from hop_dong left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong group by hop_dong.ma_hop_dong order by hop_dong.ma_hop_dong;   

-- 11.	Hi???n th??? th??ng tin c??c d???ch v??? ??i k??m ???? ???????c s??? d???ng b???i nh???ng kh??ch h??ng c?? ten_loai_khach l?? ???Diamond??? v?? c?? dia_chi ??? 
-- ???Vinh??? ho???c ???Qu???ng Ng??i???.

select dich_vu_di_kem.ma_dich_vu_di_kem,dich_vu_di_kem.ten_dich_vu_di_kem 
from dich_vu_di_kem join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong  join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang  
join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
where loai_khach.ten_loai_khach like 'Diamond' and (khach_hang.dia_chi like '%Vinh%' or '%Qu???ng Ng??i%') 
group by dich_vu_di_kem.ma_dich_vu_di_kem order by dich_vu_di_kem.ma_dich_vu_di_kem;  

-- 12.	Hi???n th??? th??ng tin ma_hop_dong, ho_ten (nh??n vi??n), ho_ten (kh??ch h??ng), so_dien_thoai (kh??ch h??ng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (???????c t??nh d???a tr??n vi???c sum so_luong ??? dich_vu_di_kem), 
-- tien_dat_coc c???a t???t c??? c??c d???ch v??? ???? t???ng ???????c kh??ch h??ng ?????t v??o 3 th??ng cu???i n??m 2020 nh??ng ch??a t???ng ???????c 
-- kh??ch h??ng ?????t v??o 6 th??ng ?????u n??m 2021.

select hop_dong.ma_hop_dong, nhan_vien.ho_ten, khach_hang.ho_va_ten, khach_hang.so_dien_thoai, dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, 
sum(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem, hop_dong.tien_dat_coc from hop_dong left join nhan_vien on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien left join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
left join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
where (hop_dong.ngay_lam_hop_dong between '2020-10-01' and  '2020-12-31') and  (hop_dong.ngay_lam_hop_dong not between '2021-01-01' and '2021-06-31') group by hop_dong.ma_hop_dong;

-- 13.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???????c s??? d???ng 
-- nhi???u nh???t b???i c??c Kh??ch h??ng ???? ?????t ph??ng. (L??u ?? l?? c?? th??? c?? nhi???u d???ch v??? c?? s??? l???n s??? d???ng nhi???u nh?? nhau).

select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem, sum(hop_dong_chi_tiet.so_luong)  as so_luong_dich_vu_di_kem
from dich_vu_di_kem join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
group by ten_dich_vu_di_kem having so_luong_dich_vu_di_kem order by so_luong_dich_vu_di_kem desc limit 2;

-- 14.	Hi???n th??? th??ng tin t???t c??? c??c D???ch v??? ??i k??m ch??? m???i ???????c s??? d???ng m???t l???n duy nh???t.
--  Th??ng tin hi???n th??? bao g???m ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
-- so_lan_su_dung (???????c t??nh d???a tr??n vi???c count c??c ma_dich_vu_di_kem).

select hop_dong.ma_hop_dong, dich_vu.ten_dich_vu, dich_vu_di_kem.ten_dich_vu_di_kem, count(dich_vu_di_kem.ma_dich_vu_di_kem) as so_lan_su_dung 
from dich_vu_di_kem join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong  join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu 
group by dich_vu_di_kem.ma_dich_vu_di_kem having so_lan_su_dung = 1 order by hop_dong.ma_hop_dong;

-- 15.Hi???n thi th??ng tin c???a t???t c??? nh??n vi??n bao 
-- g???m ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi m???i ch??? l???p ???????c t???i ??a 3 h???p ?????ng t??? n??m 2020 ?????n 2021..

select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, trinh_do.ten_trinh_do, bo_phan.ten_bo_phan, nhan_vien.so_dien_thoai, nhan_vien.dia_chi, 
count(hop_dong.ma_hop_dong) as hop_dong_ky 
from vi_tri  join nhan_vien on vi_tri.ma_vi_tri = nhan_vien.ma_vi_tri 
join trinh_do on nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do 
join bo_phan on nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan 
join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien where hop_dong.ngay_lam_hop_dong between '2020-01-01' and '2021-12-31'
group by nhan_vien.ma_nhan_vien having hop_dong_ky <= 3;

-- 16 X??a nh???ng Nh??n vi??n ch??a t???ng l???p ???????c h???p ?????ng n??o t??? n??m 2019 ?????n n??m 2021.

set sql_safe_updates =0;									
delete nhan_vien from nhan_vien
left join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where hop_dong.ma_nhan_vien not in 
(select distinct nhan_vien.ma_nhan_vien where year(hop_dong.ngay_lam_hop_dong) between '2019' and '2021');
set sql_safe_updates =1;

-- 17.	C???p nh???t th??ng tin nh???ng kh??ch h??ng c?? ten_loai_khach t??? Platinum l??n Diamond, 
-- ch??? c???p nh???t nh???ng kh??ch h??ng ???? t???ng ?????t ph??ng v???i T???ng Ti???n thanh to??n trong n??m 2021 l?? l???n h??n 10.000.000 VN??.

create or replace view khach_hang_view as
select khach_hang.ma_khach_hang
from loai_khach join khach_hang on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem where loai_khach.ma_loai_khach = 2 
and (hop_dong.ngay_lam_hop_dong > '2021-01-01' and hop_dong.ngay_lam_hop_dong < '2021-12-31')
group by khach_hang.ho_va_ten having sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia) > 10000000 ;
 
set sql_safe_updates = 0;	
update khach_hang, (select ma_khach_hang from khach_hang_view ) as view_khach_hang
set khach_hang.ma_loai_khach = 1 where khach_hang.ma_khach_hang = view_khach_hang.ma_khach_hang;  
set sql_safe_updates = 1;
	
-- 18 X??a nh???ng kh??ch h??ng c?? h???p ?????ng tr?????c n??m 2021 (ch?? ?? r??ng bu???c gi???a c??c b???ng).

select khach_hang.ma_khach_hang, khach_hang.ho_va_ten from hop_dong 
join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
 where hop_dong.ngay_ket_thuc_hop_dong < '2021-01-01';

set sql_safe_updates =0;
set foreign_key_checks =0;
delete khach_hang  from hop_dong join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
 where hop_dong.ngay_ket_thuc_hop_dong < '2021-01-01';						
set sql_safe_updates =1;
set foreign_key_checks =1;

-- 19 C???p nh???t gi?? cho c??c d???ch v??? ??i k??m ???????c s??? d???ng tr??n 10 l???n trong n??m 2020 l??n g???p ????i.
drop view dich_vu_view;

create view dich_vu_view as
select dich_vu_di_kem.ma_dich_vu_di_kem,hop_dong_chi_tiet.so_luong, dich_vu_di_kem.ten_dich_vu_di_kem
from dich_vu_di_kem join hop_dong_chi_tiet 
on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
where hop_dong_chi_tiet.so_luong > 10 and (hop_dong.ngay_lam_hop_dong > '2020-01-01' and hop_dong.ngay_lam_hop_dong < '2020-12-31');


set sql_safe_updates = 0;	
update dich_vu_di_kem, (select ma_dich_vu_di_kem from dich_vu_view) as view_select
set gia = gia*2 where dich_vu_di_kem.ma_dich_vu_di_kem = view_select.ma_dich_vu_di_kem;  
set sql_safe_updates = 1;

-- 20 Hi???n th??? th??ng tin c???a t???t c??? c??c nh??n vi??n v?? kh??ch h??ng c?? trong h??? th???ng, 
-- th??ng tin hi???n th??? bao g???m id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select nhan_vien.ma_nhan_vien, nhan_vien.ho_ten, nhan_vien.email, nhan_vien.so_dien_thoai, nhan_vien.dia_chi from nhan_vien union all
select khach_hang.ma_khach_hang, khach_hang.ho_va_ten, khach_hang.email, khach_hang.so_dien_thoai, khach_hang.dia_chi from khach_hang;

--
create view dich_vu_view as
select dich_vu_di_kem.ma_dich_vu_di_kem,hop_dong_chi_tiet.so_luong, dich_vu_di_kem.ten_dich_vu_di_kem
from dich_vu_di_kem join hop_dong_chi_tiet 
on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem 
join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
where hop_dong_chi_tiet.so_luong > 10 and (hop_dong.ngay_lam_hop_dong > '2020-01-01' and hop_dong.ngay_lam_hop_dong < '2020-12-31') 
group by hop_dong_chi_tiet.ma_dich_vu_di_kem;

set sql_safe_updates = 0;	
update dich_vu_di_kem
set gia = gia*2 where dich_vu_di_kem.ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from dich_vu_view); 
set sql_safe_updates = 1;

-- 21
INSERT INTO `casestudy_database`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUES ('11', 'B??i Qu???c T??n', '1999-01-25', '123323321', '8000000', '0123456789', 'buiquoctin250199@gmail.com', '7 H???i Ch??u, ???? N???ng', '2', '3', '4');

INSERT INTO `casestudy_database`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc_hop_dong`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) 
VALUES ('14', '2021-12-12 00:00:00', '2021-12-12 12:00:00', '500000', '11', '7', '3');

create view v_nhan_vien as
select nhan_vien.ho_ten,nhan_vien.dia_chi, nhan_vien.email from nhan_vien 
join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
where hop_dong.ngay_lam_hop_dong = '2021-12-12' group by nhan_vien.ho_ten;

-- 22

set sql_safe_updates = 0;	
update nhan_vien
set dia_chi = 'Li??n Chi???u' where nhan_vien.ho_ten in (select ho_ten from v_nhan_vien); 
set sql_safe_updates = 1;

-- 23

INSERT INTO `casestudy_database`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_va_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES ('11', '1', 'B??i Qu???c T??n', '1999-01-25', b'1', '322322232', '0123456789', 'buiquoctin250199@gmail.com', 'H???i Ch??u, ???? N???ng');

DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang(ID INT(55))
BEGIN
delete khach_hang from khach_hang where khach_hang.ma_khach_hang = ID;
END //
DELIMITER ;

CALL sp_xoa_khach_hang(11);

-- 24

DELIMITER //
CREATE PROCEDURE sp_them_moi_hop_dong()
BEGIN
insert into hop_dong (hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc_hop_dong,hop_dong.tien_dat_coc,
hop_dong.ma_nhan_vien,hop_dong.ma_khach_hang,hop_dong.ma_dich_vu) values
 ('2021-12-12', '2021-12-31', 500000, 3,7,1);
END //
DELIMITER ;

CALL sp_them_moi_hop_dong();

-- 25

DELIMITER //
CREATE TRIGGER tr_xoa_hop_dong 
ON hop_dong 
FOR EACH ROW
BEGIN
END
DELIMITER ;

-- s???a case study
-- task 25
DELIMITER //
CREATE TRIGGER tr_xoa_hop_dong AFTER DELETE
ON hop_dong 
FOR EACH ROW
BEGIN
SET @x = (SELECT count(*) AS FROM hop_dong);
END
DELIMITER ;
set foreign_key_checks =0;
SET @x = 0;
DELETE FROM hop_dong where hop_dong.ma_hop_dong = 12;
SELECT @x AS 'Total amount deleted' ;
set foreign_key_checks =0;

-- task 26
DELIMITER //

CREATE TRIGGER tr_cap_nhat_hop_dong
    BEFORE UPDATE
    ON hop_dong
    FOR EACH ROW
BEGIN
    IF datediff(NEW.ngay_ket_thuc_hop_dong, NEW.ngay_lam_hop_dong) < 2 THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT ='Ng??y k???t th??c h???p ?????ng ph???i l???n h??n ng??y l??m h???p ?????ng ??t nh???t l?? 2 ng??y';
    END IF;
END //
DELIMITER ;

UPDATE hop_dong set ngay_ket_thuc_hop_dong = '2021-09-08' WHERE ma_hop_dong = 7;

-- task 27 
delimiter //
drop function if exists func_dem_dich_vu //
create function func_dem_dich_vu() returns int
deterministic 
begin
create temporary table temp
(select count(distinct ma_dich_vu) from hop_dong where ma_dich_vu in (select distinct ma_dich_vu from hop_dong)
group by ma_dich_vu having sum(tong_tien) > 2000000);
set @tong_so_dich_vu = (select count(*) from temp);
drop temporary table temp;
return @tong_so_dich_vu;
end;

select func_dem_dich_vu() as 'T???ng s??? l?????ng d???ch v??? c?? t???ng ti???n tr??n 2000000';

delimiter //
drop function if exists func_tinh_thoi_gian_hop_dong //
create function func_tinh_thoi_gian_hop_dong(ma_khach_hang int ) returns int
deterministic 
begin
	set @thoi_gian_dai_nhat = (select max(datediff(hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket)) from hop_dong
    where hop_dong.ma_hop_dong = ma_khach_hang);
    return @thoi_gian_dai_nhat;
end;

select func_tinh_thoi_gian_hop_dong(4) as 'th???i gian d??i nh???t';

-- task 28
delimiter //
drop procedure if exists sp_xoa_dich_vu_va_hd_room //
create procedure sp_xoa_dich_vu_va_hd_room()
begin
	declare dich_vu int default 0;
	declare hoan_thanh int default 0;
	declare con_tro cursor for
		select dich_vu.ma_dich_vu from dich_vu join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
        join loai_dich_vu on dich_vu.ma_dich_vu = loai_dich_vu.ma_loai_dich_vu 
        where loai_dich_vu.ten_loai_dich_vu = 'room' and year(hop_dong.ngay_lam_hop_dong) between '2015' and '2025' ;
	declare continue handler for not found set hoan_thanh = 1;
    open con_tro;
    get_list: loop
    fetch from con_tro into dich_vu;
    if hoan_thanh = 1 then
    leave get_list;
    end if;
    delete from hop_dong where hop_dong.ma_dich_vu = dich_vu ;
    delete from dich_vu where dich_vu.ma_dich_vu = dich_vu ;
    
    end loop get_list;
    close con_tro;
end //

set foreign_key_checks =0;
call sp_xoa_dich_vu_va_hd_room();
set foreign_key_checks =1;


