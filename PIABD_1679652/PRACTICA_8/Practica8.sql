/**10 Procedures**/
Alter Procedure Busqueda_Nombre
@ApellidoP varchar(40),
@ApellidoM varchar(40)
as 
Select *
from Cliente
Where ApPaterno_c = @ApellidoP AND ApMaterno_c = @ApellidoM


Alter Procedure Pediddo_cuenta
@Platillo int,
@Postre int
as
Select COUNT (Pedido_code) as Pedidos
from Pedido
where Platillo_code = @Platillo OR Postre_code = @Postre

Alter Procedure Reservaciones_porNombre
@nombre varchar(50)
as
Select Cliente.Nombre_c,Reservacion.Reservacion_code
from Reservacion
inner join  Cliente on Reservacion.Cliente_code = Reservacion.Cliente_code
where Nombre_c = '%'+ @nombre +'%'

Create Procedure Nombre_Clientes
as
Select Cliente.Nombre_c + Cliente.ApPaterno_c + Cliente.ApMaterno_c as NOMBRE_COMPLETO
from Cliente
where Cliente_code = 2

Create Procedure Informacion
as
Select Info_Gral.Correo
from Info_Gral 

Create Procedure Reservacion_Nombre
as
Select Cliente.Nombre_c as Nombre, Reservacion_code as Reservacion
from Cliente
inner join Reservacion on Cliente.Cliente_code = Reservacion.Reservacion_code

Create Procedure Ticket_Info
as
Select Ticket.Pago_code
from Ticket

Create Procedure Cliente_Reservacion
as
Select Cliente.Nombre_c, Ticket.Ticket_code
from Ticket, Reservacion
inner join Cliente on Reservacion.Cliente_code = Cliente.Cliente_code

Create Procedure Postre_Busq
@postre int
as
Select Postre.Descripcion as POSTRE_ELEGIDO
from Postre
WHERE Postre.Postre_code= @postre


Create Procedure Busqueda_Gral
@ApMaterno varchar(50),
@ApPaterno varchar(50),
@Nombre varchar(50),
@Cliente int
as
Select Cliente.ApMaterno_c + Cliente.ApPaterno_c + Cliente.Nombre_c AS NOMBRE_COMPLETO
from Cliente
where ApMaterno_c like '%'+ @ApMaterno+ '%' OR Cliente_code = @Cliente


/**FUNCIONES**/
create function NombreCompleto (@nombre varchar(50),@apellido varchar(40))
returns varchar(100)
as
begin
	return (@nombre +' '+ @apellido)
end


/**TRIGERS**/

create trigger Insertar_Pedido 
on Pedido 
AFTER INSERT
 
AS

/**query de comparacion**/
 IF EXISTS	
 (
	Select Cliente.Nombre_c as Nombre, Reservacion_code as Reservacion
	from Cliente
	inner join Reservacion on Cliente.Cliente_code = Reservacion.Reservacion_code
	where Reservacion_code = 4
 )

 /*Inicio del insert*/
 begin
	Insert into Pedido values(30,1,3,4)
 end


/**QUERY DINAMICO**/
 DECLARE @sql NVARCHAR(1000)
DECLARE @campos NVARCHAR(100)
DECLARE @Cliente_code INT

SET @Cliente_code = 2

IF @Cliente_code = 1
 SET @campos = N'ApPaterno_c'

ELSE
 SET @campos = N'ApMaterno_c'

EXEC('SELECT '+ @campos +' FROM Cliente')
