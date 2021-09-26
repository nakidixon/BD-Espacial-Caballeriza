--Script para generar la base y las tablas

--Crea la BD
CREATE DATABASE Caballeriza

--Creación de tablas para personas
GO
--Crea tabla padre para las personas
CREATE TABLE Persona(
	id INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(64) NOT NULL,
	apellido VARCHAR(64) NOT NULL,
	cedula VARCHAR(64) NOT NULL,
	fechaNacimiento DATE NOT NULL
)

GO
--Crea la subtabla empleado
CREATE TABLE Empleado(
	id INT PRIMARY KEY FOREIGN KEY REFERENCES Persona(id),
	sueldo MONEY NOT NULL,
	fechaIngreso DATE NOT NULL
)

GO
--Crea la subtabla cliente
CREATE TABLE Cliente(
	id INT PRIMARY KEY FOREIGN KEY REFERENCES Persona(id)
)

GO
--Creacion tablas para caballos


--tabla para la raza
CREATE TABLE Raza(
	id INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(64) NOT NULL
)

GO

--Tablas para la caballeriza y sus partes

--Crea la tabla para la caballeriza
CREATE TABLE Caballeriza(
	id INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(64) NOT NULL,
	mapa GEOMETRY NOT NULL
)

GO
--Crea la tabla para sus partes (Vip, regular, etc)
CREATE TABLE PartesCaballeriza(
	id INT PRIMARY KEY IDENTITY(1,1),
	idCaballeriza INT NOT NULL FOREIGN KEY REFERENCES Caballeriza(id),
	nombre VARCHAR(64) NOT NULL,
	cantidadCampos INT NOT NULL,
	campoEnCaballeriza GEOMETRY NOT NULL
)

GO
--tabla caballo
CREATE TABLE Caballo(
	id INT PRIMARY KEY IDENTITY(1,1),
	idCliente INT NOT NULL FOREIGN KEY REFERENCES Cliente(id),
	idRaza INT NOT NULL FOREIGN KEY REFERENCES Raza(id),
	idParteCaballeriza INT NOT NULL FOREIGN KEY REFERENCES PartesCaballeriza(id),
	nombre VARCHAR(64) NOT NULL, 
	edad INT NOT NULL,
	campoOcupado GEOMETRY NOT NULL
)

GO
--Tablas para factura y servicios

--Tabla para factura
CREATE TABLE Factura(
	id INT PRIMARY KEY IDENTITY(1,1),
	idCliente INT NOT NULL FOREIGN KEY REFERENCES Cliente(id),
	fecha DATE NOT NULL
)

GO
--tabla para el servicio
CREATE TABLE Servicio(
	id INT PRIMARY KEY IDENTITY(1,1),
	idCaballeriza INT NOT NULL FOREIGN KEY REFERENCES Caballeriza(id),
	nombre VARCHAR(64) NOT NULL,
	precio MONEY NOT NULL
)

GO
--tabla para servicioXcaballo
CREATE TABLE ServicioXCaballo(
	id INT PRIMARY KEY IDENTITY(1,1),
	idServicio INT NOT NULL FOREIGN KEY REFERENCES Servicio(id),
	idCaballo INT NOT NULL FOREIGN KEY REFERENCES Caballo (id),
	realizado BIT NOT NULL
)

GO
--tabla bitacora para los servicios
CREATE TABLE Bitacora(
	id INT PRIMARY KEY IDENTITY(1,1),
	IdEmpleado INT NOT NULL FOREIGN KEY REFERENCES Empleado(id),
	idServicioXCaballo INT NOT NULL FOREIGN KEY REFERENCES ServicioXCaballo(id),
	fecha DATE NOT NULL
)

