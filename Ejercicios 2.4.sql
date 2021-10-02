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
-- 6 Las formas de pago que no se utilizaron en Diciembre de 2019.
SELECT Nombre FROM FormasPago
WHERE ID NOT IN (SELECT FP.ID FROM FormasPago FP 
    INNER JOIN Pagos P ON P.IDFormaPago = FP.ID
WHERE P.Año = 2019 and P.Mes = 12) 

---
SELECT FP.Nombre
FROM FormasPago FP
WHERE FP.ID NOT IN (
	SELECT DISTINCT P.IDFormaPago
	FROM Pagos P
	WHERE P.Año = 2019 AND P.Mes = 12
)

-- 7 Los nombres de los archivos que tengan un tamaño mayor a cualquier archivo con extensión 'XLS'.
SELECT Nombre FROM Archivos
WHERE Tamaño > ALL(Select A.Tamaño FROM Archivos A WHERE A.Extension = 'XLS')

-- 8 Los nombres de los archivos que tengan un tamaño menor a algún archivo con extensión 'DOC' y se haya creado el año 2021.
SELECT Nombre 
FROM Archivos
WHERE Tamaño < SOME(SELECT A.Tamaño FROM Archivos A WHERE A.Extension = 'DOC') and YEAR(Creacion) = 2021

----
SELECT A.Nombre
FROM Archivos A
WHERE YEAR(A.Creacion) = 2021
AND A.Tamaño < (SELECT MAX(AR.Tamaño) FROM Archivos AR WHERE AR.Extension = 'DOC' )

--9 Los ID, apellido y nombres del usuario, mes y año del período e importe del pago de aquellos pagos que sean mayores a cualquier pago en Efectivo del año 2020.
SELECT * FROM Pagos P 
WHERE P.Importe > SOME(SELECT Importe FROM Pagos INNER JOIN FormasPago FP ON Fp.ID = PAGOS.IDFormaPago WHERE FP.Nombre = 'Efectivo' and pagos.Año = 2020)

--10 Listar apellidos, nombres y nombre de usuario y la cantidad de archivos de extensión 'avi' y la cantidad de archivos de extensión 'xls'.
SELECT DP.Apellidos, DP.Nombres, U.Nombreusuario, 
(Select COUNT(A.ID) FROM  Archivos A WHERE A.Extension = 'avi' and A.IDUsuario = U.ID) as 'Cant. avi',
(Select COUNT(A.ID) FROM  Archivos A WHERE A.Extension = 'xls' and A.IDUsuario = U.ID) as 'Cant. xls'
 FROM DatosPersonales DP 
    INNER JOIN Usuarios U ON U.ID = DP.ID

----
SELECT DP.Apellidos, DP.Nombres, U.Nombreusuario,
(
	SELECT COUNT(A.ID) 
	FROM Archivos A
	WHERE A.IDUsuario = U.ID AND A.Extension = 'avi'
) AS AVI,
(
	SELECT COUNT(A.ID) 
	FROM Archivos A
	WHERE A.IDUsuario = U.ID AND A.Extension = 'xls'
) AS XLS
FROM Usuarios U
INNER JOIN DatosPersonales DP
	ON U.ID = DP.ID
    
