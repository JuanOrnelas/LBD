Select *
from Cliente
Where ApPaterno_c = 'Castillo' AND ApMaterno_c = 'Guajardo'


Select COUNT (Pedido_code)
from Pedido
where Platillo_code >1 OR Postre_code >5


Select Cliente.Nombre_c,Reservacion.Reservacion_code
from Reservacion
inner join  Cliente on Reservacion.Cliente_code = Reservacion.Cliente_code
where Nombre_c = '%O%'

Select Cliente.Nombre_c + Cliente.ApPaterno_c + Cliente.ApMaterno_c as NOMBRE_COMPLETO
from Cliente
where Cliente_code = 2

Select Info_Gral.Correo
from Info_Gral 


Select Cliente.Nombre_c as Nombre, Reservacion_code as Reservacion
from Cliente
inner join Reservacion on Cliente.Cliente_code = Reservacion.Reservacion_code

Select Ticket.Pago_code
from Ticket

Select Cliente.Nombre_c, Ticket.Ticket_code
from Ticket, Reservacion
inner join Cliente on Reservacion.Cliente_code = Cliente.Cliente_code

Select Postre.Descripcion
from Postre
WHERE Postre.Postre_code= 4

Select Cliente.ApMaterno_c + Cliente.ApPaterno_c + Cliente.Nombre_c AS NOMBRE_COMPLETO
from Cliente
where ApMaterno_c like '%Castillo%'

