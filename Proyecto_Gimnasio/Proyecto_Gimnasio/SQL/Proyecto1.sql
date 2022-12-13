Create database Gimnasio

use Gimnasio


--create table Usuarios(

--Codigo int identity (1,1),
--Nombre nvarchar (55)null,
--Email varchar(30)not null,
--Clave varchar (30)null,
--tipo varchar(50) null,
--Constraint PK_CodigoU primary key (Codigo)
--)

create table Clientes(

Codigo int identity (1,1),
Nombre nvarchar (55) not null,
Apellido varchar(30),
Telefono varchar (30),
Clave varchar (30)null,
tipo varchar(50) null,
Email varchar(30)not null,
Constraint PK_CodigoCliente primary key (Codigo)
)

create table Direcciones(

Codigo int identity (1,1),
Codigo_Cliente int,
Codigo_Provincia int,
Codigo_Canton int,
Codigo_Distrito int,
Constraint PK_CodigoDirecciones primary key (Codigo),

Constraint FK_CodigoClientD Foreign key (Codigo_Cliente) references Clientes (Codigo),
Constraint FK_CodigoProvinciaD Foreign key (Codigo_Provincia) references Provincia (Codigo),
Constraint FK_CodigoCantonD Foreign key (Codigo_Canton) references Canton (Codigo),
Constraint FK_CodigoDistritoD Foreign key (Codigo_Distrito) references Distrito (Codigo)
)

create table Mae_Factura(

NFactura int identity (1,1),
Fecha date null constraint Def_fecha default getdate(),
Codigo_Cliente int,
Total Float default 0,
IV_Total Float default 0,
Constraint FK_CodigoC Foreign key (Codigo_Cliente) references Clientes (Codigo),
Constraint PK_NFactura primary key (NFactura)
)


create table DET_Factura (

Codigo int identity (1,1),
NFactura int,
Codigo_Producto int,
cantidad int,
Precio_Unitario float,
IV float,
Constraint FK_CodigoNFact Foreign key (NFactura) references Mae_Factura (NFactura),
Constraint PK_CodigoDET primary key (Codigo)

)

create table Provincia(

Codigo int identity (1,1),
Nombre nvarchar (55),
Constraint PK_CodigoProvincia primary key (Codigo)
)


create table Canton(

Codigo int identity (1,1),
Nombre nvarchar (55),
Codigo_Provincia int,
Constraint FK_CodigoP Foreign key (Codigo_Provincia) references Provincia (Codigo),
Constraint PK_CodigoCanton primary key (Codigo)
)


create table Distrito(

Codigo int identity (1,1),
Nombre nvarchar (55),
Codigo_Canton int,
Constraint FK_CodigoD Foreign key (Codigo_Canton) references Canton (Codigo),
Constraint PK_CodigoD primary key (Codigo)
)


create table Producto(

Codigo int identity (1,1),
Nombre nvarchar (55),
Precio Float default 0,
Constraint PK_CodigoProducto primary key (Codigo)
)



----------Procedimientos almacenados----------

----------Procedimientos Usuarios----------
---------------------------------------------------------------------------------------------
create procedure consultaUsuarios
as
begin
select * from Clientes
end
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
create procedure borrarUsuarios
@email varchar(30)
 as 
 begin
 delete Clientes where Email = @email
 end
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
Create procedure ingresarUsuarios
@email varchar(30),
@clave varchar(30)='',
@nombre varchar(50) = '',
@tipo varchar (50) = 'Regular',
@apellido varchar (50) = '',
@telefono varchar (30)
  as
	begin
	   insert into Clientes (Nombre,Apellido,Telefono,Clave,Tipo,Email) values  (@nombre,@apellido,@telefono,@clave,@tipo,@email)
	end
---------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
create procedure ActualizarUsuarios
@email varchar(30),
@clave varchar(30)='',
@nombre varchar(50) = '',
@tipo varchar (50) = 'Regular',
@apellido varchar (50) = '',
@telefono varchar (30)
	as
	begin
	Update Clientes set Nombre = @nombre, Apellido = @apellido, Telefono = @telefono,  Clave = @clave, tipo = @tipo where Email = @email
	end
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
	create procedure ConsultaUsuariosFiltro
	@email varchar(30)
	as
	begin
		select*from Clientes where Email = @email
	end
