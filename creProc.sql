USE TestUsers;
GO
CREATE PROCEDURE GetSortUsers AS
BEGIN
    select fullname
		, ROW_NUMBER() over(order by id) as num
		, iif(fullname like 'ì%', 1, 2) as srtByFullLikeM
	from users
	order by srtByFullLikeM, num, fullname
END;