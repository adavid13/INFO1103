DROP TABLE Student;
COMMIT;
drop procedure AcceptStudent;
commit;

CREATE TABLE Student
(Student_ID INT,
Student_Name VARCHAR2(50) NOT NULL,
Gender Char(1),
student_scholarship number,
CONSTRAINT Student_PK1 Primary Key (Student_ID),
CONSTRAINT Student_Gender CHECK(Gender IN('M','F'))
);
COMMIT;

create procedure AcceptStudent(
stu_number int,
stu_name varchar2,
stu_gender char,
highschool_avg number)

is
t_scholarship int;
begin
t_scholarship:=0;

if highschool_avg > 90 and highschool_avg < 101 then
t_scholarship:= 1500;


elsif highschool_avg > 85 and highschool_avg < 90 then
t_scholarship:= 1000;

elsif highschool_avg < 85 then
t_scholarship:= 0;

else
raise_application_error(-20203, 'Invalid highschool_avg');
end if;

insert into Student(Student_ID,Student_Name,Gender,student_scholarship)values(stu_number,stu_name,stu_gender,t_scholarship);

if(sql%rowcount=0) then
raise_application_error(-20204, 'Error updating student');
end if;

end;

