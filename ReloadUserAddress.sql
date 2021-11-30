USE [TestUsers]
GO

declare @id int, @address nvarchar(50);

set @id = 0;
set @address = '';

WHILE @id > -1
BEGIN

    select top 1 
		@id = users.id, 
		@address = users.address 
	from users 
	where users.id > @id 
	  and users.address like '%"%';

	if @id < 1
		break;

	UPDATE users set address = REPLACE(@address,'"','') where id = @id;

END;
