Use DataBase_V1
Go
Create procedure [Sp_Insert_Stats]
   @Id int,
   @UserId int,
   @Month int,
   @Year int,
   @TotalSales decimal(10,2),
   @TotalOrders int,
   @TotalProducts int,
   @TotalExpenses decimal(10,2)
as
Begin 
   insert into [Stats] values(@UserId, @Month, @Year, @TotalSales, @TotalOrders, @TotalProducts,@TotalExpenses)     
end
 

Go
Create procedure [Sp_Update_Stats]
   @Id int,
   @UserId int,
   @Month int,
   @Year int,
   @TotalSales decimal(10,2),
   @TotalOrders int,
   @TotalProducts int,
   @TotalExpenses decimal(10,2)
as
Begin 
   update [Stats] 
   set TotalSales = @TotalSales,
       TotalOrders = @TotalOrders,
       TotalProducts = @TotalProducts,
       TotalExpenses = @TotalExpenses
   where Id = @Id
end


Go
Create procedure [Sp_Delete_Stats]
   @Id int,
   @UserId int,
   @Month int,
   @Year int,
   @TotalSales decimal(10,2),
   @TotalOrders int,
   @TotalProducts int,
   @TotalExpenses decimal(10,2)
as
begin  
   delete from [Stats] where Id = @Id
end


--USED TO CALL A VIEW
go
create procedure Sp_View_Order_V
 @UserId int
as
begin
  select * from Order_V where Id = @UserId 
end
 

