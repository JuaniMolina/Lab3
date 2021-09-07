-- 1 Apellidos y nombres de los usuarios y nombre de la localidad en la que vive. Si el usuario no registra una localidad no debe figurar en la lista.
SELECT Nombres, Apellidos, L.Nombre from DatosPersonales D 
INNER JOIN Localidades L ON L.ID = D.IDLocalidad

-- 2 Apellidos y nombres de los usuarios y nombre de la localidad en la que vive. Si el usuario no registra una localidad debe figurar en la lista de todas maneras.
SELECT Nombres, Apellidos, L.Nombre From DatosPersonales D
LEFT JOIN Localidades L ON L.ID = D.IDLocalidad

-- 3 Apellidos y nombres de los usuarios y nombre de la localidad en la que vive. Si la localidad no registra un usuario debe figurar en la lista de todas maneras.
SELECT Nombres, Apellidos, L.Nombre From DatosPersonales D
RIGHT JOIN Localidades L ON L.ID = D.IDLocalidad

-- 4 Apellidos y nombres de los usuarios, nombre de la localidad en la que vive y nombre del país.
SELECT Nombres, Apellidos, L.Nombre, P.Nombre From DatosPersonales D
INNER JOIN Localidades L ON L.ID = D.IDLocalidad
INNER JOIN Paises P ON P.ID = L.IDPais

-- 5 Nombres de todas las localidades y nombre de los países a los que
--pertenecen. Incluir en el listado todos los países que no registren localidades.
--Ordenar el listado por país de manera ascendente y dentro de cada país por
--localidad como segundo criterio.
SELECT L.nombre, P.Nombre FROM Localidades L
RIGHT JOIN Paises P ON P.ID = L.IDPais
ORDER BY P.Nombre ASC, L.Nombre ASC

-- 6 Nombre de archivo y extensión, tamaño y fecha de modificación de todos los
--archivos. Incluir también el nombre de usuario y el email. Ordenar el listado
--por tamaño de archivo de manera descendente.
SELECT A.Nombre as NombreArchivo, A.Extension, A.Tamaño, A.Modificacion, U.Nombreusuario, D.Email FROM DatosPersonales D 
INNER JOIN  Archivos A ON A.ID = D.ID
INNER JOIN Usuarios U ON U.ID = D.ID
ORDER BY A.Tamaño DESC

-- 7 Nombre de usuario y nombre del país al que pertenece. Si no registra país debe figurar con el nombre 'Sin país'.
SELECT U.Nombreusuario, ISNULL(p.Nombre, 'Sin Pais') as NombrePais FROM DatosPersonales D
INNER JOIN Usuarios U ON U.ID = D.ID 
LEFT JOIN Localidades L ON L.ID = D.ID
LEFT JOIN Paises P ON P.ID = L.IDPais

-- 8 Apellido y nombre, Email, Telefono y Domicilio de todos los usuarios que vivan en una localidad que contenga el nombre 'San'.
SELECT Apellidos + ', ' + Nombres, Email, Telefono, Domicilio, L.Nombre FROM DatosPersonales D 
INNER JOIN  Localidades L ON L.ID = D.IDLocalidad
WHERE L.Nombre LIKE '%san%'

-- 9 El nombre de usuario del usuario que tenga el archivo de menor tamaño.
SELECT TOP 1 Nombreusuario FROM   Usuarios U 
INNER JOIN Archivos A ON A.IDUsuario = U.ID
ORDER BY A.Tamaño ASc

-- 10 La localidad y el país con el usuario más joven.
SELECT TOP 1 L.Nombre, p.Nombre FROM DatosPersonales D 
INNER JOIN Localidades L ON L.ID = D.IDLocalidad
INNER JOIN Paises P ON P.ID = L.IDPais
Where Nacimiento is not NULL
ORDER by YEAR(Nacimiento) ASC

-- 11 Apellidos, nombres y nombre de usuario de aquellos usuarios que no registren archivos.
SELECT Apellidos, Nombres, Nombreusuario FROM DatosPersonales D 
INNER JOIN Usuarios U ON U.ID = D.ID
LEFT JOIN Archivos A ON A.IDUsuario = D.ID
WHERE A.Nombre is NULL

-- 12 Apellidos y nombres de los usuarios, sin repetir, que hayan registrado al menos un archivo cuyo tamaño supere los 450MB.
SELECT DISTINCT Nombres, Apellidos From DatosPersonales D
INNER JOIN Usuarios U ON U.ID = D.ID
INNER JOIN Archivos A ON A.IDUsuario = U.ID
WHERE A.Tamaño/1024 > 450

-- 13 Apellidos y nombres de los usuarios, nombre de usuario, localidad y país,
-- nombre de archivo y extensión, tamaño y diferencia de días entre la última
-- modificación y la creación.
SELECT Nombres, Apellidos, U.Nombreusuario, ISNULL(L.Nombre, 'Sin Localidad') as Localidad, ISNULL(P.Nombre, 'Sin Pais') as Pais, A.Nombre as NombreArchivo, 
A.Extension, A.Tamaño, datediff(DD, a.Creacion, a.Modificacion) as DiferenciaDias FROM DatosPersonales D 
LEFT JOIN Localidades L ON L.ID = D.IDLocalidad
LEFT JOIN Paises P ON L.IDPais = P.ID
INNER JOIN Usuarios U ON U.ID = D.ID
INNER JOIN Archivos A ON A.IDUsuario = U.ID

-- 14 Apellidos y nombres, sin repetir, de aquellos usuarios que hayan registrado al menos un archivo que hayan creado y no modificado.
SELECT DISTINCT Apellidos, Nombres FROM DatosPersonales D
INNER JOIN Usuarios U ON D.ID = U.ID
INNER JOIN Archivos A ON U.ID = A.IDUsuario
WHERE A.Creacion = A.Modificacion

-- 15 Los nombres de los países que aún no registren usuarios.
SELECT P.Nombre FROM DatosPersonales D
INNER JOIN Localidades L ON L.ID = D.IDLocalidad
RIGHT JOIN Paises P ON P.ID = L.IDPais
WHERE D.ID is NULL
