--Declare scalar variable for storing FirstName values
-- Assign value Antonio to the FirstName variable
-- Find all Students having FirstName same as the variable

DECLARE @FirstName nvarchar(50)
SET @FirstName = 'Antonio'

Select *
FROM Student
WHERE Student.FirstName = @FirstName

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
-- Fill the table variable with all Female students

DECLARE @FemaleStudents TABLE (StudentName nvarchar(100),DateOfBirth date)
INSERT INTO @FemaleStudents
SELECT Student.FirstName , Student.DateOfBirth from Student

SELECT *
FROM @FemaleStudents

--Declare temp table that will contain LastName and EnrolledDate columns
-- Fill the temp table with all Male students having First Name starting with A
-- Retrieve the students from the table which last name is with 7 characters
CREATE TABLE #MaleStudents (LastName nvarchar(100), EnrolledDate date)
INSERT INTO #MaleStudents
SELECT Student.LastName, Student.EnrolledDate FROM Student
WHERE Student.Gender = 'M' AND Student.FirstName LIKE '%A' AND LEN(Student.LastName) = 7

SELECT *
FROM #MaleStudents

-- Find all teachers whose FirstName length is less than 5 and
-- the first 3 characters of their FirstName and LastName are the same

SELECT *
FROM Teacher
WHERE LEN(Teacher.FirstName) < 5 AND LEFT(FirstName,3) = LEFT(LastName,3)