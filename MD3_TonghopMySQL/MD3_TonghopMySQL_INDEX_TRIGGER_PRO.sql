Create Database QuanLyDiemSV;
use QuanLyDiemSV;
/*=============DANH MUC KHOA==============*/
Create table DMKhoa
(
MaKhoa char(2) primary key,
TenKhoa nvarchar(30)not null
);
/*==============DANH MUC SINH VIEN============*/
Create table DMSV
(
MaSV char(3) primary key,
HoSV nvarchar(15) not null,
TenSV nvarchar(7)not null,
Phai nchar(7),
NgaySinh datetime not null,
NoiSinh nvarchar (20),
MaKhoa char(2),
HocBong float,
foreign key (MaKhoa) references DMKhoa(MaKhoa)
);
/*===================MON HOC========================*/
create table DMMH
(
MaMH char (2) primary key,
TenMH nvarchar (25)not null,
SoTiet tinyint
);
/*=====================KET QUA===================*/
Create table KetQua
(
MaSV char(3) not null,
MaMH char (2)not null ,
LanThi tinyint,
Diem decimal(4,2),
foreign key(MaSV) references DMSV(MaSV),
foreign key(MaMH) references DMMH(MaMH),
primary key (MaSV,MaMH,LanThi)
);
/*==========================TAO KHOA NGOAI==============================*/
/*==============NHAP DU LIEU DMMH=============*/
Insert into DMMH(MaMH,TenMH,SoTiet)
values('01','Cơ Sở Dữ Liệu',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('02','Trí Tuệ Nhân Tạo',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('03','Truyền Tin',45);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('04','Đồ Họa',60);
Insert into DMMH(MaMH,TenMH,SoTiet)
values('05','Văn Phạm',60);
/*==============NHAP DU LIEU DMKHOA=============*/
Insert into DMKhoa(MaKhoa,TenKhoa)
values('AV','Anh Văn');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TH','Tin Học');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TR','Triết');
Insert into DMKhoa(MaKhoa,TenKhoa)
values('VL','Vật Lý');
/*==============NHAP DU LIEU DMSV=============*/
Insert into DMSV
values('A01','Nguyễn Thị','Hải','Nữ','1990-02-23','Hà Nội','TH',130000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A02','Trần Văn','Chính','Nam','1992-12-24','Bình Định','VL',150000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A03','Lê Thu Bạch','Yến','Nữ','1990-02-21','TP Hồ Chí Minh','TH',170000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A04','Trần Anh','Tuấn','Nam','1990-12-20',N'Hà Nội','AV',80000);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B01','Trần Thanh','Mai','Nữ','1991-08-12','Hải Phòng','TR',0);
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B02','Trần Thị Thu','Thủy','Nữ','1991-01-02','TP Hồ Chí Minh','AV',0);
/*==============NHAP DU LIEU BANG KET QUA=============*/

Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',1,3);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',2,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','02',2,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','03',1,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',1,4.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',2,7);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','03',1,10);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','05',1,9);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',1,2);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',2,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',1,2.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',2,4);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A04','05',2,10);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','01',1,7);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',1,2.5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',2,5);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','02',1,6);
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','04',1,10);
-- 1. lấy thông tin  Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần
select s.MaSV,m.MaMH,s.HoSV,s.HocBong
from dmsv s
join ketqua k on s.MaSV = k.MaSV
join dmmh m on k.MaMH = m.MaMH;
-- 2. lấy thông tin: Mã sinh viên, họ tên sinh viên, Phái, Ngày sinh và sắp xếp theo thứ tự Nam/Nữ.
SELECT sv.MaSV,concat(sv.Hosv, ' ', sv.TenSV) as 'Ho va Ten',sv.Phai,sv.NgaySinh
FROM dmsv sv 
order by sv.phai;
-- 3.Lấy thông tin: Họ tên sinh viên, Ngày sinh, Học bổng và sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần
SELECT sv.MaSV,concat(sv.Hosv, ' ', sv.TenSV) as 'Ho va Ten',sv.ngaysinh,sv.Hocbong
FROM dmsv sv 
ORDER BY ngaysinh asc, hocbong desc;
-- 4. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã môn, Tên môn, Số tiết.
SELECT *
FROM dmmh mh
WHERE mh.Tenmh LIKE 'T%';
-- 5. lấy Họ tên sinh viên, Ngày sinh, Phái sinh viên có chữ cái cuối cùng trong tên là I
SELECT sv.MaSV,concat(sv.Hosv, ' ', sv.TenSV) as 'Ho va Ten',sv.ngaysinh,sv.Phai
FROM dmsv sv 
WHERE sv.tensv LIKE '%I';
-- 6. lấy những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm các thông tin: Mã khoa, Tên khoa.
SELECT kh.MaKhoa, kh.TenKhoa
FROM dmkhoa kh
WHERE kh.TenKhoa LIKE '_N%';
-- 7. Liệt kê những sinh viên mà họ có chứa chữ Thị.
SELECT sv.MaSV,concat(sv.Hosv, ' ', sv.TenSV) as 'Ho va Ten'
FROM dmsv sv 
WHERE sv.HoSV LIKE '%Thị%';
-- 8. lấy Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng sinh viên có học bổng lớn hơn 100,000 và sắp xếp theo thứ tự Mã khoa giảm dần
SELECT sv.masv,concat(sv.Hosv, ' ', sv.TenSV) as 'Ho va Ten',kh.makhoa,sv.hocbong
FROM dmkhoa kh JOIN dmsv sv on kh.makhoa = sv.makhoa
where sv.hocbong >100000
order by kh.makhoa desc;
-- 9. lấy Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội 
SELECT sv.masv,concat(sv.Hosv, ' ', sv.TenSV) as 'Ho va Ten',kh.makhoa,sv.noisinh,sv.hocbong
FROM dmkhoa kh JOIN dmsv sv on kh.makhoa = sv.makhoa
WHERE sv.hocbong >150000 and sv.noisinh = 'Hà Nội';
-- 10. lấy Mã sinh viên, Mã khoa, Phái sinh viên của khoa Anh văn và khoa Vật lý
SELECT sv.masv,kh.makhoa,sv.phai
FROM dmkhoa kh JOIN dmsv sv on kh.makhoa = sv.makhoa 
WHERE kh.tenkhoa = 'Anh Văn' and 'Vật Lý';
-- 11. Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày 05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học bổng.
SELECT sv.MaSV,concat(sv.Hosv, ' ', sv.TenSV) as 'Ho va Ten',sv.ngaysinh,sv.NoiSinh,sv.HocBong
FROM dmsv sv 
WHERE sv.ngaysinh>= '1991/01/01' and sv.ngaysinh <= '1992/01/01';
-- 12. Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa
SELECT sv.MaSV,sv.ngaysinh,sv.Phai,sv.HocBong,kh.makhoa
FROM dmkhoa kh JOIN dmsv sv on kh.makhoa = sv.makhoa 
WHERE sv.hocbong between 80000 and 150000;
-- 13. Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thôn tin: Mã môn học, Tên môn học, Số tiết.
SELECT *
FROM dmmh mh
WHERE mh.SoTiet >30 and mh.Sotiet <45;
-- 14. Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
SELECT sv.MaSV,concat(sv.Hosv , ' ' , sv.tensv) as 'họ và tên',kh.makhoa,sv.Phai
FROM dmkhoa kh JOIN dmsv sv on kh.makhoa = sv.makhoa 
WHERE sv.phai = 'Nam' and kh.tenkhoa = 'Anh Văn' and kh.tenkhoa = 'Tin Học';
-- 15. Liệt kê những sinh viên nữ, tên có chứa chữ N
SELECT sv.MaSV,concat(sv.Hosv , ' ' , sv.tensv) as 'họ và tên',sv.Phai
FROM dmsv sv
WHERE sv.tensv LIKE '%N%';
-- 16. Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
SELECT sv.MaSV,concat(sv.Hosv, ' ', sv.TenSV) as 'Ho va Ten',sv.NgaySinh,sv.NoiSinh
FROM dmsv sv
WHERE sv.noisinh ='Hà Nội';
-- 17. Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi,Học bổng.
select concat(sv.Hosv, ' ', sv.TenSV) as 'Ho va Ten',(year(now())-year(sv.ngaysinh)) as 'Tuoi' ,sv.HocBong
from dmsv sv
Where year((now())-year(sv.ngaysinh)) > 20
group by year(now())-year(sv.ngaysinh);
-- 18. Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên, Tuổi, Tên khoa.
select concat(sv.Hosv, ' ', sv.TenSV) as 'Ho va Ten',(year(now())-year(sv.ngaysinh)) as 'Tuoi' ,kh.tenkhoa
from dmsv sv join dmkhoa kh on sv.makhoa = kh.makhoa
Where year((now())-year(sv.ngaysinh)) >20 and year((now())-year(sv.ngaysinh))<25
group by year(now())-year(sv.ngaysinh);
-- 19. Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ tên sinh viên,Phái, Ngày sinh.
select concat(sv.Hosv, ' ', sv.TenSV) as 'Ho va Ten',sv.phai,sv.ngaysinh
from dmsv sv
where sv.ngaysinh > '1990-01-01' and sv.ngaysinh < '1990-03-01' ;
-- 20. Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học
-- bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển thị là “Mức trung bình”
select sv.masv, sv.phai,sv.makhoa,
case 
	when sv.hocbong > 500000 then 'hoc bong cao' 
    else 'hoc bong trung binh'
