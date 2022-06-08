--/* I. CREATE TABLES */
--
---- faculty (Khoa trong trường)
--create table faculty (
--	id number primary key,
--	name nvarchar2(30) not null
--);
--
---- subject (Môn học)
--create table subject(
--	id number primary key,
--	name nvarchar2(100) not null,
--	lesson_quantity number(2,0) not null -- tổng số tiết học
--);
--
---- student (Sinh viên)
--create table student (
--	id number primary key,
--	name nvarchar2(30) not null,
--	gender nvarchar2(10) not null, -- giới tính
--	birthday date not null,
--	hometown nvarchar2(100) not null, -- quê quán
--	scholarship number, -- học bổng
--	faculty_id number not null constraint faculty_id references faculty(id) -- mã khoa
--);
--
---- exam management (Bảng điểm)
--create table exam_management(
--	id number primary key,
--	student_id number not null constraint student_id references student(id),
--	subject_id number not null constraint subject_id references subject(id),
--	number_of_exam_taking number not null, -- số lần thi (thi trên 1 lần được gọi là thi lại) 
--	mark number(4,2) not null -- điểm
--);
--
--
--
--/*================================================*/
--
--/* II. INSERT SAMPLE DATA */
--
---- subject
--insert into subject (id, name, lesson_quantity) values (1, n'Cơ sở dữ liệu', 45);
--insert into subject values (2, n'Trí tuệ nhân tạo', 45);
--insert into subject values (3, n'Truyền tin', 45);
--insert into subject values (4, n'Đồ họa', 60);
--insert into subject values (5, n'Văn phạm', 45);
--
--
---- faculty
--insert into faculty values (1, n'Anh - Văn');
--insert into faculty values (2, n'Tin học');
--insert into faculty values (3, n'Triết học');
--insert into faculty values (4, n'Vật lý');
--
--
---- student
--insert into student values (1, n'Nguyễn Thị Hải', n'Nữ', to_date('19900223', 'YYYYMMDD'), 'Hà Nội', 130000, 2);
--insert into student values (2, n'Trần Văn Chính', n'Nam', to_date('19921224', 'YYYYMMDD'), 'Bình Định', 150000, 4);
--insert into student values (3, n'Lê Thu Yến', n'Nữ', to_date('19900221', 'YYYYMMDD'), 'TP HCM', 150000, 2);
--insert into student values (4, n'Lê Hải Yến', n'Nữ', to_date('19900221', 'YYYYMMDD'), 'TP HCM', 170000, 2);
--insert into student values (5, n'Trần Anh Tuấn', n'Nam', to_date('19901220', 'YYYYMMDD'), 'Hà Nội', 180000, 1);
--insert into student values (6, n'Trần Thanh Mai', n'Nữ', to_date('19910812', 'YYYYMMDD'), 'Hải Phòng', null, 3);
--insert into student values (7, n'Trần Thị Thu Thủy', n'Nữ', to_date('19910102', 'YYYYMMDD'), 'Hải Phòng', 10000, 1);
--
--
---- exam_management
--insert into exam_management values (1, 1, 1, 1, 3);
--insert into exam_management values (2, 1, 1, 2, 6);
--insert into exam_management values (3, 1, 2, 2, 6);
--insert into exam_management values (4, 1, 3, 1, 5);
--insert into exam_management values (5, 2, 1, 1, 4.5);
--insert into exam_management values (6, 2, 1, 2, 7);
--insert into exam_management values (7, 2, 3, 1, 10);
--insert into exam_management values (8, 2, 5, 1, 9);
--insert into exam_management values (9, 3, 1, 1, 2);
--insert into exam_management values (10, 3, 1, 2, 5);
--insert into exam_management values (11, 3, 3, 1, 2.5);
--insert into exam_management values (12, 3, 3, 2, 4);
--insert into exam_management values (13, 4, 5, 2, 10);
--insert into exam_management values (14, 5, 1, 1, 7);
--insert into exam_management values (15, 5, 3, 1, 2.5);
--insert into exam_management values (16, 5, 3, 2, 5);
--insert into exam_management values (17, 6, 2, 1, 6);
--insert into exam_management values (18, 6, 4, 1, 10);
--
--
--
--/*select * from student;
--select * from exam_management;*/
--
--/*================================================*/
--
--/* III. QUERY */
--
--
-- /********* A. BASIC QUERY *********/
--;
---- 1. Liệt kê danh sách sinh viên sắp xếp theo thứ tự:
----      a. id tăng dần
----      b. giới tính
----      c. ngày sinh TĂNG DẦN và học bổng GIẢM DẦN;

