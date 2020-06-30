--INSERT DE DATOS MANUAL
Insert into [User]
       ([Name],[LastName],[Password],[PhoneNumber], [UserGuid], [Gender]) 
values
       ('Geovani', 'Batalla', '123', '7757848771',NEWID(), 'M') 

insert into [Stats]
       ([UserId],Month, Year, TotalSales, TotalOrders, TotalProducts, TotalExpenses)
values 
	   (1, 06, 2020, 100, 1, 2, 25)

insert into [Order]
       ([UserId], [StatId], [Amount], [Step])
values
       (1,1,100,1)

--INSERT DE DATOS CON IDENTITY PESONALIZADA
SET IDENTITY_INSERT [User] ON
insert into [User]
       (Id, [Name], LastName, Password, PhoneNumber, UserGuid, Gender) 
values
       (3, 'Rolando', 'Batalla', 'Password', '7754879415', NEWID(), 'H')
SET IDENTITY_INSERT [User] OFF