end as hocbong
from dmsv sv;
-- 21. Cho biết tổng số sinh viên của toàn trường
select count(sv.masv) as 'tổng số sinh viên của toàn trường'
from dmsv sv;
-- 22. Cho biết tổng sinh viên và tổng sinh viên nữ.
select count(sv.masv) as 'tổng sinh viên' , sum(case sv.phai when 'Nữ' then 1 else 0 end) as 'Tổng sv nữ'
from dmsv sv;
-- 23. Cho biết tổng số sinh viên của từng khoa.
select
	sum(case sv.makhoa when 'TH' then 1 end) as 'khoa TH',
	sum(case sv.makhoa when 'VL' then 1 end) as 'khoa VL',
    sum(case sv.makhoa when 'AV' then 1 end)as 'khoa AV',
    sum(case sv.makhoa when 'TR' then 1 end)as 'khoa TR'
from dmsv sv ;
select*from dmmh;
-- 24. Cho biết số lượng sinh viên học từng môn.
select kq.mamh,mh.tenmh, count(kq.masv) as 'tổng sinh viên'
from (select k.mamh, k.masv from ketqua k group by k.mamh, k.masv) kq join dmmh mh on kq.mamh = mh.mamh 
group by kq.mamh;
-- 25. Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có trong bảng kq)
select distinct kq.mamh , mh.tenmh
from ketqua kq join dmmh mh on kq.mamh = mh.mamh
group by kq.mamh;
-- 26. Cho biết tổng số học bổng của mỗi khoa
select kh.tenkhoa, count(sv.hocbong) as 'tổng số học  bổng' 
from dmkhoa kh join dmsv sv on kh.makhoa = sv.makhoa
join ketqua kq on sv.masv = kq.masv
join dmmh mh on mh.mamh = kq.mamh
where  not sv.hocbong = 0
group by kh.makhoa;
-- 27. Cho biết học bổng cao nhất của mỗi khoa.
select kh.tenkhoa, max(sv.hocbong)
from dmkhoa kh join dmsv sv on kh.makhoa = sv.makhoa
group by kh.makhoa;
-- 28.Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
select sum(case s.phai when 'Nam' then 1 else 0 end) as 'Tổng SV Nam',
 sum(case s.phai when 'Nữ' then 1 else 0 end) as 'Tổng SV Nữ',k.TenKhoa
