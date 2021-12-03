USE [TestUsers]
GO

/*
	get places with users and grouping 
*/

select p.address, p.id, count(u.id) as count
from places as p
inner join users_places as up on up.placeId = p.id
inner join users as u on u.id = up.userId
where p.id > 0
group by p.address, p.id with rollup
having not (p.address is null) and not (p.id is null) and COUNT(*) > 1
order by count desc, p.address
