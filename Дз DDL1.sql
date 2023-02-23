CREATE TABLE Teacher
(
TeacherID int,
FirstName varchar(128),
LastName varchar(128),
Birthday date,
Phone varchar(16),
Title varchar(32)
);

ALTER TABLE Teacher
ADD MiddleName varchar(128)

ALTER TABLE Teacher
DROP COLUMN MiddleName

EXEC sp_rename 'dbo.Teacher.Birthday','BirthDate','COLUMN';

ALTER TABLE Teacher ALTER COLUMN
Firstname varchar(32);

CREATE TABLE exam
(
ExamID int PRIMARY KEY IDENTITY(1,1), 
ExamName varchar(256), 
ExamDate date
);

INSERT INTO exam VALUES
('ex1','2019-08-22'),
('ex2','2020-08-22'),
('ex3','2021-08-22')

SELECT * FROM exam

Drop Table exam