from dmsv s join dmKhoa k on s.MaKhoa = k.MaKhoa
group by s.Makhoa;
-- 29.Cho biết số lượng sinh viên theo từng độ tuổi
select (year(now())-year(sv.ngaysinh)) as 'Tuoi' , count(sv.MaSV)
from dmsv sv
group by year(now())-year(sv.ngaysinh);
-- 30.Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường
select count(distinct( sv.ngaysinh)) 
from dmkhoa kh join dmsv sv on kh.makhoa = sv.makhoa
group by sv.masv
order by year(sv.ngaysinh)
;
-- 31. Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường
-- 34. Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
SELECT sv.MaSV, concat(sv.HoSV,' ',sv.tenSV) as 'Ho Va Ten ', avg(Diem), sv.Phai
FROM dmsv sv join ketqua k on sv.MaSV = k.MaSV
WHERE k.LanThi = 1 and sv.Phai = 'Nam'
group by sv.MaSV
HAVING avg(Diem)>7;
-- 40.Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất. 
SELECT sv.MaSV, concat(sv.Hosv, ' ', sv.TenSV) as 'Ho va Ten', kq.diem
FROM dmsv sv join ketqua kq on sv.MaSV = kq.MaSV
where kq.Diem = (SELECT distinct max(k.Diem)
FROM ketqua k join dmmh m on k.mamh = m.mamh
WHERE TenMH = 'Cơ Sở Dữ Liệu' and k.LanThi = 1) and kq.LanThi =1;
-- 42. Cho biết khoa nào có đông sinh viên nhất
select k1.makhoa, k1.TenKhoa,count(sv1.Masv)as 'So luong sv'
from dmkhoa k1 join dmsv sv1 on k1.makhoa = sv1.makhoa
group by k1.tenkhoa
having count(sv1.MaSV)>=all(select count(sv.MaSV)
from dmkhoa k join dmsv sv on k.makhoa = sv.makhoa
group by k.tenkhoa);
-- 62. Cho biết những sinh viên học những môn bằng đúng những môn mà sinh viên A02 học.
SELECT TenSV
FROM KetQua kq join dmsv sv on kq.masv = sv.masv join 
	(Select MaSV,MaMH,count(distinct MaMH) as 'SoMon' 
     From KetQua 
     Where MaSV='A02' 
     Group By MaSV,MaMH) a on kq.mamh = a.mamh