--ORDER BY được sử dụng để sắp xếp dữ liệu theo thứ tự tăng dần hoặc theo thứ tự giảm dần trên một hoặc nhiều cột.
select
    id
from
    student
order by
    id asc;

select
    scholarship, birthday
from
    student
order by
    birthday desc;

select
    scholarship, birthday
from
    student
order by
    scholarship asc;

---- 2. Môn học có tên bắt đầu bằng chữ 'T'

select
    name
from
    subject
where
    name like 'T%';
--
-- 3. Sinh viên có chữ cái cuối cùng trong tên là 'i'

select
    name
from
    student
where
    name like '%i';
--
--
---- 4. Những khoa có ký tự thứ hai của tên khoa có chứa chữ 'n'

select
    name
from
    faculty
where
    name like '_n%';

-- 5. Sinh viên trong tên có từ 'Thị'

select
    name
from
    student
where
    name like '%Thị%';
--
---- 6. Sinh viên có ký tự đầu tiên của tên nằm trong khoảng từ 'a' đến 'm', sắp xếp theo họ tên sinh viên
select
    name
from
    student
where
    name between 'A%' and 'M%'
order by
    name;

-- 7. Sinh viên có học bổng lớn hơn 100000, sắp xếp theo mã khoa giảm dần

select
    name, scholarship, faculty_id
from
    student
where
    scholarship > 100000
order by
    faculty_id desc;

-- 8. Sinh viên có học bổng từ 150000 trở lên và sinh ở Hà Nội
select
    name, scholarship, hometown
from
    student
where
        scholarship > 150000
    and hometown = 'Hà Nội';

-- 9. Những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày 05/06/1992
select
    *
from
    student
where
        birthday >= to_date('19910101', 'YYYYMMDD')
    and birthday <= to_date('19920605', 'YYYYMMDD');

-- 10. Những sinh viên có học bổng từ 80000 đến 150000
select
    *
from
    student
where
        scholarship >= 80000
    and scholarship <= 150000;

---- 11. Những môn học có số tiết lớn hơn 30 và nhỏ hơn 45
select
    *
from
    subject
where
        lesson_quantity >= 30
    and lesson_quantity <= 45;
--
---------------------------------------------------------------------
--
--/********* B. CALCULATION QUERY *********/
--
---- 1. Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Giới tính, Mã 
--		-- khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị 
--		-- của học bổng lớn hơn 500,000 và ngược lại hiển thị là “Mức trung bình”.

select
    student.name, student.gender, student.faculty_id, case
                                                          when student.scholarship > 50000 then 'Học bổng cao'
                                                          else 'Học bổng trung bình'
                                                      end
from
    student;

-- 2. Tính tổng số sinh viên của toàn trường
select
    count(id) totalstudent
from
    student;

-- 3. Tính tổng số sinh viên nam và tổng số sinh viên nữ.
select
    gender, count(gender)
from
    student
group by
    gender;

---- 4. Tính tổng số sinh viên từng khoa

select
    student.faculty_id, faculty.name, count(student.id)
from
         student
    inner join faculty on student.faculty_id = faculty.id
group by
    student.faculty_id, faculty.name;


-- 5. Tính tổng số sinh viên của từng môn học

select
    e.subject_id, sj.name, count(e.student_id)
from
    (
             exam_management e
        join subject  sj on e.subject_id = sj.id
    )
    join student  s on e.student_id = s.id
group by
    e.subject_id, sj.name;


-- 6. Tính số lượng môn học mà sinh viên đã học
-- DISTINCT được sử dụng kết hợp với câu lệnh SELECT để loại bỏ tất cả các bản ghi trùng lặp và chỉ lấy các bản ghi duy nhất trong bảng.
select
    e.student_id, count(distinct subject_id)
