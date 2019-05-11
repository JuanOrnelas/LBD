Create view BUSQUEDA_APELLIDOS as
Select *
from Cliente
Where ApPaterno_c = 'Castillo' AND ApMaterno_c = 'Guajardo'


Create view CUENTA_PEDIDOS as
Select COUNT (Pedido_code) as Pedidos
from Pedido
where Platillo_code >1 OR Postre_code >5

Create view RESERVACIONES as
Select Cliente.Nombre_c,Reservacion.Reservacion_code
from Reservacion
inner join  Cliente on Reservacion.Cliente_code = Reservacion.Cliente_code
where Nombre_c = '%O%'

Create view CLIENTES as
Select Cliente.Nombre_c + Cliente.ApPaterno_c + Cliente.ApMaterno_c as NOMBRE_COMPLETO
from Cliente
where Cliente_code = 2

Create view Info_General as
Select Info_Gral.Correo
from Info_Gral 

Create view NOMBREA_RESERVACION as
Select Cliente.Nombre_c as Nombre, Reservacion_code as Reservacion
from Cliente
inner join Reservacion on Cliente.Cliente_code = Reservacion.Reservacion_code

Create view Ticket_General as
Select Ticket.Pago_code
from Ticket

Create view BUSQUEDA_APELLIDOS as
Select Cliente.Nombre_c, Ticket.Ticket_code
from Ticket, Reservacion
inner join Cliente on Reservacion.Cliente_code = Cliente.Cliente_code

Create view POSTRE_BUSQUEDA as
Select Postre.Descripcion as POSTRE_ELEGIDO
from Postre
WHERE Postre.Postre_code= 4

Create view BUSQUEDA_COMPLETA as
Select Cliente.ApMaterno_c + Cliente.ApPaterno_c + Cliente.Nombre_c AS NOMBRE_COMPLETO
from Cliente
where ApMaterno_c like '%Castillo%' OR Cliente_code = 2


/**SUBCONSULTAS**/
Select Cliente.Nombre_c as Nombre, Reservacion_code as Reservacion
from Cliente
inner join Reservacion on Cliente.Cliente_code = Reservacion.Reservacion_code
where exists (select Cliente_code from Cliente where Reservacion_code = 2)

Select Cliente.ApMaterno_c + Cliente.ApPaterno_c + Cliente.Nombre_c AS NOMBRE_COMPLETO
from Cliente,Ticket
where exists (select Ticket.Reserv_code from Ticket where Ticket.Ticket_code =3)


/**DROP**/
ALTER TABLE Cliente
DROP COLUMN Nombre_c

ALTER TABLE
DROP INDEX Cliente.Cliente_code = 3
