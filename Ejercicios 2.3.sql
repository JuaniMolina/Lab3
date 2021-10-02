-- 1 La cantidad de archivos del usuario con ID número 5
SELECT count(A.IDUsuario) FROM Archivos A
WHERE A.IDUsuario = 5

SELECT count(*) FROM Archivos 
WHERE IDUsuario = 5

-- 2 La cantidad de archivos con extensión 'avi'
SELECT COUNT(*) FROM Archivos
Where Extension like 'avi'

-- 3 La cantidad de usuarios que no tengan teléfono
SELECT COUNT(*) FROM DatosPersonales 
WHERE Telefono IS NOT NULL

-- 4 La cantidad de usuarios distintos que hayan subido archivos con extensión 'avi'
SELECT COUNT(distinct Nombreusuario) FROM Usuarios U 
INNER JOIN Archivos A ON U.ID = A.IDUsuario
Where A.Extension like 'avi'

-- 5 El promedio de kilobytes de los archivos con extensión 'mp3'
SELECT AVG(Tamaño) as PromedioKB FROM Archivos
WHERE Extension LIKE 'mp3'

-- 6 La suma total de importes de pagos realizados en el período de 10/2020
SELECT SUM(Importe) FROM Pagos
--WHERE Mes = 10 and Año =2020
WHERE YEAR(Fecha) = 2020 and MONTH(Fecha) = 10
-- descurbi un dato mal agregado entre fecha y año y mes, NO SE si es a Proposito
SELECT * FROM Pagos

-- 7 La cantidad de usuarios que vivan en alguna localidad del país 'Argentina'
SELECT COUNT(D.ID) From DatosPersonales D 
INNER JOIN Localidades L ON D.IDLocalidad = L.ID
INNER JOIN Paises P ON L.IDPais = P.ID
WHERE P.Nombre like 'Argentina'

-- 8 Por cada usuario, el apellido y nombre y la cantidad de archivos subidos
SELECT Apellidos + ', ' + Nombres, COUNT(*) as CantARCHIVOS FROM DatosPersonales D
INNER JOIN Archivos A ON A.IDUsuario = D.ID
GROUP BY Apellidos, Nombres

-- 9 Por cada extensión de archivo, la cantidad de archivos y el total en MB
SELECT archivos.Extension, COUNT(*) FROM Archivos
GROUP BY Extension

-- 10 Por cada forma de pago, listar el nombre de la forma de pago y el promedio abonado con dicha forma de pago
SELECT FP.Nombre, avg(P.Importe) FROM Pagos P 
INNER JOIN FormasPago FP ON FP.ID = P.IDFormaPago
GROUP BY FP.Nombre

SELECT * FROM Pagos

-- 11 Los nombres de las formas de pago que hayan totalizado más de cuatro mil pesos en total en concepto de pagos.
SELECT FP.Nombre, SUM(P.Importe) as Suma FROM Pagos P 
INNER JOIN FormasPago FP ON FP.ID = P.IDFormaPago
GROUP BY FP.Nombre
HAVING SUM(P.Importe) > 4000

-- 12 Por cada usuario, los apellidos y nombres y el total abonado en concepto de pagos de suscripciones. 
-- Si un usuario no abonó nada debe figurar con $0.
Select Apellidos, Nombres, SUM(TC.Costo) as Pagos FROM Suscripciones S 
INNER JOIN TiposCuenta TC ON S.IDTipoCUenta = TC.ID
INNER JOIN Usuarios U ON U.ID = S.IDUsuario
INNER JOIN DatosPersonales D on D.ID = U.ID
GROUP by U.ID, Apellidos,Nombres

-- 13 Por cada extensión de archivo, listar la extensión y el tamaño máximo del archivo con dicha extensión.
SELECT Extension, Max(Tamaño) as MaxTamaño FROM Archivos
GROUP BY Extension

-- 14 Por cada año, el número de año y la cantidad de pagos realizados. Utilizar la fecha del pago para calcularlo.
SELECT Year(Fecha) as Año, count(*) as CantidadPagos FROM Pagos
GROUP BY Year(Fecha)

-- 15 Por cada tipo de cuenta, el nombre de la cuenta y la cantidad total de pagos realizados.
SELECT TC.Nombre, COUNT(*) as CantPagos FROM TiposCuenta TC 
INNER JOIN Suscripciones S ON S.IDTipoCuenta = TC.ID
INNER JOIN Pagos P ON P.IDSuscripcion = S.ID
GROUP by TC.Nombre

-- 16 Listar nombre de usuario, nombres y apellidos, nombre de la extensión del
-- archivo y la cantidad total de archivos que dicho usuario tiene con esa
-- extensión. Sólo listar aquellos registros que contabilicen más de 2 archivos.
SELECT U.Nombreusuario, Nombres, Apellidos, A.Extension, COUNT(A.Extension) as Cantidad FROM DatosPersonales D 
INNER JOIN Usuarios U ON U.ID = D.ID
INNER JOIN Archivos A ON A.IDUsuario = U.ID
GROUP BY U.Nombreusuario, Nombres, Apellidos, A.Extension
HAVING COUNT(A.Extension) > 2

-- 17 Listar apellidos y nombres que posean más de 5 archivos de distintas extensiones.
SELECT Nombres, Apellidos, A.IDUsuario, count(A.IDUsuario) as Cantidad FROM DatosPersonales D 
INNER JOIN Usuarios U ON U.ID = D.ID
INNER JOIN Archivos A ON A.IDUsuario = U.ID
GROUP BY Nombres, Apellidos, A.IDUsuario
HAVING COUNT(A.IDUsuario) > 5

-- 18 Listar apellidos y nombres de los usuarios y el total en MBs totalizado de los archivos que no se encuentren eliminados (Estado → false).
SELECT Apellidos, Nombres, SUM(A.Tamaño/1024) as MB FROM DatosPersonales D 
INNER JOIN Usuarios U ON U.ID = D.ID
INNER JOIN Archivos A ON A.IDUsuario = U.ID
WHERE A.Estado = 1
GROUP BY Apellidos, Nombres

-- 19 Listar nombre de usuario y la máxima cantidad de días de una suscripción. Si
-- posee una suscripción vigente (Fecha de fin → NULL), utilizar la fecha del
-- sistema para calcular la cantidad de días de suscripción.
SELECT U.Nombreusuario, MAX(datediff(DD, S.Inicio, ISNULL(S.Fin,GETDATE()))) as DiasSuscripcion FROM Usuarios U 
INNER JOIN Suscripciones S ON S.IDUsuario = U.ID
GROUP BY Nombreusuario

-- 20 Listar apellido y nombre de los usuarios y la cantidad de suscripciones que registraron. Listar a los dos usuarios con empates con más suscripciones
SELECT Apellidos, Nombres, COUNT(S.ID) as CantSuscripciones FROM DatosPersonales D 
INNER JOIN Usuarios U ON U.ID = D.ID
INNER JOIN Suscripciones S ON S.IDUsuario = U.ID
GROUP BY Apellidos, Nombres
ORDER BY CantSuscripciones DESC
