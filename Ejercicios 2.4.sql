--1 Listar los nombres de los archivos y su extensión de aquellos archivos cuyo tamaño sea mayor al promedio de tamaño general.

SELECT Nombre, Extension FROM Archivos
where Tamaño > (select AVG(Tamaño) FROM Archivos)

--2 Listar los ID, mes del período, año del período, nombre de la forma de pago e importe de aquellos pagos cuyo importe sea menor al promedio de importe general.

SELECT P.ID, P.Mes, P.Año, FP.Nombre, P.Importe FROM Pagos P
    INNER JOIN FormasPago FP ON FP.ID = P.IDFormaPago
WHERE P.Importe < (Select AVG(Importe) FROM Pagos)

--3 Listar nombre de usuario, apellido y nombres de aquellos usuarios que no se hayan suscripto en el año 2019.
SELECT DISTINCT U.Nombreusuario, DP.Apellidos + ', '+ DP.Nombres as 'Apellido y Nombre' FROM DatosPersonales DP 
    INNER JOIN Usuarios U ON U.ID = DP.ID
    INNER JOIN Suscripciones S ON S.IDUsuario = U.ID
WHERE S.IDUsuario NOT IN (SELECT sus.IDUsuario FROM Suscripciones sus WHERE YEAR(Inicio) = 2019)
 
 -- 4 Listar apellidos, nombres, emails, teléfono y celular de aquellos usuarios que no hayan subido ningún archivo.
SELECT DP.Apellidos, DP.Nombres, DP.Email, ISNULL(DP.Telefono, 'SIN TELEFONO') as Teléfono, DP.Celular FROM DatosPersonales DP 
    INNER JOIN Usuarios U ON U.ID = DP.ID
WHERE U.ID NOT IN (SELECT IDUsuario FROM Archivos)

-- 5 Listar apellidos y nombres de aquellos usuarios que no hayan realizado ningún pago.
SELECT * FROM DatosPersonales DP
WHERE DP.ID NOT IN (SELECT S.IDUsuario FROM Usuarios U
    INNER JOIN Suscripciones S ON S.IDUsuario = U.ID
    INNER JOIN Pagos P ON P.IDSuscripcion = S.ID)
