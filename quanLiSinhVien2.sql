
-- 2
-- a.	Thêm ràng buộc dữ liệu cho cột age với giá trị thuộc khoảng: 15-55
alter table student add constraint age_check1 check (age >15 and age <55);
insert into student ( name, age) values ('star dat',14); -- test
-- b.	Thêm giá trị mặc định cho cột mark trong bảng StudentTest là 0
alter table studenttest alter mark set default '0'; 
-- c.	Thêm khóa chính cho bảng studenttest là (RN,TestID)
alter table studenttest add constraint pk_studenttest primary key (RN,testID);
-- d.	Thêm ràng buộc duy nhất (unique) cho cột name trên bảng Test
alter table test add constraint uc_test unique (name );
-- e.	Xóa ràng buộc duy nhất (unique) trên bảng Test
alter table test drop index uc_test;
-- 3.	Hiển thị danh sách các học viên đã tham gia thi,
-- các môn thi được thi bởi các học viên đó,
--  điểm thi và ngày thi giống như hình sau:
select s.rn,s.name,t.name, mark, date from studenttest st
join student s on s.RN = st.RN
join test t on t.testID = st.testID;
-- 4.	Hiển thị danh sách các bạn học viên chưa thi môn nào
select rn,name,age from student 
where not rn in (select rn from studenttest);
-- 5.	Hiển thị danh sách học viên phải thi lại,
-- tên môn học phải thi lại và điểm thi(điểm phải thi lại là điểm nhỏ hơn 5)
select s.rn,s.name,t.name, mark, date from studenttest st
join student s on s.RN = st.RN
join test t on t.testID = st.testID
where Mark <5;
-- 6.	Hiển thị danh sách học viên và điểm trung bình(Average) của các môn đã thi.
-- Danh sách phải sắp xếp theo thứ tự điểm trung bình giảm dần
-- (nếu không sắp xếp thì chỉ được ½ số điểm)

select s.rn,s.name,avg(mark) as Average from studenttest st
join student s on s.RN = st.RN
join test t on t.testID = st.testID
group by s.rn
order by avg(mark) desc;
-- 7.	Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất.
select s.rn,s.name,avg(mark) as Average  from studenttest st
join student s on s.RN = st.RN
join test t on t.testID = st.testID
group by s.rn
having max (avg(mark))