from
    exam_management e
group by
    e.student_id
order by
    e.student_id asc;


-- 7. Tổng số học bổng của mỗi khoa	

select
    faculty_id, sum(scholarship)
from
    student
group by
    faculty_id;

-- 8. Cho biết học bổng cao nhất của mỗi khoa
--Trong Oracle, NVL hàm cho phép bạn thay thế một NULL giá trị bằng một giá trị khác. Nó hữu ích khi bạn muốn lưu trữ thực tế là không có dữ liệ
select
    faculty_id, f.name, max(nvl(scholarship, 0))
from
         student s
    join faculty f on s.faculty_id = f.id
group by
    faculty_id, f.name;

-- 9. Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa 
select
    faculty_id, count(
        case
            when gender = 'Nam' then 1
            else 0
        end
    )  totalnam, count(
        case
            when gender = 'Nữ' then 1
            else 0
        end
    )  totalnu
from
    student, faculty
where
    student.faculty_id = faculty.id
group by
    faculty_id;

--10. Cho biết số lượng sinh viên theo từng độ tuổi
select
    to_number(to_char(sysdate, 'YYYY')) - to_number(to_char(birthday, 'YYYY'))                age, count(student.id)                                                                         student_number
from
    student
group by
    to_number(to_char(sysdate, 'YYYY')) - to_number(to_char(birthday, 'YYYY'));


-- 11. Cho biết những nơi nào có ít nhất 2 sinh viên đang theo học tại trường 
select
    hometown, count(id)
from
    student
group by
    hometown
having
    count(hometown) >= 2;

---- 12. Cho biết những sinh viên thi lại ít nhất 2 lần
select
    e.student_id, e.subject_id, count(distinct e.number_of_exam_taking)
from
         exam_management e
    join student s on e.student_id = s.id
group by
    e.student_id, e.subject_id
having
    count(e.number_of_exam_taking) >= 2;

---- 13. Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0 
 --Hàm AVG trong Microsoft SQL Server: trả về giá trị trung bình, dùng cho dữ liệu kiểu số, không tính giá trị NULL
 select
    e.student_id, avg(mark) avg_mark
from
         student s
    join exam_management e on s.id = e.student_id
where
        s.gender = 'Nam'
    and e.number_of_exam_taking >= 1
group by
    e.student_id
having
    avg(mark) > 7;

-- 14. Cho biết danh sách các sinh viên rớt ít nhất 2 môn ở lần thi 1 (rớt môn là điểm thi của môn không quá 4 điểm) 
 --hỏi
 select
    e.student_id, count(e.subject_id)
from
         student s
    join exam_management e on s.id = e.student_id
where
        e.number_of_exam_taking = 1
    and e.mark < 4
group by
    e.student_id
having
    count(student_id) >= 2;
 
---- 15. Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
select
    s.faculty_id, count(distinct s.id)
from
    student s
where
    s.gender = 'Nam'
group by
    s.faculty_id
having
    count(distinct s.id) > 2;

-- 16. Cho biết những khoa có 2 sinh viên đạt học bổng từ 200000 đến 300000 
 select
    s.faculty_id, count(s.faculty_id)
from
         student s
    join faculty f on s.faculty_id = f.id
where
    scholarship between 100000 and 150000
group by
    s.faculty_id
having
    count(s.faculty_id) = 2;

-- 17. Cho biết sinh viên nào có học bổng cao nhất
select
    *
from
    student s
where
    s.scholarship = (
        select
            max(s.scholarship)
        from
            student s
    );


-------------------------------------------------------------------

/********* C. DATE/TIME QUERY *********/

-- 1. Sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02
select
    name, hometown, birthday
from
    student
where
        to_char(birthday, 'MM') = '02'
    and hometown = 'Hà Nội';

---- 2. Sinh viên có tuổi lớn hơn 20
select
    s.name, to_number(to_char(sysdate, 'YYYY')) - to_number(to_char(s.birthday, 'YYYY')) age
from
    student s
where
    to_number(to_char(sysdate, 'YYYY')) - to_number(to_char(s.birthday, 'YYYY')) > 20;

---- 3. Sinh viên sinh vào mùa xuân năm 1990
select
    *
