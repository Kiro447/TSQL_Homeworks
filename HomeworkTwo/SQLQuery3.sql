USE SEDC_ACADEMY_HOMEWORK

--Find all Students with FirstName = Antonio
SELECT *
FROM Student
WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT *
FROM Student
WHERE DateOfBirth > '01.01.1999'

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT *
FROM Student
WHERE  LastName like 'G%' AND MONTH(EnrolledDate) = 1 AND YEAR(EnrolledDate) = 1998 --EnrolledDate like '%01-1998';  -- so J ne iskaca niedna ja staviv so G edna samo iskaca

-- List all Students ordered by FirstName
Select * 
FROM Student
ORDER BY FirstName 

-- List all Teacher Last Names and Student Last Names in single result set.Remove duplicates
SELECT [FirstName]
FROM Teacher
UNION 
SELECT [FirstName]
FROM Student
ORDER BY FirstName

--List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT Course.Name, AchievementType.Name
FROM Course, AchievementType;


--List all Teachers without exam Grade
SELECT *
FROM dbo.Teacher as tc
LEFT JOIN dbo.Grade as gr ON tc.ID = gr.TeacherID
WHERE gr.Grade is null
ORDER BY FirstName

