SELECT * FROM quanlysinhvien2.class;
CREATE DATABASE QuanLySinhVien2;
USE QuanLySinhVien2;
CREATE TABLE Class
(
    ClassID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME    NOT NULL,
    Status    BIT
);
CREATE TABLE Student
(
    StudentId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
CREATE TABLE Subject
(
    SubId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);

CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);
insert into Mark values 
(1,3,3,5,3),
(2,2,2,7,2);
insert into class (ClassName, StartDate, Status) values
('jv12','2022-12-20',1)
;
insert into student(StudentName, Address,Phone,Status,ClassId) values
('Hung4','Nam Dinh','200456719',0,1);
insert into subject(SubName, Credit, Status) values
('SQL3',4,0);
insert into subject(SubName) values
('C');

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student
where studentname like 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class 
where month(startDate) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject
where credit between 3 and 5;
 -- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
 update student 
 set classId  = 2
 where studentName = 'Hung';
 -- Hiển thị các thông tin: StudentName, SubName, Mark.
 -- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
 select s.StudentName, sj.SubName, m.Mark
from student s join mark m on s.StudentId = m.StudentId 
join subject sj on sj.SubId = m.SubId 
order by Mark desc , StudentName desc;