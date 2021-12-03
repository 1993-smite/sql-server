USE [TestUsers]
GO

select u.fullname, p.address
from users as u
left outer join users_places as up on up.userId = u.id
left outer join places as p on p.id = up.placeId
where u.id > 0
order by u.fullname
