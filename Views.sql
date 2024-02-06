--CALL WITH A PROCEDURE
Create View Order_V as
select U.[Name],
       U.[LastName],
	   U.[PhoneNumber],
	   S.[TotalSales],
	   S.[TotalProducts],
	   U.[Id]
 From [User] U, [Stats] S
where S.UserId = U.Id
