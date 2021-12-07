use TestUsers

select id 
	, fullname
	, address
	, ROW_NUMBER() over(order by id) as num
	, (case id
		when 20 then 1
		else 2
		end) as filter   
from users
order by filter, num