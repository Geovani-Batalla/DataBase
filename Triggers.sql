create trigger Tr_Insert_User_Mirror on [User]
after insert
as
set xact_abort off;
declare @UserId int,
        @Name nvarchar(128),
		@LastName nvarchar(128),
		@Password nvarchar(128),
	    @PhoneNumber nvarchar(10)
begin 
     
	 select @UserId = [Id], @LastName = [LastName], @Password = [Password], @PhoneNumber = [PhoneNumber] from inserted

if(@UserId = 1)
    begin try
	    insert into [User] values(@UserId, @LastName, @Password, @PhoneNumber, NEWID(), 'U') 
   end try
   begin catch
   end catch;
end
	        

create trigger Tr_Update_User_Mirror on [User]
after update
as
set xact_abort off;
declare @Id int,
        @UserId int,
        @Name nvarchar(128),
		@LastName nvarchar(128),
		@Password nvarchar(128),
	    @PhoneNumber nvarchar(10)
begin 
     
	 select @UserId = [Id], @LastName = [LastName], @Password = [Password],
	        @PhoneNumber = [PhoneNumber] from inserted

	 select @Id = [Id] from User_Mirror where UserId = @UserId

if(@UserId = 1)
    begin try	   
		update User_Mirror set Name = @Name, LastName = @LastName where Id = @Id	
   end try
   begin catch
   end catch;
end
	    


create trigger Tr_Delete_User_Mirror on [User]
after delete
as
set xact_abort off;

declare @Id int,
        @UserId int

begin 

	 select @UserId = [Id] from inserted

	 select @Id = [Id] from User_Mirror where UserId = @UserId

if(@UserId = 1)
    begin try	   

		 delete from User_Mirror where Id = @Id
	
   end try
   begin catch
   end catch;
end





