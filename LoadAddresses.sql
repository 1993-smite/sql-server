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
	where users.id > @id;

	if @id < 1
		break;

	INSERT user-places VALUES (@id,@address);

	if not exists (select * from users where address = @address)
	begin
		INSERT places VALUES (@address);
	end;

END;