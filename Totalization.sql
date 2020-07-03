--SUM
Select SUM(Amount)
  from [Order]

--COUNT
select count(*)
  from [Order]
 
--/
Select SUM(Amount)/count(*)
  from [Order]

--ALIAS DE CAMPO
Select SUM(Amount)/count(*) AS Media
  from [Order]

--AVG
Select AVG(Amount) AS Media
  from [Order]

--*
Select SUM(Amount) * 100 AS Promedio
  from [Order]

