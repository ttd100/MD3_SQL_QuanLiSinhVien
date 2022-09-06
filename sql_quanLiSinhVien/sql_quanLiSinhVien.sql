SELECT * FROM quanlysinhvien.classes;
use QuanLySinhVien;
create table mark(
mark int not null,
SubjectID int not null,
StudentID int not null,
foreign key(SubjectID) references subjects(SubjectID),
foreign key(StudentID) references students(StudentID)
);
create table ClassStudent(
StudentID int not null,
ClassID int not null,
foreign key(StudentID) references students(StudentID),
foreign key(ClassID) references classes(ClassID)
);
insert into students(StudentName,Age,Email) values('Nguyen Quang An','18','an@yahoo.com');
insert into students(StudentName,Age,Email) values('Nguyen Cong Vinh','20','Vinh@yahoo.com');
insert into students(StudentName,Age,Email) values('Nguyen Van Quyen','19','quyen');
insert into students(StudentName,Age,Email) values('Pham Thanh Binh','25','binh@com');
insert into students(StudentName,Age,Email) values('Nguyen Van Tai Em','30','taiem@spost.vn');
insert into classes(ClassName) values('C0706L');
insert into classes(ClassName) values('C0708G');
insert into ClassStudent(studentID,ClassID) values
(1,1),
(2,1),
(3,2),
(4,2),
(5,2)
;
insert into subjects(SubjectName)values
('SQL'),
('Java'),
('C'),
('Visual Basic')
;
insert into mark(Mark,SubjectID,StudentID) values
(8,1,1),
(4,2,1),
(9,1,1),
(7,1,3),
(3,1,4),
(5,2,5),
(8,3,3),
(1,3,5),
(3,2,4)
;
select * from Students;
select * from subjects;
-- 3
select studentid, avg(Mark)from mark;
select *
 -- mark.studentid, count(mark), sum(mark)
from mark  join students on  mark.studentid = students.studentid
join subjects on mark.subjectID = subjects.subjectID
-- group by studentid
;
-- 3
select studentname, avg(mark)
from mark join students on mark.studentid = students.studentid
group by mark.studentid;
-- 4 
select *
 from mark 
 join subjects 
 on mark.subjectid = subjects.subjectid
 where mark = (select max(mark) from mark)
 ;
 -- 5
 select mark, row_number() over w as 'row_number'
 from mark
 window w as ( order by mark desc);
 -- 5
 select * from mark
 order by mark desc;
 
 -- 6 
 alter table subjects modify subjectName nvarchar(21842);
 
 -- 7 

 update subjects set subjectName = concat('Day la mon hoc',subjectName);
 
 -- 8
alter table students add constraint age_check check (Age > 15 and Age < 50);
 
 -- 9 
 SELECT concat('ALTER TABLE ', TABLE_NAME, ' DROP FOREIGN KEY ', CONSTRAINT_NAME, ';') 
FROM information_schema.key_column_usage 
WHERE CONSTRAINT_SCHEMA = 'test2' 
AND referenced_table_name IS NOT NULL;

ALTER TABLE classstudent DROP FOREIGN KEY classstudent_ibfk_2;
ALTER TABLE classstudent DROP FOREIGN KEY classstudent_ibfk_1;
ALTER TABLE mark DROP FOREIGN KEY mark_ibfk_1;
ALTER TABLE mark DROP FOREIGN KEY mark_ibfk_2;

-
 -- 10 
 delete from students where studentid = 1;
 -- 11
 alter table students add `status` bit default 1;
 -- 12
 update students set `status` = 0 ;