---------------------------------------------------------------------------------------------

create procedure ActualizarUsuariosR
@email varchar(30),
@nombre varchar(50) = '',
@apellido varchar (50) = '',
@clave varchar(30)='',
@telefono varchar (30)
	as
	begin
	Update Clientes set Nombre = @nombre, Apellido = @apellido, Telefono = @telefono,  Clave = @clave where Email = @email
	end
	
---------------------------------------------------------------------------------------------
	create procedure ValidarUsuario
    @email varchar(30),
	@clave varchar(30)
	as
	begin
	select * from Clientes where Email = @email and clave = @clave
	end
---------------------------------------------------------------------------------------------

----------Procedimientos Provincia----------
---------------------------------------------------------------------------------------------
Create procedure AgregarProvincias
@Nombre nvarchar (55)
as
begin
 Insert Into Provincia (Nombre) Values (@Nombre)
end
Exec AgregarProvincias 'San Jose'
---------------------------------------------------------------------------------------------
Create procedure MostrarProvincias
as
begin
 Select * From Provincia
end
Exec MostrarProvincias
---------------------------------------------------------------------------------------------
Create procedure MostrarProvinciasParametro
@Nombre Varchar (30)
as
begin
 Select * From Provincia where Nombre = @Nombre
end

Exec MostrarProvinciasParametro 'San Jose'
---------------------------------------------------------------------------------------------
Create procedure ModificarProvincias
@Nombre nvarchar (55),
@id int
as
begin
 Update Provincia set Nombre = @Nombre where Codigo =  @id
end

Exec ModificarProvincias 'San Jose', 1
---------------------------------------------------------------------------------------------
Create procedure EliminarProvincias

@id int
as
begin
 delete Provincia where Codigo = @id
end

Exec EliminarProvincias 1
---------------------------------------------------------------------------------------------

----------Procedimientos Canton----------
---------------------------------------------------------------------------------------------



Create procedure selecanton
@codigoProvincia  int
as
begin
select c.Codigo,c.Nombre,p.Nombre
from Canton c, Provincia p
where p.Codigo = c.Codigo_Provincia and  c.Codigo_Provincia = @codigoProvincia
end

Exec selecanton 1
---------------------------------------------------------------------------------------------
Create procedure AgregarCanton
@Nombre nvarchar (55),
@id int
as
begin
 Insert Into Canton (Nombre,Codigo_Provincia) Values (@Nombre,@id)
end
Exec AgregarCanton 'Tibas', 1

---------------------------------------------------------------------------------------------
Create procedure MostrarCanton
as
begin
 Select * From Canton
end
Exec MostrarCanton
---------------------------------------------------------------------------------------------
Create procedure MostrarCantonParametros
@nombre varchar(30)
as
begin
 Select * From Canton where Nombre = @nombre
end
Exec MostrarCantonParametros 'Tibas'

---------------------------------------------------------------------------------------------
Create procedure ModificarCanton
@Nombre nvarchar (55),
@id int
as
begin
 Update Canton set Nombre = @Nombre where Codigo = @id
end
Exec ModificarCanton 'Tibas', 1

---------------------------------------------------------------------------------------------
Create procedure EliminarCanton
@id int
as
begin
 Delete Canton where Codigo = @id
end
Exec EliminarCanton 1
---------------------------------------------------------------------------------------------

----------Procedimientos Distrito----------
---------------------------------------------------------------------------------------------
Create procedure MostrarDistrito
as
begin
 Select * From Distrito
end
Exec MostrarDistrito
---------------------------------------------------------------------------------------------
Create procedure MostrarDistritoParametro
@nombre varchar(30)
as
begin
 Select * From Distrito where Nombre = @nombre
end
Exec MostrarDistritoParametro 'San Juan'
---------------------------------------------------------------------------------------------
Create procedure AgregarDistrito
@Nombre varchar (50),
@ID_Canton int
as
begin
 insert into Distrito (Nombre,Codigo_Canton) values (@Nombre,@ID_Canton)
end
Exec AgregarDistrito 'Llorente', 1
---------------------------------------------------------------------------------------------
Create procedure ModificarDistrito
@Nombre varchar (50),
@ID int
as
begin
 Update  Distrito set Nombre = @Nombre where Codigo = @ID