WHERE kq.MaSV <>a .MaSV
GROUP BY TenSV
HAVING count(distinct kq.MaMH)=(Select count(distinct MaMH) 
								From KetQua Where MaSV='A02');




-- --INDEX--------
-- đánh chỉ mục (đánh chỉ mục cho các cột để tăng tốc độ truy vấn nhưng sẽ mất nhiều dữ liệu hơn )
-- đánh khi chỉ mục đấy chỉ liên quan đến truy vấn nhưng k thao tác nhiều đến dữ liệu(thêm,sửa,xóa)
create unique index index_demo on dmkhoa(tenkhoa);


-- -------View--------
-- tạo ra để lưu trữ dữ liệu phục vụ mục đích báo cáo 
-- bản chất giống các bảng cơ sở để lưu trữ dữ liệu trên các bảng cơ sở 
-- Warning: khi thay đổi dữ liệu trên view thì dữ liệu trên bảng cơ sở cx thay đổi theo
-- không được thao tác dữ liệu trên view . view chỉ để truy vấn ra thôi
create view vw_SinhVien_Ketqua as
select sv.masv, sv.hosv,sv.tensv,sv.ngaysinh,kq.diem,kq.lanthi 
from dmsv sv join ketqua kq on sv.masv = kq.masv ;
select*from vw_SinhVien_Ketqua;
drop view vw_SinhVien_Ketqua;



-- -----PROCEDURE -----
-- tạo 1 procedure để insert 
-- CRUD -CREATE -READ - UPDATE- DELETE
call sp_insert_dmkhoa('TE','test',@out_returncode);
select @out_returncode;
select * from dmkhoa;
call sp_update_dmkhoa('TE','test123');
call sp_delete_dmkhoa('TE');
call sp_getallkhoa(); -- ? --

-- tạo procedure cho phép lấy số sinh viên và danh sách sinh viên 
DELIMITER //
CREATE PROCEDURE prog_get_sv(out cnt int )
BEGIN
	select count(sv.MaSV)into cnt FROM dmsv sv;
    SELECT * FROM dmsv;
END;//
drop procedure prog_get_sv;
call prog_get_sv(@OUT_cnt);
select @out_cnt;
-- 1.tạo procedure cho phép lấy tất cả thông tin các khoa
DELIMITER //
CREATE PROCEDURE pro_get_all_khoa()
BEGIN 
	SELECT * FROM dmkhoa;
END; //
drop procedure pro_get_all_khoa();
call pro_get_all_khoa();

-- 2.tạo procedure thêm mới 1 khoa
DELIMITER //
CREATE PROCEDURE pro_insert_khoa(IN makhoa_in char(2), in tenkhoa_in varchar(30))
BEGIN 
	INSERT INTO dmkhoa VALUES(makhoa_in, tenkhoa_in);
END; //

call pro_insert_khoa('RA','Rikkei Academy');

-- 3.viết produce cập nhập dữ liệu 1 khoa 
DELIMITER //
CREATE PROCEDURE pro_update_khoa(IN makhoa_in char(2), in tenkhoa_in varchar(30))
BEGIN
	-- khai bảo 1 biến để xem mã khoa đã tồn tại hay chưa
	declare cnt int default 0;
    SELECT count(k.makhoa) into cnt from dmkhoa k where k.Makhoa = makhoa_in;
    IF cnt  > 0 then
		update  dmkhoa
        set Tenkhoa = tenkhoa_in
        where Makhoa = makhoa_in;
	END IF;
END; //

