USE [TestUsers]
GO

declare @userId int, @maxUserId int, @placeId int;

set @userId = 1;
set @maxUserId = (select max(userId) from users_places) + 1;

while @userId < @maxUserId
begin
	set @placeId = (select placeId from users_places where userId = @userId);
	
	 
end;