end
Exec ModificarDistrito 'San Juan', 1
---------------------------------------------------------------------------------------------
Create procedure EliminarDistrito
@ID int
as
begin
 Delete Distrito where Codigo = @ID
end
Exec EliminarDistrito 1
---------------------------------------------------------------------------------------------
Create procedure selecDistrito
@codigoCanton  int
as
begin
select D.Codigo,D.Nombre,C.Nombre
from Canton c, Distrito D
where C.Codigo = D.Codigo_Canton and  D.Codigo_Canton = @codigoCanton
end
Exec selecanton 1
---------------------------------------------------------------------------------------------
----------Procedimientos Direcciones----------
---------------------------------------------------------------------------------------------
Create procedure IngresarDireccion
@ID_Cliente  int,
@ID_Provincia int,
@ID_Canton int,
@ID_Distrito  int
as
begin
insert into Direcciones (Codigo_Cliente,Codigo_Provincia,Codigo_Canton,Codigo_Distrito) values (@ID_Cliente,@ID_Provincia,@ID_Canton,@ID_Distrito)
end

Exec IngresarDireccion 3,1,1,1
Select*From direcciones
Select*from Mae_Factura
---------------------------------------------------------------------------------------------
Create procedure ModificarDireccion
@ID_Provincia int,
@ID_Canton int,
@ID_Distrito  int,
@ID_Cliente  int
as
begin
Update Direcciones set Codigo_Provincia = @ID_Provincia, Codigo_Canton = @ID_Canton, Codigo_Distrito = @ID_Distrito where @ID_Cliente = Codigo_Cliente
end

Exec ModificarDireccion 1,1,1,1
---------------------------------------------------------------------------------------------
Create procedure ModificarDireccionUsuario
@Email varchar(50),
@ID_Provincia int,
@ID_Canton int,
@ID_Distrito  int
as
begin
declare @CodCliente int
set @CodCliente = (select Codigo from Clientes where Email = @Email)
Update Direcciones set Codigo_Provincia = @ID_Provincia, Codigo_Canton = @ID_Canton, Codigo_Distrito = @ID_Distrito where Codigo_Cliente= @CodCliente
end

Exec ModificarDireccionUsuario  'Pablo@uh.cr',1,1,2
---------------------------------------------------------------------------------------------
Create procedure EliminarDireccion
@ID_Cliente  int
as
begin
Delete Direcciones where Codigo_Cliente = @ID_Cliente
end

Exec EliminarDireccion 1

---------------------------------------------------------------------------------------------
Create procedure MostrarDireccionesParametros
@codigoCliente int
as
begin
select C.Nombre,C.Email,P.Nombre, Cn.Nombre, D.Nombre
from Direcciones Drs
inner join Clientes C on @codigoCliente = C.Codigo
inner join Provincia P on Drs.Codigo_Provincia = P.Codigo
inner join Canton Cn on Drs.Codigo_Canton = Cn.Codigo_Provincia
inner join Distrito D on Drs.Codigo_Distrito = D.Codigo
end

Exec  MostrarDireccionesParametros 1
---------------------------------------------------------------------------------------------
Create procedure MostrarDireccionesUsuario

@email varchar(50)
as
begin
declare @CodCliente int
set @CodCliente = (select Codigo from Clientes where Email =@Email)

select C.Nombre,c.Apellido,c.Telefono,c.tipo,C.Email,C.Clave, P.Nombre, Cn.Nombre, D.Nombre
from Direcciones Drs
inner join Clientes C on @codCliente = C.Codigo
inner join Provincia P on Drs.Codigo_Provincia = P.Codigo
inner join Canton Cn on Drs.Codigo_Canton = Cn.Codigo_Provincia
inner join Distrito D on Drs.Codigo_Distrito = D.Codigo
end

Exec  MostrarDireccionesUsuario 'Nacho@uh.cr'
---------------------------------------------------------------------------------------------
Create procedure MostrarDirecciones
as
begin
select C.Nombre,C.Email,P.Nombre, Cn.Nombre, D.Nombre
from Direcciones Drs
inner join Clientes C on Drs.Codigo_Cliente = C.Codigo
inner join Provincia P on Drs.Codigo_Provincia = P.Codigo
inner join Canton Cn on Drs.Codigo_Canton = Cn.Codigo_Provincia
inner join Distrito D on Drs.Codigo_Distrito = D.Codigo
end

