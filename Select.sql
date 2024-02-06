--INNER JOIN 
select O.ID_Ruta_Preventa, R.Nombre, R.ID_Sucursal, SUM(DO.Importe_Entregado) as Total, SUM(DO.Descuento_Entregado) as Descuento from Detalle_Ordenes as DO 
join Ordenes as O on DO.ID_Orden = O.ID 
join Rutas as R on O.ID_Ruta_Preventa = R.ID
where YEAR(O.Fecha_Entrega) = 2023 
and (O.Estatus = 'ENTREGADA' or O.Estatus = 'ENTREGA_PARCIAL') 
and O.Activo = 1 and DO.Importe_Entregado > 0
group by O.ID_Ruta_Preventa, R.Nombre, r.ID_Sucursal 
order by R.ID_Sucursal, R.Nombre

select v.ID_Ruta, r.Nombre, sum(DV.Importe) as Importe, sum(DV.Descuento) as Descuento from Detalle_Ventas as DV join Ventas as V on DV.ID_Venta = V.ID
join Rutas as R on V.ID_Ruta = R.ID
where YEAR(V.Fecha_creacion) = 2023 
and V.Activo = 1 
and R.Tipo_Ruta = 'PREVENTA'
group by V.ID_Ruta, R.Nombre, r.ID_Sucursal 
order by R.ID_Sucursal, R.Nombre
