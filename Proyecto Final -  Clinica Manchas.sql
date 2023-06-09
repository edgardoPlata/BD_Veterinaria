--Creacion de la base de datos
CREATE Database Veterinaria
--Usar la base de datos 
USE [Veterinaria]

 /*Creacion de la tabla Cliente*/
CREATE TABLE [dbo].[Cliente](
	[CodCliente] [nvarchar](10) NOT NULL,
	[Nombre] [nvarchar](40) NULL,
	[Apellido] [nvarchar](40) NULL,
	[Cedula] [nvarchar](30) NULL,
	[Direccion] [nvarchar](60) NULL,
	[Telefono] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Vista de cliente donde filtramos atravez de la direccion en tipitapa
CREATE VIEW [dbo].[Vista_Cliente_Por _Direccion]
AS
SELECT        TOP (100) PERCENT CodCliente, Nombre, Apellido, Cedula, Direccion, Telefono
FROM            dbo.Cliente
WHERE        (Direccion = N'Tipitapa')
ORDER BY Direccion


--Vista de cliente donde filtramos atravez del apellido que inicie con M
CREATE VIEW [dbo].[Vista_Cliente_Like_M]
AS

SELECT        TOP (100) PERCENT CodCliente, Nombre, Cedula, Apellido
FROM            dbo.Cliente where Apellido like 'M%'


--Vista de cliente donde filtramos atravez del nombre que inicie con J
CREATE VIEW [dbo].[Vista_Cliente_Nombre_con_J]
AS

SELECT         CodCliente, Nombre, Apellido, Cedula, Direccion, Telefono
FROM            dbo.Cliente
WHERE        (Nombre LIKE N'j%')


--Vista de cliente donde filtramos atravez del apellido que inicie con B en orden Descendente
CREATE VIEW [dbo].[Vista_Cliente_Like_B_Apellido]
AS

SELECT        TOP (100) PERCENT CodCliente, Nombre, Cedula, Apellido, Direccion, Telefono
FROM            dbo.Cliente
WHERE        (Apellido LIKE N'P%')
ORDER BY Apellido DESC

--Vista de cliente donde ordenamos de orden Descendente el telefono
CREATE VIEW [dbo].[Vista_Cliente_Ordenar_Telefono]
AS

SELECT        TOP (100) PERCENT CodCliente, Nombre, Cedula, Apellido, Direccion, Telefono
FROM            dbo.Cliente
ORDER BY Telefono DESC

--Creacion de la tabla Detallefactura
CREATE TABLE [dbo].[DetalleFactura](
	[IdProducto] [nvarchar](10) NULL,
	[IdFactura] [nvarchar](10) NULL,
	[Cantidad] [real] NULL,
	[IR] [real] NULL,
	[Total] [real] NULL
) ON [PRIMARY]


--Vista de DetalleFactura donde filtramos atravez del IdProducto que inicie con un numero 2
create view [dbo].[Vista_DetalleFactura_Idproducto_2]
as
SELECT        TOP (100) PERCENT IdProducto, IdFactura, Cantidad, IR, Total
FROM            dbo.DetalleFactura
WHERE        (IdProducto LIKE N'2')


--Vista DetalleFactura Que total sea Mayor 500 
create view [dbo].[Vista_DetalleFactura_Total_mayor]
as
SELECT        TOP (100) PERCENT IdProducto, IdFactura, Cantidad, IR, Total
FROM            dbo.DetalleFactura
WHERE        (Total > 500)
GO

--Vista de Detallefactura que total sea menor a 500
create view [dbo].[Vista_DetalleFactura_Total_menor]
as
SELECT        TOP (100) PERCENT IdProducto, IdFactura, Cantidad, IR, Total
FROM            dbo.DetalleFactura
WHERE        (Total < 500)
GO


--Vista de Detallefactura que Cantidad sea mayor a 5
create view [dbo].[Vista_DetalleFactura_Cantidad_mayor_5]
as
SELECT        TOP (100) PERCENT IdProducto, IdFactura, Cantidad, IR, Total
FROM            dbo.DetalleFactura
WHERE        (Cantidad > 5)
ORDER BY Cantidad

--Vista de Detallefactura que Cantidad sea menor a 5
create view [dbo].[Vista_DetalleFactura_Cantidad_menor_5]
as
SELECT        TOP (100) PERCENT IdProducto, IdFactura, Cantidad, IR, Total
FROM            dbo.DetalleFactura
WHERE        (Cantidad < 5)
ORDER BY Cantidad

--Creacion de la Tabla DetallePAgo
CREATE TABLE [dbo].[DetallePago](
	[IdPago] [nvarchar](10) NULL,
	[IdServicio] [nvarchar](10) NULL,
	[Precio] [real] NULL
) ON [PRIMARY]


--Vista de DetallePago que Preciosea menor a 200
create view [dbo].[Vista_DetallePago_Precio_menor_200]
as
SELECT        TOP (100) PERCENT IdPago, IdServicio, Precio
FROM            dbo.DetallePago
WHERE        (Precio < 200)

--Vista de DetallePago que Cantidad sea mayor a 200
create view [dbo].[Vista_DetallePago_Precio_mayor_200]
as
SELECT        TOP (100) PERCENT IdPago, IdServicio, Precio
FROM            dbo.DetallePago
WHERE        (Precio > 200)

--Vista de DetallePago que IdPago inicie con A
create view [dbo].[Vista_DetallePago_IdPago_Asce]
as
SELECT        TOP (100) PERCENT IdPago, IdServicio, Precio
FROM            dbo.DetallePago
WHERE        (IdPago LIKE N'A%')
ORDER BY IdPago 

--Vista de DetallePago que IdServicio inicie con A
create view [dbo].[Vista_DetallePago_IdServicio_Asce]
as
SELECT        TOP (100) PERCENT IdPago, IdServicio, Precio
FROM            dbo.DetallePago
WHERE        (IdServicio LIKE N'A%')
ORDER BY IdServicio
 
--Vista de DetallePago que IdServicio inicie con A en orden Desc
create view [dbo].[Vista_DetallePago_IdServicio_Desc]
as
SELECT        TOP (100) PERCENT IdPago, IdServicio, Precio
FROM            dbo.DetallePago
WHERE        (IdServicio LIKE N'A%')
ORDER BY IdServicio Desc
 
 --Creacion de la Tabla factura
CREATE TABLE [dbo].[Factura](
	[NumeroFactura] [nvarchar](10) NOT NULL,
	[Fecha] [nvarchar](15) NULL,
	[IdProveedor] [nvarchar](10) NULL,
	[IdMedicina] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Vista Factura que busca IDProveedor por la letra A
create view [dbo].[Vista_Factura_ordenarPorA]
As
SELECT        TOP (100) PERCENT NumeroFactura, Fecha, IdProveedor, IdMedicina
FROM            dbo.Factura
WHERE        (IdProveedor LIKE N'A%')

--Vista Factura que busca IDProveedor por la letra P
create view [dbo].[Vista_Factura_MedicinaPorP]
As
SELECT        TOP (100) PERCENT NumeroFactura, Fecha, IdProveedor, IdMedicina
FROM            dbo.Factura
WHERE        (IdProveedor LIKE N'A%')

--Vista Factura que Muestra de forma ascendente en numero Factura
create view [dbo].[Vista_Factura_Desc]
As
SELECT        TOP (100) PERCENT NumeroFactura, Fecha, IdProveedor, IdMedicina
FROM            dbo.Factura
ORDER BY NumeroFactura DESC

--Vista Factura que ordena por fecha
create view [dbo].[Vista_Factura_Fecha]
As
SELECT        TOP (100) PERCENT NumeroFactura, Fecha, IdProveedor, IdMedicina
FROM            dbo.Factura
ORDER BY Fecha
GO
--Vista Factura que ordena por fecha Acendente
create view [dbo].[Vista_Factura_Fecha_Desc]
As
SELECT        TOP (100) PERCENT NumeroFactura, Fecha, IdProveedor, IdMedicina
FROM            dbo.Factura
ORDER BY Fecha Desc

--Creacion de tabla de Mascota
CREATE TABLE [dbo].[Mascota](
	[CodMascota] [nvarchar](10) NOT NULL,
	[Nombre] [nvarchar](30) NULL,
	[IdTipo] [nvarchar](60) NULL,
	[Raza] [nvarchar](30) NULL,
	[Peso] [real] NULL,
	[IdCliente] [nvarchar](10) NULL,
	[TipoServicio] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodMascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


--Vista Mascota de orden descendente por Raza
create view [dbo].[Vista_Mascota_Desc]
As
SELECT        TOP (100) PERCENT CodMascota, Nombre, IdTipo, Raza, Peso, IdCliente
FROM            dbo.Mascota
ORDER BY Raza DESC

--Vista Mascota de orden Ascendente por Raza
create view [dbo].[Vista_Mascota_Asc]
As
SELECT        TOP (100) PERCENT CodMascota, Nombre, IdTipo, Raza, Peso, IdCliente
FROM            dbo.Mascota
ORDER BY Raza 

--Vista Mascota que inicie con letra G
create view [dbo].[Vista_Mascota_RazaG]
As
SELECT        TOP (100) PERCENT CodMascota, Nombre, IdTipo, Raza, Peso, IdCliente
FROM            dbo.Mascota where Raza like 'G%'

--Vista Mascota Con peso mayor a 50
create view [dbo].[Vista_Mascota_Peso_Myor]
As
SELECT        TOP (100) PERCENT CodMascota, Nombre, IdTipo, Raza, Peso, IdCliente
FROM            dbo.Mascota
WHERE        (Peso > 50)

--Vista Mascota Con peso menor a 50
create view [dbo].[Vista_Mascota_Peso_Menor]
As
SELECT        TOP (100) PERCENT CodMascota, Nombre, IdTipo, Raza, Peso, IdCliente
FROM            dbo.Mascota
WHERE        (Peso < 50)

CREATE TABLE [dbo].[Medicina](
	[CodMedicina] [nvarchar](10) NOT NULL,
	[Nombre] [nvarchar](30) NULL,
	[Precio] [real] NULL,
	[fechaVencimeinto] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodMedicina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


--Ordenar Por fecha de orden descendente
create view [dbo].[Vista_Medicina_Fecha_Desc]
As
SELECT        TOP (100) PERCENT CodMedicina, Nombre, fechaVencimeinto, Precio
FROM            dbo.Medicina
ORDER BY fechaVencimeinto DESC


--Ordenar Por fecha de orden Ascedente
create view [dbo].[Vista_Medicina_Fecha_Asc]
As
SELECT        TOP (100) PERCENT CodMedicina, Nombre, fechaVencimeinto, Precio
FROM            dbo.Medicina
ORDER BY fechaVencimeinto 


--Ordenar por precio de mayor a 100
create view [dbo].[Vista_Medicina_Mayor]
As
SELECT        TOP (100) PERCENT CodMedicina, Nombre, fechaVencimeinto, Precio
FROM            dbo.Medicina
WHERE        (Precio > 100)

--Ordenar por precio de menor a 100
create view [dbo].[Vista_Medicina_Menor]
As
SELECT        TOP (100) PERCENT CodMedicina, Nombre, fechaVencimeinto, Precio
FROM            dbo.Medicina
WHERE        (Precio < 100)

--Ordenar por letra en nombre que inice con P
create view [dbo].[Vista_Medicina_NombreP]
As
SELECT        TOP (100) PERCENT CodMedicina, Nombre, fechaVencimeinto, Precio
FROM            dbo.Medicina
WHERE        (Nombre LIKE N'%P')


--Creacion Tabla Pago
CREATE TABLE [dbo].[Pago](
	[CodPago] [nvarchar](10) NOT NULL,
	[Fecha] [nvarchar](14) NULL,
	[IdCliente] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Ordenar pago por fecha
create view [dbo].[Vista_Pago]
As
SELECT        TOP (100) PERCENT CodPago, Fecha, IdCliente
FROM            dbo.Pago
ORDER BY Fecha

--Ordenar pago por fecha Desc
create view [dbo].[Vista_Pago_Desc]
As
SELECT        TOP (100) PERCENT CodPago, Fecha, IdCliente
FROM            dbo.Pago
ORDER BY Fecha Desc


--Ordenar pago por codigo de pago
create view [dbo].[Vista_Pago_CodPago]
As
SELECT        TOP (100) PERCENT CodPago, Fecha, IdCliente
FROM            dbo.Pago
ORDER BY CodPago

--Ordenar pago por codigo de pago Descendente
create view [dbo].[Vista_Pago_CodPago_Desc]
As
SELECT        TOP (100) PERCENT CodPago, Fecha, IdCliente
FROM            dbo.Pago
ORDER BY CodPago Desc

--Ordenar pago por fecha descendete
create view [dbo].[Vista_Pago_Fecha_Desc]
As
SELECT        TOP (100) PERCENT CodPago, Fecha, IdCliente
FROM            dbo.Pago
ORDER BY Fecha DESC


--Creacion Tabla Prodcutos
CREATE TABLE [dbo].[Producto](
	[CodProducto] [nvarchar](10) NOT NULL,
	[Nombre] [nvarchar](30) NULL,
	[PrecioCompra] [real] NULL,
	[PrecioVenta] [real] NULL,
	[Cantidad] [real] NULL,
	[IdTipo] [nvarchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


--Vista Producto Con cantidad mayor a 50
create view [dbo].[Vista_Producto_Cantida_Mayor]
As
SELECT        CodProducto, Nombre, PrecioCompra, PrecioVenta, Cantidad, IdTipo
FROM            dbo.Producto
WHERE        (Cantidad > 50)



--Vista Producto Con cantidad menor a 50
create view [dbo].[Vista_Producto_Cantida_Menor]
As
SELECT        CodProducto, Nombre, PrecioCompra, PrecioVenta, Cantidad, IdTipo
FROM            dbo.Producto
WHERE        (Cantidad < 50)


--Vista Producto filtrar precioventa mayor a 150
create view [dbo].[Vista_Producto_Precio_Mayor]
As
SELECT        CodProducto, Nombre, PrecioCompra, PrecioVenta, Cantidad, IdTipo
FROM            dbo.Producto
WHERE        (PrecioVenta > 150)

--Vista Producto filtrar precioventa menor a 150
create view [dbo].[Vista_Producto_Precio_Menor]
As
SELECT        CodProducto, Nombre, PrecioCompra, PrecioVenta, Cantidad, IdTipo
FROM            dbo.Producto
WHERE        (PrecioVenta < 150)

--Vista Producto filtrar por nombre con letra A
create view [dbo].[Vista_Producto_NombreA]
As
SELECT        CodProducto, Nombre, PrecioCompra, PrecioVenta, Cantidad, IdTipo
FROM            dbo.Producto
WHERE        (Nombre LIKE N'A%')

--Creacion de la tabla Proveedor
CREATE TABLE [dbo].[Proveedor](
	[CodProveedor] [nvarchar](10) NOT NULL,
	[Nombre] [nvarchar](30) NULL,
	[Apellido] [nvarchar](30) NULL,
	[Direccion] [nvarchar](80) NULL,
	[Telefono] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Ordenar Proveedor con direccion tipitapa
create view [dbo].[Vista_Proveedor_direccion]
As
SELECT        CodProveedor, Nombre, Apellido, Direccion, Telefono
FROM            dbo.Proveedor
WHERE        (Direccion LIKE N'Tipitapa')

--Ordenar Proveedor por nombre 
create view [dbo].[Vista_Proveedor_Nombre]
As
SELECT        TOP (100) PERCENT CodProveedor, Nombre, Apellido, Direccion, Telefono
FROM            dbo.Proveedor
ORDER BY Nombre

--Ordenar Proveedor por nombre Descendente
create view [dbo].[Vista_Proveedor_Nombre_Desc]
As
SELECT        TOP (100) PERCENT CodProveedor, Nombre, Apellido, Direccion, Telefono
FROM            dbo.Proveedor
ORDER BY Nombre Desc

--Ordenar Proveedor por Apellido
create view [dbo].[Vista_Proveedor_Apellido]
As
SELECT        TOP (100) PERCENT CodProveedor, Nombre, Apellido, Direccion, Telefono
FROM            dbo.Proveedor
ORDER BY Apellido


--Ordenar Proveedor por Apellido descendente
create view [dbo].[Vista_Proveedor_Apellido_Desc]
As
SELECT        TOP (100) PERCENT CodProveedor, Nombre, Apellido, Direccion, Telefono
FROM            dbo.Proveedor
ORDER BY Apellido Desc


--Creacion de la tabla servicio
CREATE TABLE [dbo].[Servicio](
	[Servicio] [nvarchar](10) NOT NULL,
	[Descripcion] [nvarchar](60) NULL,
	[Precio] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[Servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Ordenar Por precio que se mayor a 100
create view [dbo].[Vista_Servicio_Mayor]
As
SELECT        Servicio, Descripcion, Precio
FROM            dbo.Servicio
WHERE        (Precio > 100)

--ordenar por precio menor a 100
create view [dbo].[Vista_Servicio_Menor]
As
SELECT        Servicio, Descripcion, Precio
FROM            dbo.Servicio
WHERE        (Precio < 100)

--Ordenar por servicio Ascendente
create view [dbo].[Vista_Servicio_]
As
SELECT        TOP (100) PERCENT Servicio, Descripcion, Precio
FROM            dbo.Servicio
ORDER BY Servicio

--Ordenar por servicio en orden Descendente
create view [dbo].[Vista_Servicio_Desc]
As
SELECT        TOP (100) PERCENT Servicio, Descripcion, Precio
FROM            dbo.Servicio
ORDER BY Servicio Desc

--ordenar por servicio cuando inicie con letra L
CREATE view [dbo].[Vista_Servicio_L]
As
SELECT        TOP (100) PERCENT Servicio, Descripcion, Precio
FROM            dbo.Servicio
WHERE        (Servicio LIKE N'L%')

--Crear Tabla Tipo
CREATE TABLE [dbo].[Tipo](
	[Tipo] [nvarchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Ordenar por tipo de orden Ascendente
Create view [dbo].[Vista_Tipo]
As
SELECT        TOP (100) PERCENT Tipo
FROM            dbo.Tipo
ORDER BY Tipo

--Ordenar Por tipo de orden Descendente
Create view [dbo].[Vista_Tipo_Desc]
As
SELECT        TOP (100) PERCENT Tipo
FROM            dbo.Tipo
ORDER BY Tipo Desc

--Ordenar por tipo cuando letra inicie en A
Create view [dbo].[Vista_Tipo_A]
As
SELECT        TOP (100) PERCENT Tipo
FROM            dbo.Tipo
WHERE        (Tipo LIKE N'A%')

--Ordenar por tipo cuando letra inicie en C
Create view [dbo].[Vista_Tipo_B]
As
SELECT        TOP (100) PERCENT Tipo
FROM            dbo.Tipo
WHERE        (Tipo LIKE N'B%')

--Ordenar por tipo cuando letra inicie en A
Create view [dbo].[Vista_Tipo_C]
As
SELECT        TOP (100) PERCENT Tipo
FROM            dbo.Tipo
WHERE        (Tipo LIKE N'C%')

--Crear tabla Tratamiento
CREATE TABLE [dbo].[Tratamiento](
	[CodTratamiento] [nvarchar](10) NOT NULL,
	[Tratamiento] [nvarchar](29) NULL,
	[Descripcion] [nvarchar](60) NULL,
	[Costo] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodTratamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--ordenar por tratamiento en orden Ascendente
Create view [dbo].[Vista_Tratamiento]
As
SELECT        TOP (100) PERCENT CodTratamiento, Tratamiento, Descripcion, Costo
FROM            dbo.Tratamiento
ORDER BY Tratamiento

--ordenar por tratamiento en orden Descendente
Create view [dbo].[Vista_Tratamiento_Desc]
As
SELECT        TOP (100) PERCENT CodTratamiento, Tratamiento, Descripcion, Costo
FROM            dbo.Tratamiento
ORDER BY Tratamiento

--ordenar pro costo cuando este es mayor a 100
Create view [dbo].[Vista_Tratamiento_Costo_Mayor]
As
SELECT        TOP (100) PERCENT CodTratamiento, Tratamiento, Descripcion, Costo
FROM            dbo.Tratamiento
WHERE        (Costo > N'100')

--ordenar pro costo cuando este es menor 0
Create view [dbo].[Vista_Tratamiento_Costo_Menor]
As
SELECT        TOP (100) PERCENT CodTratamiento, Tratamiento, Descripcion, Costo
FROM            dbo.Tratamiento
WHERE        (Costo < N'100')


Create view [dbo].[Vista_Tratamiento_Costo_]
As
SELECT        TOP (100) PERCENT CodTratamiento, Tratamiento, Descripcion, Costo
FROM            dbo.Tratamiento
ORDER BY Costo

--Creacion de la tabla Vacuna
CREATE TABLE [dbo].[Vacuna](
	[CodVacuna] [nvarchar](10) NOT NULL,
	[Fecha] [nvarchar](10) NULL,
	[NumeroVacuna] [int] NULL,
	[Descripcion] [nvarchar](60) NULL,
	[IdMascota] [nvarchar](10) NULL,
	[IdCliente] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodVacuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Ordenar Por fecha Ascendente
Create view [dbo].[Vista_Vacuna_Fecha]
As
SELECT        TOP (100) PERCENT CodVacuna, Fecha, NumeroVacuna, Descripcion, IdMascota, IdCliente
FROM            dbo.Vacuna
ORDER BY Fecha

--Ordenar Por fecha descendente
Create view [dbo].[Vista_Vacuna_Fecha_Desc]
As
SELECT        TOP (100) PERCENT CodVacuna, Fecha, NumeroVacuna, Descripcion, IdMascota, IdCliente
FROM            dbo.Vacuna
ORDER BY Fecha Desc

--Ordenar por NumeroVacuna Ascendente
Create view [dbo].[Vista_Vacuna_NumeroVacuna]
As
SELECT        TOP (100) PERCENT CodVacuna, Fecha, NumeroVacuna, Descripcion, IdMascota, IdCliente
FROM            dbo.Vacuna
ORDER BY NumeroVacuna

--Ordenar por NumeroVacuna Descendente
Create view [dbo].[Vista_Vacuna_NumeroVacuna_Desc]
As
SELECT        TOP (100) PERCENT CodVacuna, Fecha, NumeroVacuna, Descripcion, IdMascota, IdCliente
FROM            dbo.Vacuna
ORDER BY NumeroVacuna Desc

--Ordenar por CodVacuna con la letra A
Create view [dbo].[Vista_Vacuna_CodVacuna]
As
SELECT        TOP (100) PERCENT CodVacuna, Fecha, NumeroVacuna, Descripcion, IdMascota, IdCliente
FROM            dbo.Vacuna
WHERE        (CodVacuna LIKE N'A%')


--Creacion tabla Categoria
CREATE TABLE [dbo].[Categoria](
	[CodCategoria] [nvarchar](10) NOT NULL,
	[Categoria] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Ordenar por Categoria de orden Ascendente
Create view [dbo].[Vista_Categoria]
As
SELECT        TOP (100) PERCENT CodCategoria, Categoria
FROM            dbo.Categoria
ORDER BY Categoria

--Ordenar por Categoria de orden descendente
Create view [dbo].[Vista_Categoria_Desc]
As
SELECT        TOP (100) PERCENT CodCategoria, Categoria
FROM            dbo.Categoria
ORDER BY Categoria Desc

--Ordenar por CodCstegoria en orden Ascendente
Create view [dbo].[Vista_Categoria_Codigo]
As
SELECT        TOP (100) PERCENT CodCategoria, Categoria
FROM            dbo.Categoria
ORDER BY CodCategoria

--Ordenar por CodCategoria en orden Descendente
Create view [dbo].[Vista_Categoria_Codigo_Desc]
As
SELECT        TOP (100) PERCENT CodCategoria, Categoria
FROM            dbo.Categoria
ORDER BY CodCategoria Desc

--Ordenar por Categoria con la letra A
Create view [dbo].[Vista_Categoria__A]
As
SELECT        TOP (100) PERCENT CodCategoria, Categoria
FROM            dbo.Categoria
WHERE        (Categoria LIKE N'A%')

--Creacion de Tabla Historial Para la utilizacion de los Triggers
CREATE TABLE [dbo].[Historial](
	[Fecha] [date] NULL,
	[Codigo] [nvarchar](10) NULL,
	[Descripcion] [varchar](100) NULL,
	[Usuario] [varchar](30) NULL
) ON [PRIMARY]

--Procedimiento Almacenado Para Actualizar La tabla categoria
create procedure [dbo].[Actualizar_Categoria]
@CodCategoria nvarchar(10),
@Categoria nvarchar(30)

as

begin
	update Categoria set CodCategoria = @CodCategoria,
					     Categoria = @Categoria
						 where CodCategoria = @CodCategoria
end

--Procedimiento Almacenado Para Actualizar La tabla Cliente
CREATE PROCEDURE [dbo].[Actualizar_Cliente]
	@CodCliente nvarchar(10),
	@Nombre nvarchar(40) ,
	@Apellido nvarchar(40),
	@Cedula nvarchar(30),
	@Direccion nvarchar(60),
	@Telefono real
AS
BEGIN
	update Cliente set Nombre = @Nombre, 
						Apellido =  @Apellido,  
						Cedula = @Cedula, 
						Direccion = @Direccion, 
						Telefono = @Telefono
						where CodCliente = @CodCliente
END

--Procedimiento Almacenado Para Actualizar La tabla Detalle Factura
CREATE procedure [dbo].[Actualizar_Detalle_Factura]

@idProducto nvarchar(10),
@idFactura nvarchar(10),
@cantidad real,
@ir real,
@total real
as 
begin
	update DetalleFactura set IdProducto = @idProducto,
							  IdFactura = @idFactura,
							  Cantidad = @cantidad,
							  IR = @ir,
							  Total = @total
							  where IdProducto = @idProducto and IdFactura = @idFactura

end

--Procedimiento Almacenado Para Actualizar La tabla Detalle pago
CREATE procedure [dbo].[Actualizar_Detalle_Pago]

@idpago nvarchar(10),
@idservicio nvarchar(10),
@precio real
as 
begin

update DetallePago set IdPago = @idpago,
					   IdServicio = @idservicio,
					   Precio = @precio
					   where IdPago = @idpago and IdServicio = @idservicio

end

--Procedimiento Almacenado Para Actualizar La tabla Factura
create procedure [dbo].[Actualizar_Factura]

@numerofactura nvarchar(10),
@fecha nvarchar(15),
@idproveedor nvarchar(10),
@idmedicinda nvarchar(10)

as

begin
update Factura set NumeroFactura = @numerofactura,
                   Fecha = @fecha,
				   IdProveedor = @idproveedor,
				   IdMedicina = IdMedicina
				   where NumeroFactura = @numerofactura
end

--Procedimiento Almacenado Para Actualizar La tabla Mascota
CREATE PROCEDURE [dbo].[Actualizar_Mascota]
	@CodMascota nvarchar(10),
	@Nombre nvarchar(30),
	@IdTipo nvarchar(10),
	@Raza nvarchar(30),
	@Peso real, 
	@IdCliente nvarchar(10),
	@TipoServicio nvarchar(10)
AS
BEGIN
	update Mascota set Nombre = @Nombre, IdTipo = @IdTipo, Raza = @Raza, Peso = @Peso, IdCliente = @IdCliente,
					  TipoServicio = @TipoServicio where CodMascota = @CodMascota
END

--Procedimiento Almacenado Para Actualizar La tabla Medicina
CREATE PROCEDURE [dbo].[Actualizar_Medicina]
	@CodMedicina nvarchar(10),
	@Nombre nvarchar(30),
	@Precio real,
	@fechaVencimeinto nvarchar(10)
as
BEGIN
	
	update Medicina set Nombre = @Nombre, Precio = @Precio, fechaVencimeinto = @fechaVencimeinto
	where CodMedicina = @CodMedicina
	select * from Medicina
END
--Procedimiento Almacenado Para Actualizar La tabla Pago
create procedure [dbo].[Actualizar_Pago]

@codpago nvarchar(10),
@fecha nvarchar(14),
@idcliente nvarchar(10)

as

begin
update Pago set CodPago = @codpago,
Fecha = @fecha,
IdCliente = @idcliente
where CodPago = @codpago

end

--Procedimiento Almacenado Para Actualizar La tabla Producto
CREATE procedure [dbo].[Actualizar_Producto]

@codproducto nvarchar(10),
@Nombre nvarchar(30),
@preciocompra real,
@precionventa real,
@idtipo nvarchar(10)

as
begin

update Producto set CodProducto = @codproducto,
					Nombre = @Nombre,
					PrecioCompra = @preciocompra,
					PrecioVenta = @precionventa,
					IdTipo = @idtipo
					where CodProducto = @codproducto
end

--Procedimiento Almacenado Para Actualizar La tabla Proveedor
CREATE procedure [dbo].[Actualizar_Proveedor]

@codproveedor nvarchar(10),
@nombre nvarchar(30),
@apellido nvarchar(30),
@Direccion nvarchar(80),
@telefono real

as 
begin
update Proveedor set CodProveedor= @codproveedor,
					Nombre = @nombre,
					Apellido = @apellido,
					Direccion = @Direccion,
					Telefono = @telefono
					where CodProveedor = @codproveedor
					
end

--Procedimiento Almacenado Para Actualizar La tabla Servicio
CREATE procedure [dbo].[Actualizar_Servicio]

@Servicio nvarchar(10),
@Descripcion nvarchar(60),
@precio real

as
begin
update Servicio set Servicio = @Servicio,
					Descripcion = @Descripcion,
					Precio = @precio
					where  Servicio = @Servicio
end

--Procedimiento Almacenado Para Actualizar La tabla Tipo
CREATE PROCEDURE [dbo].[Actualizar_Tipo]
	@CodTipo nvarchar(10) ,
	@Tipo nvarchar(60)
AS
BEGIN
	update Tipo set Tipo = @Tipo where CodTipo = @CodTipo
END

--Procedimiento Almacenado Para Actualizar La tabla Tratamiento
CREATE procedure [dbo].[Actualizar_Tratamiento]
@codtratamiento nvarchar(10),
@tratamiento nvarchar(29),
@descripcion nvarchar(60),
@Costo real
as
begin
update Tratamiento set CodTratamiento = @codtratamiento,
					   Tratamiento = @tratamiento,
					   Descripcion = @descripcion,
					   Costo = @Costo
					   where CodTratamiento = @codtratamiento
					
end



--Procedimiento Almacenado Para Actualizar La tabla Vacuna
CREATE PROCEDURE [dbo].[Actualizar_Vacuna]
	@CodVacuna nvarchar(10),
	@Fecha nvarchar(10),
	@NumeroVacuna real ,
	@Descripcion nvarchar(60),
	@IdMascota nvarchar(10),
	@IdCliente nvarchar(10)
AS
BEGIN
	update Vacuna set Fecha = @Fecha, NumeroVacuna = @NumeroVacuna,
					   Descripcion = @Descripcion,
					  IdMascota = @IdMascota,
					  IdCliente = @IdCliente
						Where CodVacuna = @CodVacuna 
END
--Procedimiento Almacenado Para agregar datos a la tabla Categoria
CREATE PROCEDURE [dbo].[Agregar_Categoria]
	@CodCategoria nvarchar(10) ,
	@Categoria nvarchar(30)
AS
BEGIN
		Insert into Categoria (CodCategoria,Categoria) values (@CodCategoria , @Categoria)
		select * from Categoria
END

CREATE PROCEDURE [dbo].[Agregar_Cliente]
@CodCliente nvarchar(10),
	@Nombre nvarchar(40) ,
	@Apellido nvarchar(40),
	@Cedula nvarchar(30),
	@Direccion nvarchar(60),
	@Telefono real

AS
BEGIN
Insert Into Cliente (CodCliente,Nombre,Apellido,Cedula,Direccion,Telefono) values
					(@CodCliente , @Nombre, @Apellido, @Cedula, @Direccion, @Telefono )

END

--Procedimiento Almacenado Para agregar datos a la tabla Detalle Factura
CREATE procedure [dbo].[Agregar_Detalle_Factura]

@idProducto nvarchar(10),
@idFactura nvarchar(10),
@cantidad real,
@ir real,
@total real
as 
begin
	insert into DetalleFactura  (Cantidad, IR,Total) 
	values ( @cantidad, @ir, @total)

	select * from DetalleFactura

end

--Procedimiento Almacenado Para agregar datos a la tabla Detalle Pago
CREATE procedure [dbo].[Agregar_Detalle_Pago]

@idpago nvarchar(10),
@idservicio nvarchar(10),
@precio real

as 
begin

insert into DetallePago (IdPago,IdServicio,Precio)
		Values(@idpago,@idservicio,@precio)

end

--Procedimiento Almacenado Para agregar datos a la tabla Factura
create procedure [dbo].[Agregar_Factura]

@numerofactura nvarchar(10),
@fecha nvarchar(15),
@idproveedor nvarchar(10),
@idmedicinda nvarchar(10)

as

begin
insert into Factura (NumeroFactura,Fecha,IdProveedor,IdMedicina)  
values(@numerofactura,@fecha,@idproveedor,@idmedicinda)

end

--Procedimiento Almacenado Para agregar datos a la tabla Mascota
CREATE PROCEDURE [dbo].[Agregar_Mascota]
	@CodMascota nvarchar(10),
	@Nombre nvarchar(30),
	@IdTipo nvarchar(10),
	@Raza nvarchar(30),
	@Peso real, 
	@IdCliente nvarchar(10),
	@TipoServicio nvarchar(10)
as 
BEGIN
	
	Insert into Mascota (CodMascota, Nombre, IdTipo, Raza, Peso,IdCliente,TipoServicio) values 
						(@CodMascota, @Nombre, @IdTipo, @Raza, @Peso, @IdCliente,@TipoServicio)

	

END

--Procedimiento Almacenado Para agregar datos a la tabla Medicina
CREATE PROCEDURE [dbo].[Agregar_Medicina]
	@CodMedicina nvarchar(10),
	@Nombre nvarchar(30),
	@Precio real,
	@fechaVencimeinto nvarchar(10)
AS
BEGIN
	insert into Medicina (CodMedicina,Nombre,Precio,fechaVencimeinto) values 
					   	 (@CodMedicina,@Nombre,@Precio,@fechaVencimeinto)

	select * from  Medicina
END

--Procedimiento Almacenado Para agregar datos a la tabla Pago
create procedure [dbo].[Agregar_Pago]

@codpago nvarchar(10),
@fecha nvarchar(14),
@idcliente nvarchar(10)

as

begin
insert into Pago (CodPago,Fecha, IdCliente) 
values(@codpago,@fecha,@idcliente)

end

--Procedimiento Almacenado Para agregar datos a la tabla Producto
CREATE procedure [dbo].[Agregar_Producto]

@codproducto nvarchar(10),
@Nombre nvarchar(30),
@preciocompra real,
@precionventa real,
@idtipo nvarchar(10)

as
begin

insert into Producto (CodProducto,Nombre,PrecioCompra,PrecioVenta,IdTipo)
values (@codproducto,@Nombre,@preciocompra,@precionventa,@idtipo)
end

--Procedimiento Almacenado Para agregar datos a la tabla Proveedor
CREATE procedure [dbo].[Agregar_Proveedor]

@codproveedor nvarchar(10),
@nombre nvarchar(30),
@apellido nvarchar(30),
@Direccion nvarchar(80),
@telefono real

as 
begin
insert into Proveedor (CodProveedor,Nombre,Apellido,Direccion,Telefono)
Values(@codproveedor,@nombre,@apellido,@Direccion,@telefono)
					
end

--Procedimiento Almacenado Para agregar datos a la tabla Servicio
CREATE procedure [dbo].[Agregar_Servicio]

@Servicio nvarchar(10),
@Descripcion nvarchar(60),
@precio real

as
begin
insert into Servicio (Servicio,Descripcion,Precio)
values(@Servicio,@Descripcion,@precio)
					
end

--Procedimiento Almacenado Para agregar datos a la tabla Tipo
CREATE PROCEDURE [dbo].[Agregar_Tipo]
		@Tipo nvarchar(60)
AS
BEGIN
	
		Insert into Tipo (Tipo) values (@Tipo)

		select * from Tipo

END

--Procedimiento Almacenado Para agregar datos a la tabla Tratamiento
CREATE procedure [dbo].[Agregar_Tratamiento]
@codtratamiento nvarchar(10),
@tratamiento nvarchar(29),
@descripcion nvarchar(60),
@Costo real
as
begin
insert into Tratamiento (CodTratamiento,Tratamiento,Descripcion,Costo)
Values (@codtratamiento,@tratamiento,@descripcion,@Costo)
					
end

--Procedimiento Almacenado Para agregar datos a la tabla Vacuna
CREATE PROCEDURE [dbo].[Agregar_Vacuna]
	@CodVacuna nvarchar(10),
	@Fecha nvarchar(10),
	@NumeroVacuna real ,
	@Descripcion nvarchar(60),
	@IdMascota nvarchar(10),
	@IdCliente nvarchar(10)
	as
BEGIN
		Insert into Vacuna (CodVacuna,Fecha,NumeroVacuna,Descripcion,IdMascota,IdCliente) VALUES
							(@CodVacuna,@Fecha,@NumeroVacuna,@Descripcion,@IdMascota,@IdCliente)
END

--Procedimiento Almacenado Para Buscar en la tabla Cliente
CREATE PROCEDURE [dbo].[Buscar_Cliente]
	 @Busqueda nvarchar (60)
AS
BEGIN
		select * from  Cliente where CodCliente + Nombre LIKE '%'+@Busqueda+'%'

END
--Procedimiento Almacenado Para Buscar en la tabla Detalle Factura
create procedure [dbo].[Buscar_Detalle_Factura]

@BusquedaFactura nvarchar(50)
as 
begin

select * from DetalleFactura where IdFactura like @BusquedaFactura+'%'


end

--Procedimiento Almacenado Para Buscar en la tabla Detalle Pago
create procedure [dbo].[Buscar_Detalle_Pago]

@Busqueda nvarchar(50)

as 
begin

select * from DetallePago where IdPago like @Busqueda+ '%'

end

--Procedimiento Almacenado Para Buscar en la tabla Factura 
create procedure [dbo].[Buscar_Factura]

@numerofactura nvarchar(10)

as

begin
select * from Factura where NumeroFactura like @numerofactura+ '%'

end

--Procedimiento Almacenado Para Buscar en la tabla Mascota
CREATE PROCEDURE [dbo].[Buscar_Mascota]
	@BusquedaMascota nvarchar(50)
AS
BEGIN
	Select * from Mascota where CodMascota + IdCliente LIKE '%'+@BusquedaMascota+'%'
END

--Procedimiento Almacenado Para Buscar en la tabla Medicina
CREATE PROCEDURE [dbo].[Buscar_Medicina]
	@CodMedicina nvarchar(10)
AS
BEGIN
	Select * from Medicina where CodMedicina  LIKE @CodMedicina+'%'
END

--Procedimiento Almacenado Para Buscar en la tabla Pago
create procedure [dbo].[Buscar_Pago]

@codpago nvarchar(10)


as

begin
select * from Pago where CodPago like @codpago+ '%'

end

--Procedimiento Almacenado Para Buscar en la tabla Producto
create procedure [dbo].[Buscar_Producto]

@codproducto nvarchar(10)


as
begin
select * from Producto where CodProducto like @codproducto+ '%'
end

--Procedimiento Almacenado Para Buscar en la tabla Proveedor
create procedure [dbo].[Buscar_Proveedor]

@codproveedor nvarchar(10)


as 
begin
select * from Proveedor where CodProveedor like @codproveedor+ '%'
					
end

--Procedimiento Almacenado Para Buscar en la tabla Servicio
create procedure [dbo].[Buscar_Servicio]

@CodServicio nvarchar(10)


as
begin
select * from Servicio where CodServicio like @CodServicio+ '%'
					
end


--Procedimiento Almacenado Para Buscar en la tabla Tipo
CREATE PROCEDURE [dbo].[Buscar_Tipo]
	@CodTipo nvarchar(10) 
	
AS
BEGIN
	Select * from Tipo where CodTipo LIKE @CodTipo+'%'
END

--Procedimiento Almacenado Para Buscar en la tabla Tratamiento
create procedure [dbo].[Buscar_Tratamiento]
@codtratamiento nvarchar(10)
as
begin
select * from Tratamiento where CodTratamiento like @codtratamiento+ '%'
					
end

--Procedimiento Almacenado Para Buscar en la tabla Vacuna
CREATE PROCEDURE [dbo].[Buscar_Vacuna]
	@CodVacuna nvarchar(10)
AS
BEGIN
	Select * from Vacuna where CodVacuna LIKE @CodVacuna+'%'
END

--Procedimiento Almacenado Para eliminar registros en la tabla Categoria
CREATE PROCEDURE [dbo].[Eliminar_Categoria] 
	@CodCategoria nvarchar(10)
AS
BEGIN
	Delete from Categoria 
	where CodCategoria = @CodCategoria

	select * from Categoria
END

--Procedimiento Almacenado Para eliminar registros en la tabla Cliente
CREATE PROCEDURE [dbo].[Eliminar_Cliente]
	@CodCliente nvarchar(10)

AS
BEGIN
	Delete from Cliente 
	where CodCliente = @CodCliente 
END
--Procedimiento Almacenado Para eliminar registros en la tabla Detalle Factura
create procedure [dbo].[Eliminar_Detalle_Factura]

@idproducto nvarchar(10),
@idfactura nvarchar(10)
as 
begin

delete from DetalleFactura
where IdProducto = @idproducto and IdFactura = @idfactura

end

--Procedimiento Almacenado Para eliminar registros en la tabla Detalle Pago
create procedure [dbo].[Eliminar_Detalle_Pago]

@IdPago nvarchar(10),
@IdServicio nvarchar(10)


as 
begin

delete from DetallePago where IdPago = @IdPago and IdServicio = @IdServicio

end

--Procedimiento Almacenado Para eliminar registros en la tabla Factura
create procedure [dbo].[Eliminar_Factura]

@numerofactura nvarchar(10)

as

begin
delete from Factura where NumeroFactura = @numerofactura

end

--Procedimiento Almacenado Para eliminar registros en la tabla Mascota
CREATE PROCEDURE [dbo].[Eliminar_MAscota]
	 @CodCliente nvarchar (10)
AS
BEGIN
	Delete from	Mascota 
	where CodMascota = @CodCliente
	
	select * from Mascota
END

--Procedimiento Almacenado Para eliminar registros en la tabla Medicina
CREATE PROCEDURE [dbo].[Eliminar_Medicina]
	@CodMedicina nvarchar(10)
AS
BEGIN
	Delete from Medicina 
	where CodMedicina = @CodMedicina
	select * from Medicina
END

--Procedimiento Almacenado Para eliminar registros en la tabla Pago
create procedure [dbo].[Eliminar_Pago]

@codpago nvarchar(10)


as

begin
delete from Pago where CodPago = @codpago

end

--Procedimiento Almacenado Para eliminar registros en la tabla Producto
create procedure [dbo].[Eliminar_Producto]

@codproducto nvarchar(10)


as
begin
delete from Producto where CodProducto = @codproducto
end


--Procedimiento Almacenado Para eliminar registros en la tabla Proveedor
create procedure [dbo].[Eliminar_Proveedor]

@codproveedor nvarchar(10)


as 
begin
delete from Proveedor where CodProveedor = @codproveedor
					
end


--Procedimiento Almacenado Para eliminar registros en la tabla servicio
create procedure [dbo].[Eliminar_Servicio]

@CodServicio nvarchar(10)


as
begin
delete from Servicio where CodServicio = @CodServicio
					
end


--Procedimiento Almacenado Para eliminar registros en la tabla Tipo
create procedure [dbo].[Eliminar_Tipo]
@CodTipo nvarchar(10)
as
begin
delete from Tipo where CodTipo = @CodTipo
					
end

--Procedimiento Almacenado Para eliminar registros en la tabla Tratamiento
create procedure [dbo].[Eliminar_Tratamiento]
@codtratamiento nvarchar(10)
as
begin
delete from Tratamiento where CodTratamiento = @codtratamiento
					
end


--Procedimiento Almacenado Para eliminar registros en la tabla Vacuna
CREATE PROCEDURE [dbo].[Eliminar_Vacuna]
	@CodVacuna nvarchar(10)
AS
BEGIN
	Delete from Vacuna
	where CodVacuna = @CodVacuna
END


--Procedimiento Almacenado Para mostrar los registros en la tabla Categoria
create procedure [dbo].[Mostrar_Categoria]

as
begin
select * from Categoria
end

--Procedimiento Almacenado Para eliminar registros en la tabla Cliente
CREATE PROCEDURE [dbo].[Mostrar_Cliente] 

AS
BEGIN
	select * from Cliente
END


--Procedimiento Almacenado Para eliminar registros en la tabla Detalle Factura
create procedure [dbo].[Mostrar_Detalle_Factura]

@idproducto nvarchar(10),
@idfactura nvarchar(10)
as 
begin

select * from DetalleFactura

end

--Procedimiento Almacenado Para eliminar registros en la tabla Detalle Pago
create procedure [dbo].[Mostrar_Detalle_Pago]

as 
begin

select * from DetallePago

end

--Procedimiento Almacenado Para eliminar registros en la tabla Factura
create procedure [dbo].[Mostrar_Factura]
as

begin
select * from Factura

end

--Procedimiento Almacenado Para eliminar registros en la tabla Mascota
CREATE PROCEDURE [dbo].[Mostrar_Mascota]
AS
BEGIN
	
	SELECT *from Mascota
END


--Procedimiento Almacenado Para eliminar registros en la tabla Medicina
create procedure [dbo].[Mostrar_Medicina]

as

begin
select * from Medicina

end


--Procedimiento Almacenado Para eliminar registros en la tabla Pago
create procedure [dbo].[Mostrar_Pago]




as

begin
select * from Pago

end


--Procedimiento Almacenado Para eliminar registros en la tabla Producto
create procedure [dbo].[Mostrar_Producto]




as
begin
select *  from Producto 
end

--Procedimiento Almacenado Para eliminar registros en la tabla Proveedor
CREATE procedure [dbo].[Mostrar_Proveedor]



as 
begin
select * from Proveedor
					
end

--Procedimiento Almacenado Para eliminar registros en la tabla Servicio
create procedure [dbo].[Mostrar_Servicio]

as
begin
select * from Servicio
					
end


--Procedimiento Almacenado Para eliminar registros en la tabla Tipo
create procedure [dbo].[Mostrar_Tipo]

as
begin
select * from Tipo
					
end

--Procedimiento Almacenado Para eliminar registros en la tabla Tratamiento
create procedure [dbo].[Mostrar_Tratamiento]

as
begin
select * from Tratamiento
					
end


--Procedimiento Almacenado Para eliminar registros en la tabla Vacuna
create procedure [dbo].[Mostrar_Vacuna]
as
begin
select * from Vacuna
end


--Cursor para ordenar la tabla  categoria cuando empiece con la letra A
CREATE Procedure [dbo].[SP_Cursor_Categoria_A]
as
begin
	Declare @CodCategoria nvarchar(10),
	        @Categoria nvarchar(10)

	Declare CursorCategoria cursor for
	select CodCategoria, Categoria
	From Categoria Where Categoria like 'A%'

	Open CursorCategoria
	Fetch Next From CursorCategoria


	While(@@FETCH_STATUS = 0)
	Begin

	print 'Encontro registro en el Cursor'
	print @CodCategoria
	print @Categoria
	FETCH Next FROM CursorCategoria

End


Close CursorCategoria
Deallocate CursorCategoria
end

--Cursor para ordenar  la tabla  categoria cuando empiece con la letra B
Create Procedure [dbo].[SP_Cursor_Categoria_B]
as
begin
	Declare @CodCategoria nvarchar(10),
	        @Categoria nvarchar(10)

	Declare CursorCategoria cursor for
	select CodCategoria, Categoria
	From Categoria Where Categoria like 'B%'

	Open CursorCategoria
	Fetch Next From CursorCategoria


	While(@@FETCH_STATUS = 0)
	Begin

	print 'Encontro registro en el Cursor'
	print @CodCategoria
	print @Categoria
	FETCH Next FROM CursorCategoria

End


Close CursorCategoria
Deallocate CursorCategoria
end


--Cursor para ordenar la tabla  categoria cuando empiece con la letra C
Create Procedure [dbo].[SP_Cursor_Categoria_C]
as
begin
	Declare @CodCategoria nvarchar(10),
	        @Categoria nvarchar(10)

	Declare CursorCategoria cursor for
	select CodCategoria, Categoria
	From Categoria Where Categoria like 'C%'

	Open CursorCategoria
	Fetch Next From CursorCategoria


	While(@@FETCH_STATUS = 0)
	Begin

	print 'Encontro registro en el Cursor'
	print @CodCategoria
	print @Categoria
	FETCH Next FROM CursorCategoria

End


Close CursorCategoria
Deallocate CursorCategoria
end


--Cursor para la tabla Cliente Cuando Cliente inicie con la letra A
Create Procedure [dbo].[SP_Cursor_Cliente_A]
as
begin
	Declare @CodCliente nvarchar(10),
	        @Nombre nvarchar(40),
			@Apellido nvarchar(40),
			@Cedula nvarchar(30),
			@Direccion nvarchar(60),
			@Telefono real

	Declare CursorCliente cursor for
	select CodCliente, Nombre,Apellido,Cedula,Direccion,Telefono
	From Cliente Where Nombre like 'A%'

	Open CursorCliente
	Fetch Next From CursorCliente


	While(@@FETCH_STATUS = 0)
  Begin

    print   @CodCliente 
	print   @Nombre 
	print	@Apellido 
	print	@Cedula 
	print	@Direccion
	print	@Telefono 
	FETCH Next FROM CursorCliente
  end

Close CursorCliente
Deallocate CursorCliente
end


--Cursor para la tabla Cliente Cuando Cliente inicie con la letra B
Create Procedure [dbo].[SP_Cursor_Cliente_B]
as
begin
	Declare @CodCliente nvarchar(10),
	        @Nombre nvarchar(40),
			@Apellido nvarchar(40),
			@Cedula nvarchar(30),
			@Direccion nvarchar(60),
			@Telefono real

	Declare CursorCliente cursor for
	select CodCliente, Nombre,Apellido,Cedula,Direccion,Telefono
	From Cliente Where Nombre like 'B%'

	Open CursorCliente
	Fetch Next From CursorCliente


	While(@@FETCH_STATUS = 0)
  Begin

    print   @CodCliente 
	print   @Nombre 
	print	@Apellido 
	print	@Cedula 
	print	@Direccion
	print	@Telefono 
	FETCH Next FROM CursorCliente
  end

Close CursorCliente
Deallocate CursorCliente
end

--Cursor para la tabla Cliente Cuando Cliente inicie con la letra C
Create Procedure [dbo].[SP_Cursor_Cliente_C]
as
begin
	Declare @CodCliente nvarchar(10),
	        @Nombre nvarchar(40),
			@Apellido nvarchar(40),
			@Cedula nvarchar(30),
			@Direccion nvarchar(60),
			@Telefono real

	Declare CursorCliente cursor for
	select CodCliente, Nombre,Apellido,Cedula,Direccion,Telefono
	From Cliente Where Nombre like 'C%'

	Open CursorCliente
	Fetch Next From CursorCliente


	While(@@FETCH_STATUS = 0)
  Begin

    print   @CodCliente 
	print   @Nombre 
	print	@Apellido 
	print	@Cedula 
	print	@Direccion
	print	@Telefono 
	FETCH Next FROM CursorCliente
  end

Close CursorCliente
Deallocate CursorCliente
end

--Cursor para la tabla DetalleFactura Cuando IdFactura inicie con la letra A
Create Procedure [dbo].[SP_Cursor_DetalleFactura_A]
as
begin
	Declare @IDproducto nvarchar(10),
	        @Idfactura nvarchar(40),
			@Cantidad real,
			@IR real,
			@Total real

	Declare CursorDetalleFactura cursor for
	select IdProducto,IdFactura,Cantidad,IR,Total
	From DetalleFactura Where IdFactura like 'A%'

	Open CursorDetalleFactura
	Fetch Next From CursorDetalleFactura


	While(@@FETCH_STATUS = 0)
  Begin

   print @IDproducto 
   print @Idfactura 
   print @Cantidad 
   print @IR 
   print @Total 

	FETCH Next FROM CursorDetalleFactura
  end

Close CursorDetalleFactura
Deallocate CursorDetalleFactura
end

--Cursor para la tabla DetalleFactura Cuando IdFactura inicie con la letra B
Create Procedure [dbo].[SP_Cursor_DetalleFactura_B]
as
begin
	Declare @IDproducto nvarchar(10),
	        @Idfactura nvarchar(40),
			@Cantidad real,
			@IR real,
			@Total real

	Declare CursorDetalleFactura cursor for
	select IdProducto,IdFactura,Cantidad,IR,Total
	From DetalleFactura Where IdFactura like 'B%'

	Open CursorDetalleFactura
	Fetch Next From CursorDetalleFactura


	While(@@FETCH_STATUS = 0)
  Begin

   print @IDproducto 
   print @Idfactura 
   print @Cantidad 
   print @IR 
   print @Total 

	FETCH Next FROM CursorDetalleFactura
  end

Close CursorDetalleFactura
Deallocate CursorDetalleFactura
end

--Cursor para la tabla DetalleFactura Cuando IdFactura inicie con la letra C
Create Procedure [dbo].[SP_Cursor_DetalleFactura_C]
as
begin
	Declare @IDproducto nvarchar(10),
	        @Idfactura nvarchar(40),
			@Cantidad real,
			@IR real,
			@Total real

	Declare CursorDetalleFactura cursor for
	select IdProducto,IdFactura,Cantidad,IR,Total
	From DetalleFactura Where IdFactura like 'C%'

	Open CursorDetalleFactura
	Fetch Next From CursorDetalleFactura


	While(@@FETCH_STATUS = 0)
  Begin

   print @IDproducto 
   print @Idfactura 
   print @Cantidad 
   print @IR 
   print @Total 

	FETCH Next FROM CursorDetalleFactura
  end

Close CursorDetalleFactura
Deallocate CursorDetalleFactura
end


--Cursor para la tabla DetallePago Cuando IdServicio inicie con la letra A
Create Procedure [dbo].[SP_Cursor_DetallePago_A]
as
begin
	Declare @IdPago nvarchar(10),
			@IdServicio nvarchar(10),
			@Precio real

	Declare CursorDetallePago cursor for
	select IdPago,IdServicio,Precio
	From DetallePago Where IdServicio like 'A%'

	Open CursorDetallePago
	Fetch Next From CursorDetallePago


	While(@@FETCH_STATUS = 0)
  Begin

   print @IdPago
   print @IdServicio
   print @Precio

	FETCH Next FROM CursorDetallePago
  end

Close CursorDetallePago
Deallocate CursorDetallePago
end


--Cursor para la tabla DetalleFactura Cuando IdFactura inicie con la letra B
Create Procedure [dbo].[SP_Cursor_DetallePago_B]
as
begin
	Declare @IdPago nvarchar(10),
			@IdServicio nvarchar(10),
			@Precio real

	Declare CursorDetallePago cursor for
	select IdPago,IdServicio,Precio
	From DetallePago Where IdServicio like 'B%'

	Open CursorDetallePago
	Fetch Next From CursorDetallePago


	While(@@FETCH_STATUS = 0)
  Begin

   print @IdPago
   print @IdServicio
   print @Precio

	FETCH Next FROM CursorDetallePago
  end

Close CursorDetallePago
Deallocate CursorDetallePago
end

--Cursor para la tabla DetalleFactura Cuando IdFactura inicie con la letra C
Create Procedure [dbo].[SP_Cursor_DetallePago_C]
as
begin
	Declare @IdPago nvarchar(10),
			@IdServicio nvarchar(10),
			@Precio real

	Declare CursorDetallePago cursor for
	select IdPago,IdServicio,Precio
	From DetallePago Where IdServicio like 'C%'

	Open CursorDetallePago
	Fetch Next From CursorDetallePago


	While(@@FETCH_STATUS = 0)
  Begin

   print @IdPago
   print @IdServicio
   print @Precio

	FETCH Next FROM CursorDetallePago
  end

Close CursorDetallePago
Deallocate CursorDetallePago
end

--Cursor para la tabla Factura Cuando Numerofactura inicie con el numero 2
Create Procedure [dbo].[SP_Cursor_Factura_Dos]
as
begin
	Declare @NumeroFactura nvarchar(10),
			@Fecha nvarchar(15),
			@IdProveedor nvarchar(10),
			@IdMedicina nvarchar(10)

	Declare CursorFactura cursor for
	select NumeroFactura,Fecha,IdProveedor,IdMedicina
	From Factura Where NumeroFactura  like '2%'

	Open CursorFactura
	Fetch Next From CursorFactura


	While(@@FETCH_STATUS = 0)
  Begin

   print @NumeroFactura
   print @Fecha
   print @IdProveedor
   print @IdMedicina

	FETCH Next FROM CursorFactura
  end

Close CursorFactura
Deallocate CursorFactura
end


--Cursor para la tabla Factura Cuando Numerofactura inicie con el numero 3
Create Procedure [dbo].[SP_Cursor_Factura_Tres]
as
begin
	Declare @NumeroFactura nvarchar(10),
			@Fecha nvarchar(15),
			@IdProveedor nvarchar(10),
			@IdMedicina nvarchar(10)

	Declare CursorFactura cursor for
	select NumeroFactura,Fecha,IdProveedor,IdMedicina
	From Factura Where NumeroFactura  like '3%'

	Open CursorFactura
	Fetch Next From CursorFactura


	While(@@FETCH_STATUS = 0)
  Begin

   print @NumeroFactura
   print @Fecha
   print @IdProveedor
   print @IdMedicina

	FETCH Next FROM CursorFactura
  end

Close CursorFactura
Deallocate CursorFactura
end


--Cursor para la tabla Factura Cuando Numerofactura inicie con el numero 1
Create Procedure [dbo].[SP_Cursor_Factura_Uno]
as
begin
	Declare @NumeroFactura nvarchar(10),
			@Fecha nvarchar(15),
			@IdProveedor nvarchar(10),
			@IdMedicina nvarchar(10)

	Declare CursorFactura cursor for
	select NumeroFactura,Fecha,IdProveedor,IdMedicina
	From Factura Where NumeroFactura  like '1%'

	Open CursorFactura
	Fetch Next From CursorFactura


	While(@@FETCH_STATUS = 0)
  Begin

   print @NumeroFactura
   print @Fecha
   print @IdProveedor
   print @IdMedicina

	FETCH Next FROM CursorFactura
  end

Close CursorFactura
Deallocate CursorFactura
end

--Cursor para la tabla Mascota Cuando Nombre inicie con la letra A
Create Procedure [dbo].[SP_Cursor_Mascota_A]
as
begin
	Declare @CodMascota nvarchar(10),
			@Nombre nvarchar(30),
			@IdTipo nvarchar(60),
			@Raza nvarchar (30),
			@Peso real,
			@IdCliente nvarchar(10),
			@TipoServicio nvarchar(10)

	Declare CursorMascota cursor for
	select CodMascota,Nombre,IdTipo,Raza,IdCliente,TipoServicio
	From Mascota Where Nombre  like 'A%'

	Open CursorMascota
	Fetch Next From CursorMascota


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodMascota
   print @Nombre
   print @IdTipo
   print @Raza
   print @Peso
   print @IdCliente
   print @TipoServicio

	FETCH Next FROM CursorMascota
  end

Close CursorMascota
Deallocate CursorMascota
end

--Cursor para la tabla Mascota Cuando Nombre inicie con la letra B
Create Procedure [dbo].[SP_Cursor_Mascota_B]
as
begin
	Declare @CodMascota nvarchar(10),
			@Nombre nvarchar(30),
			@IdTipo nvarchar(60),
			@Raza nvarchar (30),
			@Peso real,
			@IdCliente nvarchar(10),
			@TipoServicio nvarchar(10)

	Declare CursorMascota cursor for
	select CodMascota,Nombre,IdTipo,Raza,IdCliente,TipoServicio
	From Mascota Where Nombre  like 'B%'

	Open CursorMascota
	Fetch Next From CursorMascota


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodMascota
   print @Nombre
   print @IdTipo
   print @Raza
   print @Peso
   print @IdCliente
   print @TipoServicio

	FETCH Next FROM CursorMascota
  end

Close CursorMascota
Deallocate CursorMascota
end


--Cursor para la tabla Mascota Cuando Nombre inicie con la letra C
Create Procedure [dbo].[SP_Cursor_Mascota_C]
as
begin
	Declare @CodMascota nvarchar(10),
			@Nombre nvarchar(30),
			@IdTipo nvarchar(60),
			@Raza nvarchar (30),
			@Peso real,
			@IdCliente nvarchar(10),
			@TipoServicio nvarchar(10)

	Declare CursorMascota cursor for
	select CodMascota,Nombre,IdTipo,Raza,IdCliente,TipoServicio
	From Mascota Where Nombre  like 'C%'

	Open CursorMascota
	Fetch Next From CursorMascota


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodMascota
   print @Nombre
   print @IdTipo
   print @Raza
   print @Peso
   print @IdCliente
   print @TipoServicio

	FETCH Next FROM CursorMascota
  end

Close CursorMascota
Deallocate CursorMascota
end


--Cursor para la tabla Medicina Cuando Nombre inicie con la letra A
Create Procedure [dbo].[SP_Cursor_Medicina_A]
as
begin
	Declare @CodMedicina nvarchar(10),
			@Nombre nvarchar(30),
			@Precio real,
			@FechaVencimeinto nvarchar(10)

	Declare CursorMedicina cursor for
	select CodMedicina,Nombre,Precio,fechaVencimeinto
	From Medicina Where Nombre  like 'A%'

	Open CursorMedicina
	Fetch Next From CursorMedicina


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodMedicina
   print @Nombre
   print @Precio
   print @FechaVencimeinto

	FETCH Next FROM CursorMedicina
  end

Close CursorMedicina
Deallocate CursorMedicina
end

--Cursor para la tabla Medicina Cuando Nombre inicie con la letra B
Create Procedure [dbo].[SP_Cursor_Medicina_B]
as
begin
	Declare @CodMedicina nvarchar(10),
			@Nombre nvarchar(30),
			@Precio real,
			@FechaVencimeinto nvarchar(10)

	Declare CursorMedicina cursor for
	select CodMedicina,Nombre,Precio,fechaVencimeinto
	From Medicina Where Nombre  like 'B%'

	Open CursorMedicina
	Fetch Next From CursorMedicina


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodMedicina
   print @Nombre
   print @Precio
   print @FechaVencimeinto

	FETCH Next FROM CursorMedicina
  end

Close CursorMedicina
Deallocate CursorMedicina
end


--Cursor para la tabla Medicina Cuando Nombre inicie con la letra C
Create Procedure [dbo].[SP_Cursor_Medicina_C]
as
begin
	Declare @CodMedicina nvarchar(10),
			@Nombre nvarchar(30),
			@Precio real,
			@FechaVencimeinto nvarchar(10)

	Declare CursorMedicina cursor for
	select CodMedicina,Nombre,Precio,fechaVencimeinto
	From Medicina Where Nombre  like 'C%'

	Open CursorMedicina
	Fetch Next From CursorMedicina


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodMedicina
   print @Nombre
   print @Precio
   print @FechaVencimeinto

	FETCH Next FROM CursorMedicina
  end

Close CursorMedicina
Deallocate CursorMedicina
end

--Cursor para la tabla pago Cuando Codpago inicia con numero 2
Create Procedure [dbo].[SP_Cursor_Pago_Dos]
as
begin
	Declare @CodPago nvarchar(10),
			@Fecha nvarchar(14),
			@IdCliente nvarchar(10)

	Declare CursorPago cursor for
	select CodPago,Fecha,IdCliente
	From Pago Where CodPago  like '2%'

	Open CursorPago
	Fetch Next From CursorPago


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodPago
   print @Fecha
   print @IdCliente

	FETCH Next FROM CursorPago
  end

Close CursorPago
Deallocate CursorPago
end


--Cursor para la tabla pago Cuando Codpago inicia con numero 3
Create Procedure [dbo].[SP_Cursor_Pago_tres]
as
begin
	Declare @CodPago nvarchar(10),
			@Fecha nvarchar(14),
			@IdCliente nvarchar(10)

	Declare CursorPago cursor for
	select CodPago,Fecha,IdCliente
	From Pago Where CodPago  like '3%'

	Open CursorPago
	Fetch Next From CursorPago


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodPago
   print @Fecha
   print @IdCliente

	FETCH Next FROM CursorPago
  end

Close CursorPago
Deallocate CursorPago
end



--Cursor para la tabla pago Cuando Codpago inicia con numero 1
Create Procedure [dbo].[SP_Cursor_Pago_Uno]
as
begin
	Declare @CodPago nvarchar(10),
			@Fecha nvarchar(14),
			@IdCliente nvarchar(10)

	Declare CursorPago cursor for
	select CodPago,Fecha,IdCliente
	From Pago Where CodPago  like '1%'

	Open CursorPago
	Fetch Next From CursorPago


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodPago
   print @Fecha
   print @IdCliente

	FETCH Next FROM CursorPago
  end

Close CursorPago
Deallocate CursorPago
end


--Cursor para la tabla Producto Cuando Nombre inicia con la letra A
Create Procedure [dbo].[SP_Cursor_Producto_A]
as
begin
	Declare @CodProducto nvarchar(10),
			@Nombre nvarchar(30),
			@PrecioCompra real,
			@PrecioVenta real,
			@Cantidad real,
			@IdTipo nvarchar(60)

	Declare CursorProducto cursor for
	select CodProducto,Nombre,PrecioCompra,PrecioVenta,Cantidad,IdTipo
	From Producto Where Nombre  like 'A%'

	Open CursorProducto
	Fetch Next From CursorProducto


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodProducto
   print @Nombre
   print @PrecioCompra
   print @PrecioVenta
   print @Cantidad
   print @idTipo

	FETCH Next FROM CursorProducto
  end

Close CursorProducto
Deallocate CursorProducto
end


--Cursor para la tabla Producto Cuando Nombre inicia con la letra B
Create Procedure [dbo].[SP_Cursor_Producto_B]
as
begin
	Declare @CodProducto nvarchar(10),
			@Nombre nvarchar(30),
			@PrecioCompra real,
			@PrecioVenta real,
			@Cantidad real,
			@IdTipo nvarchar(60)

	Declare CursorProducto cursor for
	select CodProducto,Nombre,PrecioCompra,PrecioVenta,Cantidad,IdTipo
	From Producto Where Nombre  like 'B%'

	Open CursorProducto
	Fetch Next From CursorProducto


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodProducto
   print @Nombre
   print @PrecioCompra
   print @PrecioVenta
   print @Cantidad
   print @idTipo

	FETCH Next FROM CursorProducto
  end

Close CursorProducto
Deallocate CursorProducto
end

--Cursor para la tabla Producto Cuando Nombre inicia con la letra C
Create Procedure [dbo].[SP_Cursor_Producto_C]
as
begin
	Declare @CodProducto nvarchar(10),
			@Nombre nvarchar(30),
			@PrecioCompra real,
			@PrecioVenta real,
			@Cantidad real,
			@IdTipo nvarchar(60)

	Declare CursorProducto cursor for
	select CodProducto,Nombre,PrecioCompra,PrecioVenta,Cantidad,IdTipo
	From Producto Where Nombre  like 'C%'

	Open CursorProducto
	Fetch Next From CursorProducto


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodProducto
   print @Nombre
   print @PrecioCompra
   print @PrecioVenta
   print @Cantidad
   print @idTipo

	FETCH Next FROM CursorProducto
  end

Close CursorProducto
Deallocate CursorProducto
end

--Cursor para la tabla Proveedor Cuando Nombre inicia con la letra A
Create Procedure [dbo].[SP_Cursor_Proveedor_A]
as
begin
	Declare @CodProveedor nvarchar(10),
			@Nombre nvarchar(30),
			@Apellido nvarchar(30),
			@Direccion nvarchar(80),
			@Telefono real

	Declare CursorProveedor cursor for
	select CodProveedor,Nombre,Apellido,Direccion,Telefono
	From Proveedor Where Nombre  like 'A%'

	Open CursorProveedor
	Fetch Next From CursorProveedor


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodProveedor
   print @Nombre
   print @Apellido
   print @Direccion
   print @Telefono

	FETCH Next FROM CursorProveedor
  end

Close CursorProveedor
Deallocate CursorProveedor
end

--Cursor para la tabla Proveedor Cuando Nombre inicia con la letra B
Create Procedure [dbo].[SP_Cursor_Proveedor_B]
as
begin
	Declare @CodProveedor nvarchar(10),
			@Nombre nvarchar(30),
			@Apellido nvarchar(30),
			@Direccion nvarchar(80),
			@Telefono real

	Declare CursorProveedor cursor for
	select CodProveedor,Nombre,Apellido,Direccion,Telefono
	From Proveedor Where Nombre  like 'B%'

	Open CursorProveedor
	Fetch Next From CursorProveedor


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodProveedor
   print @Nombre
   print @Apellido
   print @Direccion
   print @Telefono

	FETCH Next FROM CursorProveedor
  end

Close CursorProveedor
Deallocate CursorProveedor
end


--Cursor para la tabla Proveedor Cuando Nombre inicia con la letra C
Create Procedure [dbo].[SP_Cursor_Proveedor_C]
as
begin
	Declare @CodProveedor nvarchar(10),
			@Nombre nvarchar(30),
			@Apellido nvarchar(30),
			@Direccion nvarchar(80),
			@Telefono real

	Declare CursorProveedor cursor for
	select CodProveedor,Nombre,Apellido,Direccion,Telefono
	From Proveedor Where Nombre  like 'C%'

	Open CursorProveedor
	Fetch Next From CursorProveedor


	While(@@FETCH_STATUS = 0)
  Begin

   print @CodProveedor
   print @Nombre
   print @Apellido
   print @Direccion
   print @Telefono

	FETCH Next FROM CursorProveedor
  end

Close CursorProveedor
Deallocate CursorProveedor
end


--Cursor para la tabla Servicio Cuando Descripcion inicia con la letra A
create procedure [dbo].[SP_Cursor_Servicio_A]
As
Begin

declare @Servicio nvarchar(10),
		@Descripcion nvarchar(60),
		@Precio real

Declare CursorServicio Cursor for
Select Servicio,Descripcion,Precio
from Servicio where Descripcion like 'A%'

open CursorServicio
Fetch Next From CursorServicio

while(@@FETCH_STATUS = 0)
begin 

	print @Servicio
	print @Descripcion
	Print @Precio
	Fetch Next From CursorServicio

end

close CursorServicio
Deallocate CursorServicio

End


--Cursor para la tabla Servicio Cuando Descripcion inicia con la letra B
create procedure [dbo].[SP_Cursor_Servicio_B]
As
Begin

declare @Servicio nvarchar(10),
		@Descripcion nvarchar(60),
		@Precio real

Declare CursorServicio Cursor for
Select Servicio,Descripcion,Precio
from Servicio where Descripcion like 'B%'

open CursorServicio
Fetch Next From CursorServicio

while(@@FETCH_STATUS = 0)
begin 

	print @Servicio
	print @Descripcion
	Print @Precio
	Fetch Next From CursorServicio

end

close CursorServicio
Deallocate CursorServicio

End


--Cursor para la tabla Servicio Cuando Descripcion inicia con la letra C
create procedure [dbo].[SP_Cursor_Servicio_C]
As
Begin

declare @Servicio nvarchar(10),
		@Descripcion nvarchar(60),
		@Precio real

Declare CursorServicio Cursor for
Select Servicio,Descripcion,Precio
from Servicio where Descripcion like 'C%'

open CursorServicio
Fetch Next From CursorServicio

while(@@FETCH_STATUS = 0)
begin 

	print @Servicio
	print @Descripcion
	Print @Precio
	Fetch Next From CursorServicio

end

close CursorServicio
Deallocate CursorServicio

End

--Cursor para la tabla Tipo Cuando Tipo inicia con la letra G
create procedure [dbo].[SP_Cursor_Tipo_G]
As
Begin

declare @Tipo nvarchar(60)

Declare CursorTipo Cursor for
Select Tipo
from Tipo where Tipo like 'G%'

open CursorTipo
Fetch Next From CursorTipo

while(@@FETCH_STATUS = 0)
begin 

	print @Tipo
	Fetch Next From CursorTipo

end

close CursorTipo
Deallocate CursorTipo

End


--Cursor para la tabla Tipo Cuando Tipo inicia con la letra P
create procedure [dbo].[SP_Cursor_Tipo_P]
As
Begin

declare @Tipo nvarchar(60)

Declare CursorTipo Cursor for
Select Tipo
from Tipo where Tipo like 'P%'

open CursorTipo
Fetch Next From CursorTipo

while(@@FETCH_STATUS = 0)
begin 

	print @Tipo
	Fetch Next From CursorTipo

end

close CursorTipo
Deallocate CursorTipo

End


--Cursor para la tabla Tipo Cuando Tipo inicia con la letra V
create procedure [dbo].[SP_Cursor_Tipo_V]
As
Begin

declare @Tipo nvarchar(60)

Declare CursorTipo Cursor for
Select Tipo
from Tipo where Tipo like 'V%'

open CursorTipo
Fetch Next From CursorTipo

while(@@FETCH_STATUS = 0)
begin 

	print @Tipo
	Fetch Next From CursorTipo

end

close CursorTipo
Deallocate CursorTipo

End

--Cursor para la tabla Tratamiento  cuando tratamiento inicia con la letra A
create procedure [dbo].[SP_Cursor_Tratamiento_A]
As
Begin

declare @CodTratamiento nvarchar(60),
		@Tratamiento nvarchar(29),
		@Descripcion nvarchar(60),
		@Costo real

Declare CursorTratamiento Cursor for
Select CodTratamiento,Tratamiento,Descripcion,Costo
from Tratamiento where Tratamiento like 'A%'

open CursorTratamiento
Fetch Next From CursorTratamiento

while(@@FETCH_STATUS = 0)
begin 

	print @CodTratamiento
	print @Tratamiento
	print @Descripcion
	print @Costo
	Fetch Next From CursorTratamiento

end

close CursorTratamiento
Deallocate CursorTratamiento

End

--Cursor para la tabla Tratamiento  cuando tratamiento inicia con la letra B
create procedure [dbo].[SP_Cursor_Tratamiento_B]
As
Begin

declare @CodTratamiento nvarchar(60),
		@Tratamiento nvarchar(29),
		@Descripcion nvarchar(60),
		@Costo real

Declare CursorTratamiento Cursor for
Select CodTratamiento,Tratamiento,Descripcion,Costo
from Tratamiento where Tratamiento like 'B%'

open CursorTratamiento
Fetch Next From CursorTratamiento

while(@@FETCH_STATUS = 0)
begin 

	print @CodTratamiento
	print @Tratamiento
	print @Descripcion
	print @Costo
	Fetch Next From CursorTratamiento

end

close CursorTratamiento
Deallocate CursorTratamiento

End


--Cursor para la tabla Tratamiento  cuando tratamiento inicia con la letra C
create procedure [dbo].[SP_Cursor_Tratamiento_P]
As
Begin

declare @CodTratamiento nvarchar(60),
		@Tratamiento nvarchar(29),
		@Descripcion nvarchar(60),
		@Costo real

Declare CursorTratamiento Cursor for
Select CodTratamiento,Tratamiento,Descripcion,Costo
from Tratamiento where Tratamiento like 'P%'

open CursorTratamiento
Fetch Next From CursorTratamiento

while(@@FETCH_STATUS = 0)
begin 

	print @CodTratamiento
	print @Tratamiento
	print @Descripcion
	print @Costo
	Fetch Next From CursorTratamiento

end

close CursorTratamiento
Deallocate CursorTratamiento

End

--Cursor para la tabla Vacuna cuando Descripcion inicia con la letra A
create procedure [dbo].[SP_Cursor_Vacuna_A]
As
Begin

declare @CodVacuna nvarchar(10),
		@Fecha nvarchar(10),
		@NumeroVacuna int,
		@Descripcion nvarchar(60),
		@IdMascota nvarchar(10),
		@IdCliente nvarchar(10)

Declare CursorVacuna Cursor for
Select CodVacuna,Fecha,NumeroVacuna,Descripcion,IdMascota,IdCliente
from Vacuna where Descripcion like 'A%'

open CursorVacuna
Fetch Next From CursorVacuna

while(@@FETCH_STATUS = 0)
begin 

	print @CodVacuna
	print @Fecha
	print @NumeroVacuna
	print @Descripcion
	print @IdMascota
	print @IdCliente
	Fetch Next From CursorVacuna

end

close CursorVacuna
Deallocate CursorVacuna

End


--Cursor para la tabla Vacuna cuando Descripcion inicia con la letra B
create procedure [dbo].[SP_Cursor_Vacuna_B]
As
Begin

declare @CodVacuna nvarchar(10),
		@Fecha nvarchar(10),
		@NumeroVacuna int,
		@Descripcion nvarchar(60),
		@IdMascota nvarchar(10),
		@IdCliente nvarchar(10)

Declare CursorVacuna Cursor for
Select CodVacuna,Fecha,NumeroVacuna,Descripcion,IdMascota,IdCliente
from Vacuna where Descripcion like 'B%'

open CursorVacuna
Fetch Next From CursorVacuna

while(@@FETCH_STATUS = 0)
begin 

	print @CodVacuna
	print @Fecha
	print @NumeroVacuna
	print @Descripcion
	print @IdMascota
	print @IdCliente
	Fetch Next From CursorVacuna

end

close CursorVacuna
Deallocate CursorVacuna

End


--Cursor para la tabla Vacuna cuando Descripcion inicia con la letra C
create procedure [dbo].[SP_Cursor_Vacuna_C]
As
Begin

declare @CodVacuna nvarchar(10),
		@Fecha nvarchar(10),
		@NumeroVacuna int,
		@Descripcion nvarchar(60),
		@IdMascota nvarchar(10),
		@IdCliente nvarchar(10)

Declare CursorVacuna Cursor for
Select CodVacuna,Fecha,NumeroVacuna,Descripcion,IdMascota,IdCliente
from Vacuna where Descripcion like 'C%'

open CursorVacuna
Fetch Next From CursorVacuna

while(@@FETCH_STATUS = 0)
begin 

	print @CodVacuna
	print @Fecha
	print @NumeroVacuna
	print @Descripcion
	print @IdMascota
	print @IdCliente
	Fetch Next From CursorVacuna

end

close CursorVacuna
Deallocate CursorVacuna

End


--Creacion del trigger para Actualizar Cliente
Create Trigger [dbo].[TR_Cliente_Actualizar]
on [dbo].[Cliente] for update
As
begin
declare @Codigo nvarchar(10)
select @Codigo = CodCliente from inserted
insert into Historial values(GETDATE(),@Codigo,'Registro Actualizado', SYSTEM_USER)
end

--Creacion del trigger para Eliminar Cliente
Create Trigger [dbo].[TR_Cliente_Eliminar]
on [dbo].[Cliente] for delete
As
begin
declare @Codigo nvarchar(10)
select @Codigo = CodCliente from deleted
insert into Historial values(GETDATE(),@Codigo,'Registro Eliminado', SYSTEM_USER)
end


--Creacion del trigger para Insertar Cliente
Create Trigger [dbo].[TR_Cliente_Insertado]
on [dbo].[Cliente] for insert
As

begin
declare @Codigo nvarchar(10)
select @Codigo = CodCliente from inserted
insert into Historial values(GETDATE(),@Codigo,'Registro Insertado', SYSTEM_USER)
end

--Creacion del trigger para Actualizar Factura
Create Trigger [dbo].[TR_Factura_Actualizar]
on [dbo].[Factura] for update
As
begin
declare @Codigo nvarchar(10)
select @Codigo = NumeroFactura from inserted
insert into Historial values(GETDATE(),@Codigo,'Registro Actualizado', SYSTEM_USER)
end

--Creacion del trigger para Eliminar Factura
Create Trigger [dbo].[TR_Factura_Eliminar]
on [dbo].[Factura] for delete
As
begin
declare @Codigo nvarchar(10)
select @Codigo = NumeroFactura from deleted
insert into Historial values(GETDATE(),@Codigo,'Registro Eliminado', SYSTEM_USER)
end

--Creacion del trigger para Insertar Factura
Create Trigger [dbo].[TR_Factura_Insertado]
on [dbo].[Factura] for insert
As

begin
declare @Codigo nvarchar(10)
select @Codigo = NumeroFactura from inserted
insert into Historial values(GETDATE(),@Codigo,'Registro Insertado', SYSTEM_USER)
end

--Creacion del trigger Actualizar Mascota
Create Trigger [dbo].[TR_Mascota_Actualizar]
on [dbo].[Mascota] for update
As
begin
declare @Codigo nvarchar(10)
select @Codigo = CodMascota from inserted
insert into Historial values(GETDATE(),@Codigo,'Registro Actualizado', SYSTEM_USER)
end

--Creacion del trigger Eliminar Mascota
Create Trigger [dbo].[TR_Mascota_Eliminar]
on  [dbo].[Mascota] for delete
As
begin
declare @Codigo nvarchar(10)
select @Codigo = CodMascota from deleted
insert into Historial values(GETDATE(),@Codigo,'Registro Eliminado', SYSTEM_USER)
end

--Creacion del trigger Insertar Mascota
Create Trigger [dbo].[TR_Mascota_Insertado]
on [dbo].[Mascota] for insert
As

begin
declare @Codigo nvarchar(10)
select @Codigo = CodMascota from inserted
insert into Historial values(GETDATE(),@Codigo,'Registro Insertado', SYSTEM_USER)
end


--Creacion del trigger Insertar Medicina
 Create Trigger [dbo].[TR_Medicina_Actualizar]
on [dbo].[Medicina] for update
As
begin
declare @Codigo nvarchar(10)
select @Codigo = CodMedicina from inserted
insert into Historial values(GETDATE(),@Codigo,'Registro Actualizado', SYSTEM_USER)
end


--Creacion del trigger Eliminar Medicina
Create Trigger [dbo].[TR_Medicina_Eliminar]
on [dbo].[Medicina] for delete
As
begin
declare @Codigo nvarchar(10)
select @Codigo = CodMedicina from deleted
insert into Historial values(GETDATE(),@Codigo,'Registro Eliminado', SYSTEM_USER)
end


--Creacion del trigger Insertar Medicina
Create Trigger [dbo].[TR_Medicina_Insertado]
on [dbo].[Medicina] for insert
As

begin
declare @Codigo nvarchar(10)
select @Codigo = CodMedicina from inserted
insert into Historial values(GETDATE(),@Codigo,'Registro Insertado', SYSTEM_USER)
end

--Creacion del trigger Actualizar Pago
Create Trigger [dbo].[TR_Pago_Actualizar]
on  [dbo].[Pago] for update
As
begin
declare @Codigo nvarchar(10)
select @Codigo = CodPago from inserted
insert into Historial values(GETDATE(),@Codigo,'Registro Actualizado', SYSTEM_USER)
end

--Creacion del trigger Eliminar Pago
Create Trigger [dbo].[TR_Producto_Eliminar]
on [dbo].[Producto] for delete
As
begin
declare @Codigo nvarchar(10)
select @Codigo = CodProducto from deleted
insert into Historial values(GETDATE(),@Codigo,'Registro Eliminado', SYSTEM_USER)
end


--Creacion del trigger Insertar Pago
Create Trigger [dbo].[TR_Producto_Insertado]
on [dbo].[Producto] for insert
As

begin
declare @Codigo nvarchar(10)
select @Codigo = CodProducto from inserted
insert into Historial values(GETDATE(),@Codigo,'Registro Insertado', SYSTEM_USER)
end


--Creacion del trigger Actualizar Producto
Create Trigger [dbo].[TR_Producto_Actualizar]
on  [dbo].[Producto] for update
As
begin
declare @Codigo nvarchar(10)
select @Codigo = CodProducto from inserted
insert into Historial values(GETDATE(),@Codigo,'Registro Actualizado', SYSTEM_USER)
end

--Creacion del trigger Eliminar Producto
Create Trigger [dbo].[TR_Producto_Eliminar]
on [dbo].[Producto] for delete
As
begin
declare @Codigo nvarchar(10)
select @Codigo = CodProducto from deleted
insert into Historial values(GETDATE(),@Codigo,'Registro Eliminado', SYSTEM_USER)
end

--Creacion del trigger Insertar Producto
Create Trigger [dbo].[TR_Producto_Insertado]s
on [dbo].[Producto] for insert
As

begin
declare @Codigo nvarchar(10)
select @Codigo = CodProducto from inserted
insert into Historial values(GETDATE(),@Codigo,'Registro Insertado', SYSTEM_USER)
end