from
    student s
where
    to_char(s.birthday, 'MM') in ( '01', '02', '03' )
    and to_char(s.birthday, 'YYYY') = '1990';



-------------------------------------------------------------------


/********* D. JOIN QUERY *********/

---- 1. Danh sách các sinh viên của khoa ANH VĂN và khoa VẬT LÝ
select
    s.name, f.name
from
         student s
    join faculty f on s.faculty_id = f.id
where
    f.name = 'Anh - Văn'
    or f.name = 'Vật lý';

---- 2. Những sinh viên nam của khoa ANH VĂN và khoa TIN HỌC
--
select
    s.name, f.name faculty_name, s.gender
from
         student s
    join faculty f on s.faculty_id = f.id
where
    ( f.name = 'Anh - Văn'
      or f.name = 'Tin học' )
    and s.gender = 'Nam';

---- 3. Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất
-- hỏi
select
    s.id, s.name, e.mark
from
    (
             student s
        join exam_management  e on s.id = e.student_id
    )
    join subject          sj on e.subject_id = sj.id
where
        e.number_of_exam_taking = 1
    and e.mark = (
        select
            max(e.mark)
        from
            exam_management e
    );

---- 4. Cho biết sinh viên khoa anh văn có tuổi lớn nhất.
select
    s.name, f.name, s.faculty_id, max(s.birthday)
from
         student s
    join faculty f on s.faculty_id = f.id
where
    f.name = 'Anh - Văn'
group by
    s.name, f.name, s.faculty_id, s.birthday
having
    max(s.birthday) >= (
        select
            max(s.birthday)
        from
                 student s
            join faculty f on s.faculty_id = f.id
        where
            f.name = 'Anh - Văn'
    );

-- 5. Cho biết khoa nào có đông sinh viên nhất
select
    faculty.name, count(student.id) student_number
from
    faculty, student
where
    faculty.id = student.faculty_id
group by
    faculty.name
having
    count(student.faculty_id) >= all (
        select
            count(student.id)
        from
            student
        group by
            student.faculty_id
    );

-- 6. Cho biết khoa nào có đông nữ nhất
select
    faculty.name, count(student.id) student_number
from
    faculty, student
where
        faculty.id = student.faculty_id
    and student.gender = 'Nữ'
group by
    faculty.name
having
    count(student.faculty_id) >= all (
        select
            count(student.id)
        from
            student
        where
            student.gender = 'Nữ'
        group by
            student.faculty_id
    );

-- 7. Cho biết những sinh viên đạt điểm cao nhất trong từng môn
select
    e.student_id, s.name, max(e.mark)
from
    (
             student s
        join exam_management  e on s.id = e.student_id
    )
    join subject          sj on e.subject_id = sj.id
group by
    e.student_id, s.name;

-- 8. Cho biết những khoa không có sinh viên học
select
    f.name, count(s.id)
from
    (
             student s
        join faculty f on s.faculty_id = f.id
    )
group by
    f.name
having
    count(s.id) = 0;

-- 9. Cho biết sinh viên chưa thi môn cơ sở dữ liệu
select
    e.student_id, s.name, sum(
        case
            when sj.name = 'Cơ sở dữ liệu' then 1
            else 0
        end
    )
from
    (
             student s
        join exam_management  e on s.id = e.student_id
    )
    join subject          sj on e.subject_id = sj.id
group by
    e.student_id, s.name
having
    sum(
        case
            when sj.name = 'Cơ sở dữ liệu' then 1
            else 0
        end
    ) = 0;

-- 10. Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2
--Toán tử EXISTS được sử dụng để kiểm tra sự tồn tại của bất kỳ bản ghi nào trong một truy vấn con.Toán tử EXISTS trả về giá trị TRUE nếu truy vấn con trả về một hoặc nhiều bản ghi.
--hỏi
select
    e.student_id, s.name, e.number_of_exam_taking
from
    (
             student s
        join exam_management e on s.id = e.student_id
    )
where
        e.number_of_exam_taking = 2
    and e.student_id not in (
        select
            e.student_id
        from
            (
                     student s
                join exam_management e on s.id = e.student_id
            )
        where
            e.number_of_exam_taking = 1
    );