-- tạo procedure cho phép thêm mới vào khoa và trả ra số lượng khoa hiện tạimport table from
DELIMITER //
CREATE PROCEDURE pro_insert_count_khoa(IN makhoa_in char(2), in tenkhoa_in varchar(30),OUT cnt int)
BEGIN
	INSERT INTO dmkhoa VALUES(makhoa_in, tenkhoa_in);
    SELECT Count(k.makhoa) INTO cnt from dmkhoa k;
END; //
call pro_insert_count_khoa('R1','RikkeiSoft1',@OUT_cnt);
select @OUT_cnt;

-- 4 Tạo procedure cho phép xóa 1 khoa

create procedure removeKhoa(
	in makhoa_in char(2)
)
begin
	declare cnt int default 0;
    select count(makhoa) into cnt from dmkhoa where makhoa = makhoa_in;
    if cnt > 0 then
	delete from dmkhoa where makhoa = makhoa_in;
	end if;
end //

-- 5 In danh sách các sinh viên theo khoa

create procedure inSvTheoKhoa()
begin
	select tenkhoa, concat(hosv,' ',tensv) as hoten from dmkhoa k join dmsv sv on sv.MaKhoa = k.MaKhoa;
end //

-- 6. Nhập vào 2 mã sinh viên và 1 mã môn học, trả ra thông tin sinh viên có điểm cao nhất trong lần thi 1

create procedure getMaxScore(
	in masv1_in char(3),
    in masv2_in char(3),
    in mamh_in char(2)
)
begin
	declare diem1,diem2 int default 0;
    select diem into diem1 from ketqua where lanthi = 1 and mamh = mamh_in and masv = masv1_in;
    select diem into diem2 from ketqua where lanthi = 1 and mamh = mamh_in and masv = masv2_in;
    if diem1 > diem2 
    then 
		select * from dmsv where masv = masv1_in;
	else 
		select * from dmsv where masv = masv2_in;
	end if;
end //

-- 7 Nhập vào 1 môn học và 1 mã sinh viên, kiểm tra xem sinh viên có đậu môn này hay không trong lần thi đầu tiên. 
-- Nếu đậu thì trả ra “PASS”, không đậu trả ra “FAIL”, Chưa có điểm trả ra “NOT MARK”
create procedure checkPass(
	in tenmh_in varchar(25),
    in masv_in char(3)
)
begin
	select
    (case
		when diem >= 5 then 'pass'
        when diem < 5 then 'fail'
        when diem is null then 'not mark'
    end) as `ket qua kiem tra`
    from dmsv sv 
    left join ketqua k on sv.masv = k.masv 
    left join dmmh mh on k.mamh = mh.mamh
    where mh.tenmh = tenmh_in and sv.masv = masv_in;
end //

-- 8 Nhập vào mã sinh viên và môn học, trả ra các điểm thi của sinh viên môn học đó

create procedure getScore(
	in tenmh_in varchar(25),
    in masv_in char(3)
)
begin
	select diem 
    from ketqua k join dmmh mh on k.MaMH = mh.MaMH
    where masv = masv_in and tenmh = tenmh_in;
end //

-- 9  Nhập vào mã sinh viên, in ra các môn học sinh viên đã học

create procedure getMonHoc(
	in masv_in char(3)
)
begin
	select distinct tenmh 
    from ketqua kq 
    join dmmh mh on kq.mamh = mh.mamh 
    where masv = masv_in;
end //

-- 10 Nhập vào mã môn học, in ra các sinh viên đã học môn đó

create procedure getSinhVien(
	in mamh_in char(2)
)
begin
	select * from dmsv join (select distinct masv from ketqua where mamh = mamh_in) t on dmsv.masv = t.masv;
end //
delimiter ;

-- -----TRIGGER-----
-- được kích hoạt nếu như có sự kiện sảy ra trên bảng
-- event thay đổi dữ liệu: delete,update,insert
delimiter $$
create trigger trigger_dmkhoa before insert 
on dmkhoa for each row 
begin
end$$

DELIMITER //
CREATE TRIGGER before_insert_dmsv
BEFORE INSERT ON dmsv FOR EACH ROW 
BEGIN 
	declare makhoa char(2) ;
    declare cnt int default 0;
    set makhoa = new.makhoa;
    select count(k.makhoa) into cnt 
    from dmkhoa k 
    where k.makhoa = makhoa;
    if cnt = 0 then 
		insert into dmkhoa 
        values (makhoa,'not exits');
   end if;
END; //
select * from dmkhoa;
select * from dmsv;
insert into dmsv
values ('R02','Nguyen','Van Ba','Nam','1996-06-20','Vinh Phúc','R2',0);