Exec MostrarDirecciones


---------------------------------------------------------------------------------------------

----------Procedimientos Productos----------
---------------------------------------------------------------------------------------------
create procedure MostrarProductos
as
begin
select * from Producto
end

exec MostrarProductos
---------------------------------------------------------------------------------------------
create procedure borrarProdcuto
@Nombre varchar (50)
 as 
 begin
 delete Producto where Nombre = @Nombre
 end

 Exec borrarProdcuto 'Salchipapas'
----------------------------------------------------------------------------------------------
Create procedure ingresarProdcutos
@nombre varchar(50) = '',
@Precio float = 0
  as
	begin
	   insert into Producto(Nombre,Precio) values  (@nombre,@Precio)
	end

	Exec ingresarProdcutos 'Salchipapas',2500
	Exec ingresarProdcutos 'camisa',7500
----------------------------------------------------------------------------------------------
Create procedure MostrarProdcutosParametros
@nombre varchar(50) = ''
  as
	begin
	  select * from Producto where Nombre = @nombre
	end
	exec MostrarProdcutosParametros
----------------------------------------------------------------------------------------------
Create procedure ModificarPrecioProductos
@nombre varchar(50) = '',
@Precio Float = 0
  as
	begin
	   Update Producto Set Precio = @Precio where Nombre = @nombre
	end
	Exec ModificarPrecioProductos 'Salchipapas',2500
----------------------------------------------------------------------------------------------

----------Procedimientos Facturacion----------
--create table Mae_Factura(

--NFactura int identity (1,1),
--Fecha date null constraint Def_fecha default getdate(),
--Codigo_Cliente int,
--Total Float default 0,
--IV_Total Float default 0,
--Constraint FK_CodigoC Foreign key (Codigo_Cliente) references Clientes (Codigo),
--Constraint PK_NFactura primary key (NFactura)
--)


--create table DET_Factura(

--Codigo int identity (1,1),
--NFactura int,
--Codigo_Prodicto int,
--cantidad int,
--Precio_Unitario float,
--IV float,
--Constraint FK_CodigoNFact Foreign key (NFactura) references Mae_Factura (NFactura),
--Constraint PK_CodigoDET primary key (Codigo)

--)
---------------------------------------------------------------------------------------------
create procedure selecproducto
@codigo int
as
begin
select Codigo,Nombre,Precio from Producto where Codigo = @Codigo
end
exec selecproducto 1
---------------------------------------------------------------------------------------------
create procedure Maefactura
@cliente int,
@total money,
@IV int = 13 
as
begin
Declare @fecha datetime
set @fecha = GETDATE()
insert into Mae_Factura(Fecha,Codigo_Cliente,Total,IV_Total) values(@fecha,@cliente,@total, @IV)
end

exec Maefactura 1, 6000
select * from Mae_Factura
Select * From DET_Factura
---------------------------------------------------------------------------------------------
Create procedure DetFactura
@codigo int,
@cantidad int,
@precio money
as
begin
Declare @nfactura_det int
set @nfactura_det = (select top 1 NFactura from Mae_Factura order by NFactura desc)
insert into DET_Factura (NFactura,Codigo_Producto,cantidad,Precio_Unitario) values (@nfactura_det,@codigo,@cantidad,@precio)
end
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------


	Exec ValidarUsuario 'Pablo@uh.cr','123'
	Exec ConsultaUsuariosFiltro 'Pablo@uh.cr'
	Exec consultaUsuarios
	Exec borrarUsuarios 'cola@uh.cr'
	Exec ingresarUsuarios 'Nacho@uh.cr','123','Nacho','Regular','Yip','84700086'
	Exec ActualizarUsuarios 'Pablo@uh.cr','123','Pablo','Admin','Sanchez','84700086'
	Exec ActualizarUsuariosR  'Nacho@uh.cr','Nacho','Yip','222','84700086'

	Exec selecanton 1

	Exec ingresarProdcutos
