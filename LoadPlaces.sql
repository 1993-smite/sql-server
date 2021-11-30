USE [TestUsers]
GO

declare @userId int, @lastUserId int, @address nvarchar(50), @placeId int;

set @userId = 0;

WHILE @userId > -1
BEGIN

	set @lastUserId = @userId;
	set @address = '';
	set @placeId = 0;

    select top 1 
		@userId = users.id, 
		@address = users.address 
	from users 
	where users.id > @userId;

	if @userId < 1 or @userId - @lastUserId < 1
		break;

	select @placeId = id
	from places 
	where address = @address


	if @placeId < 1
	begin
		insert places (address) values(@address);

		select @placeId = id
		from places 
		where address = @address

	end; 

	if not exists (select * from users_places where userId = @userId and placeId = @placeId)
	begin
		
		insert users_places(userId, placeId) values(@userId, @placeId);

	end;

END;
