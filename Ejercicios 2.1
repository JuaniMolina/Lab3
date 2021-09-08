-- 1 Listado de todos los usuarios.
SELECT * FROM Usuarios;

-- 2 Listado de todos los datos personales
SELECT * FROM DatosPersonales;

-- 3 Listado con nombre, apellido y domicilio de los usuarios
SELECT nombres, apellidos, domicilio FROM DatosPersonales;

-- 4 Listado con nombre, extensión y tamaño de todos los archivos
SELECT Nombre, Extension, Tamaño FROM Archivos;

-- 5 Listado con nombre y extensión, tamaño expresado en megabytes y el año de creación del archivo.
SELECT Nombre, Extension , Tamaño/1024 as TamañoMEGABYTES, year(Creacion) as año from Archivos;

-- 6 Listado con nombre y extensión, tamaño expresado en bytes y el IDUsuario del archivo.
SELECT Nombre, Extension, Tamaño*1024 as Bytes, IDUsuario FROM Archivos;

-- 7 Listado de todos las columnas de archivos de aquellos cuyo tamaño sea mayor a 100MB.
SELECT * FROM Archivos WHERE Tamaño/1024 > 100;

-- 8 Listado de todos las columnas de archivos de aquellos cuyo tamaño en megabytes sea entre 10 y 50.
SELECT * FROM Archivos WHERE Tamaño/1024 BETWEEN 10 and 50;

-- 9 Listado de localidades ordenado por IDPais
SELECT * FROM Localidades ORDER BY IDPais;

-- 10 Listado de localidades de los países con IDPais ARG, ITA y CHE
SELECT * FROM Localidades WHERE IDPais ='ARG' OR IDPais = 'ITA' OR IDPais = 'CHE';
-- ó
SELECT * FROM Localidades WHERE IDPais in ('ARG', 'ITA', 'CHE');

-- 11 Listado con Apellidos, Nombres, Email y Edad de los usuarios
SELECT Apellidos, Nombres, Email, year(GETDATE()) - YEAR(Nacimiento) as Edad FROM DatosPersonales;

-- 12 Listado de Usuarios que no tienen celular
SELECT Apellidos + ', ' + Nombres as USUARIO FROM DatosPersonales where Celular is NOT NULL;

-- 13 Listado de Usuarios que tienen celular pero no teléfon
SELECT Apellidos + ', ' + Nombres as USUARIO FROM DatosPersonales WHERE Celular is not null and Telefono is NULL;

-- 14 Listado de Usuarios que tienen celular y domicilio
SELECT Apellidos + ', ' + Nombres as USUARIO FROM DatosPersonales WHERE Celular is not null and Domicilio is not NULL;

-- 15 Listado de Usuarios con apellido y nombres, email y celular (si no tienen celular debe figurar el texto 'Sin celular' en la columna)
SELECT Apellidos + ', ' + Nombres as ApellidoyNombre, Email, ISNULL(Celular, 'Sin Celular') as Celular FROM DatosPersonales 

-- 16 Listado de Usuarios con apellido y nombres, email y celular (si no tienen
-- celular debe figurar el teléfono y si no tienen teléfono debe figurar
-- 'Incontactable')
SELECT Apellidos, Nombres, email, coalesce(celular, telefono, 'Incontactable') as Contacto FROM DatosPersonales

-- 17 Listado de Usuarios con apellido y nombres y el año de nacimiento
SELECT  Apellidos + ', ' + Nombres as Usuario, YEAR(Nacimiento) as AñoNacimiento From DatosPersonales

-- 18 Listado de Usuarios con apellido y nombres y el texto:
-- 'Generación X' si el año de nacimiento está comprendido entre 1969-1980
-- 'Millennials' si el año de nacimiento está comprendido entre 1981-1993
-- 'Generación Z' si el año de nacimiento está comprendido entre 1994-2010
SELECT Apellidos, Nombres,
CASE 
    WHEN YEAR(Nacimiento) BETWEEN 1969 and 1980 THEN 'Generacion X'
    WHEN YEAR(Nacimiento) BETWEEN 1981 and 1993 THEN 'Millennials' 
    WHEN YEAR(Nacimiento) BETWEEN 1994 and 2010 THEN 'Generazion Z'
END as Generacion 
FROM DatosPersonales

-- 19 Listado con el usuario más joven registrado. Debe indicar el apellido y el nombre
SELECT TOP 1 Apellidos, Nombres, cast(datediff(DD, Nacimiento, getdate())/365.25 as int) as Edad FROM DatosPersonales
WHERE Nacimiento IS NOT NULL
ORDER BY Edad ASC

-- 20 Listado con los años de nacimiento de los usuarios sin repetir
SELECT DISTINCT Nacimiento FROM DatosPersonales
WHERE Nacimiento IS NOT NULL

-- 21 Listado de archivos con su nombre y extensión y la diferencia de días entre la modificación y la creación
SELECT Nombre, Extension, DATEDIFF(DD, Creacion, Modificacion) as DiferenciaDias FROM Archivos
Order by DiferenciaDias DESC

-- 22 Listado de usuarios que no viven en las localidades 1, 3, 5 ni 7.
SELECT Apellidos, Nombres FROM DatosPersonales
Where IDLocalidad NOT IN (1, 3, 5, 7)

-- 23 Listado de archivos con estado 1, cuyo tamaño no sea entre 15 y 75 MB ni de extensión 'JPEG' o 'AVI ' y que hayan sido creados en el año 2020
SELECT * FROM Archivos
WHERE (Tamaño/1024 NOT BETWEEN 15 and 75) AND (YEAR(Creacion) = 2020) AND Extension NOT LIKE 'avi' AND Extension NOT LIKE 'jpg'

-- 24 Listado de usuarios que vivan en un domicilio que contenga las palabras 'Virrey' o 'Doctora'
SELECT Apellidos, Nombres, Domicilio FROM DatosPersonales
WHERE Domicilio LIKE '%Virrey%' or Domicilio LIKE '%Doctora%'

-- 25 Listado de usuarios que registren un Email que contenga el dominio 'yahoo' o 'hotmail'.
SELECT Apellidos, Nombres FROM DatosPersonales
WHERE Email LIKE '%yahoo%' OR Email LIKE '%hotmail%'

-- 26  Listado de usuarios cuyo nombre de usuario comience y termine con vocal
SELECT Nombres, Apellidos FROM DatosPersonales
WHERE Nombres Like '[aeiou]%[aeiou]'
