--CONCAT
select concat ([Name],' ', [Password]) from [User] where Id = 2

--SUBSTRAT
select substring([Name],1,2) from [User] where Id = 2
select substring([Name], 1, (len([Name])- 3)) from [User] where Id = 2

--LENGTH
select LEN(LastName) from [User] where Id = 2

--REPLACE
SELECT REPLACE('Nombre: ', LastName, [Name]) from [User] where Id = 2




