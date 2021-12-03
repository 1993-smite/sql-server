USE [TestUsers]
GO

--Find the highest number to start with
DECLARE @count INT = (SELECT MAX(ROW) FROM users);
DECLARE @row INT;

-- Loop true your data until you hit 0
WHILE (@count != 0)
BEGIN

	print @row;

    SELECT @row = ROW
    FROM users
    WHERE ROW = @count
    ORDER BY ROW DESC

    --DO SOMTHING COOL  

    -- SET your counter to -1
    SET @count = @row -1
END