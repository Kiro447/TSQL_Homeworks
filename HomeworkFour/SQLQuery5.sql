-- Calculate the count of all grades per Teacher in the system
SELECT t.FirstName, COUNT(g.Grade) as Total_Grades
FROM Teacher as t
LEFT JOIN Grade AS g ON t.ID = g.TeacherID
GROUP BY FirstName

-- Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT t.FirstName, COUNT(g.Grade) as Total_Grades
FROM Teacher as t
LEFT JOIN Grade AS g ON t.ID = g.TeacherID
WHERE g.StudentID < 100
GROUP BY FirstName

-- Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT Grade.StudentID, COUNT(Grade.Grade) as Count_Grades, MAX(Grade.Grade) as MAX_GRADE, AVG(Grade.Grade) as average_Grade
FROM Grade
GROUP BY Grade.StudentID

-- Calculate the count of all grades per Teacher in the system and filter only grade count greater then
-- 200
SELECT Grade.TeacherID, COUNT(Grade.Grade) as GradeCount
FROM Grade
GROUP BY Grade.TeacherId
HAVING COUNT(GRADE.GRADE) > 200

-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the
-- system. Filter only records where Maximal Grade is equal to Average Grade
SELECT s.FirstName,s.LastName, COUNT(Grade.Grade) as Count_Grades, MAX(Grade.Grade) as MAX_GRADE, AVG(Grade.Grade) as average_Grade
FROM Grade
LEFT JOIN Student as s ON Grade.StudentID = s.ID
GROUP BY s.FirstName, s.LastName
HAVING MAX(Grade.Grade) = AVG(Grade.Grade)

-- List Student First Name and Last Name next to the other details from previous query

-- Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vw_StudentGrades AS
SELECT StudentID,COUNT(Grade.Grade) AS Grade_Count
FROM Grade
GROUP BY StudentID;

SELECT *
FROM vw_StudentGrades 

-- Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vw_StudentGrades AS
SELECT s.FirstName, s.LastName, COUNT(Grade.Grade) AS Grade_Count
FROM Grade
LEFT JOIN Student as s ON Grade.StudentID = s.ID
GROUP BY s.FirstName, s.LastName


SELECT *
FROM vw_StudentGrades 

-- List all rows from view ordered by biggest Grade Count
SELECT * 
FROM vw_StudentGrades 
ORDER BY Grade_Count DESC;