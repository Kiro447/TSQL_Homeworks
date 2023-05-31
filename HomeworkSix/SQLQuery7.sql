--Create new procedure called CreateGrade
--• Procedure should create only Grade header info (not Grade Details)
--• Procedure should return the total number of grades in the system for the Student on input
--(from the CreateGrade)
--• Procedure should return second resultset with the MAX Grade of all grades for the Student
--and Teacher on input (regardless the Course



CREATE PROCEDURE CreateGrade (
@Grade tinyint,
@Comment nvarchar(max),
@CreatedDate datetime)
AS
BEGIN

  --Created by: KJ
  --Created date: 31.05.2023
  --Ticket Number: 1
  --Description: Insert GRADES

  PRINT 'Inserting NEW GRADE'
  INSERT INTO Grade(Grade,Comment,CreatedDate) values (@Grade,@Comment,@CreatedDate)

    SELECT StudentID, COUNT(*) AS Grade_Count
    FROM Grade
    WHERE CreatedDate = @CreatedDate
    GROUP BY StudentID;

    SELECT TeacherID, MAX(Grade) AS Max_Grade
    FROM Grade
    WHERE CreatedDate = @CreatedDate
    GROUP BY TeacherID;
END

EXEC CreateGrade 10,'GGWP','2023-05-31'
EXEC CreateGrade 8,'EZ','2023-05-31'


SELECT *
FROM Grade
ORDER BY Grade.ID DESC


--Create new procedure called CreateGradeDetail
--• Procedure should add details for specific Grade (new record for new AchievementTypeID,
--Points, MaxPoints, Date for specific Grade)
--• Output from this procedure should be resultset with SUM of GradePoints calculated with
--formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade

CREATE PROCEDURE CreateGradeDetail(@AchPoints smallint, @AchMaxPoints smallint, @AchDate date)
AS

BEGIN

INSERT INTO GradeDetails(AchievementPoints,AchievementMaxPoints,AchievementDate) values (@AchPoints,@AchMaxPoints,@AchDate)

SELECT gd.ID, SUM((gd.AchievementPoints / AchievementMaxPoints) * act.ParticipationRate) as Result_Set
FROM GradeDetails as gd
LEFT JOIN AchievementType AS act ON gd.AchievementTypeID = act.ID
WHERE gd.AchievementTypeID = act.ID
GROUP BY gd.ID
HAVING SUM((gd.AchievementPoints / AchievementMaxPoints) * act.ParticipationRate) > 0;
END

EXEC CreateGradeDetail 122,255,'2023-05-31'
