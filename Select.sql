select * 
  from [Order] [order] inner join [User] [user] 
    on [order].UserId = [user].Id
where [user].Id = 1 and [order].Step != 0 and [Order].Step != 2 order by [order].Amount asc

select SUM(Amount) from [Order] where [UserId] = 1
  
select UserId,
       StatId, 
	   Amount/(select TotalOrders
	           from Stats where Id = StatId) * 100
       from [Order] where UserId = 1
       
--SELECT BETWEEN
select *
  from [Order]
 where Amount between 100 and 200       

