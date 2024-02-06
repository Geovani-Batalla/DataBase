--CREACION DE BASE DE DATOS
Create Database DataBase_V1
Go

--CREACION DE TABLAS CON SUS LLAVES(PRIMARIAS  FORANEAS)
Create table [User](

  [Id] int not null identity(1,1),
  [Name] nvarchar(128) not null,
  [LastName] nvarchar(128) not null,
  [Password] nvarchar(128) not null,
  [PhoneNumber] nvarchar(10) not null,
  [UserGuid] nvarchar(64)

  constraint Pk_User primary key(Id)
)

Create table [Stats](

  [Id] int not null identity(1,1),
  [UserId] int not null,
  [Month] int not null,
  [Year] int not null,
  [TotalSales] decimal(10,2) not null,
  [TotalOrders] int not null,
  [TotalProducts] int not null,
  [TotalExpenses] decimal(10,2) null,

  constraint Pk_Stats primary key(Id),
  constraint Fk_Stats_User foreign key(UserId) references [User](Id)
)

Create table User_Stats
(
  [StatsId] int not null,
  [UserId] int not null,

  constraint PK_Stats_Users primary key(StatsId, UserId)
)

Create table [User_Mirror]
(
  [Id] int not null identity(1,1),
  [UserId] int not null,
  [Name] nvarchar(128) not null,
  [LastName] nvarchar(128) not null,
  [Password] nvarchar(128) not null,
  [PhoneNumber] nvarchar(10) not null,
  [UserGuid] nvarchar(64)

  constraint Pk_Mirror_User primary key(Id),
  constraint Fk_Mirror_User foreign key(UserId) references [User](Id)
)

Create table [Order]
(
  [Id] int not null identity(1,1),
  [UserId] int not null,
  [StatId] int not null,
  [Amount] decimal(10,2) not null,
  [Step] int not null

  constraint Pk_Order primary key(Id)
)

--AÑADIR O ELIMINAR CAMPOS
alter table [User] add Gender nvarchar(1) not null default 'U'
alter table [User] add Birthdate date null

--CAMPOS CHECK
--U = undifined
alter table [User] add constraint User_Gender_ck check( Gender in ('H', 'M', 'U'))

--MODIFICAR CAMPOS
alter table [User] alter column Birthdate datetime

--ELIMINAR CAMPOS
alter table [User] drop column Birthdate

--ELIMINAR CLAVES
alter table [Stats] drop constraint Fk_Stats_User

--AGREGAR CLAVE
alter table [Stats] add constraint Fk_Stats_User foreign key(UserId) references [User](Id)

--INDICES COMPUESTOS
create index User_Stats_Inx on [Order] ([UserId], [StatId])

--USUARIOS, ROLES Y PRIVILEGIOS
create role User_Rol

--OTORGAR PRIVILEGIOS
grant select on [Order] to User_Rol
grant insert on [Order] to User_Rol
grant update on [Order] to User_Rol
grant delete on [Order] to User_Rol

--CREACION DE UN USUARIO
create user User_Admin with password = 'Pa$$w0rd'

--OTORGAR EL ROL
grant User_Rol to User_Admin

--QUITAR ROL
revoke User_Rol from User_Admin

--ELIMINAR TABLA
drop table [Order]
