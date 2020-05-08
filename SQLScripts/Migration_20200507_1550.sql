-- Migration_20200507_1550.sql

-- Autor: Olimpo Bonilla Ramírez.
-- Fecha: 2020-04-16.
-- Objetivo: Creación de tablas.

-- Limpieza de tablas temporales.
DROP TABLE IF EXISTS Velas.tcUsuario;
DROP TABLE IF EXISTS Velas.tcEstatus;
DROP TABLE IF EXISTS Velas.tcEstado;
DROP TABLE IF EXISTS Velas.tcSucursal;
DROP TABLE IF EXISTS Velas.tAlmacen;
DROP TABLE IF EXISTS Velas.tcAlamcen;
DROP TABLE IF EXISTS Velas.tcMedidas;
DROP TABLE IF EXISTS Velas.tcProvedor;
DROP TABLE IF EXISTS Velas.tcProductos;
DROP TABLE IF EXISTS Velas.tInventario;
DROP TABLE IF EXISTS Velas.tcPAgo;
DROP TABLE IF EXISTS Velas.tUsuario;
DROP TABLE IF EXISTS Velas.tVentas;
DROP TABLE IF EXISTS Velas.Log_almacen;
DROP TABLE IF EXISTS Velas.Log_Producto;
DROP TABLE IF EXISTS Velas.Log_Usuaros;

CREATE table tcUsuario(
  idtcUsuario INT NOT NULL auto_increment,
  desUsuario varchar(150) not null,
  estatus int not null,
  primary key (idtcUsuario)
);

CREATE TABLE tcEstatus(
  idEstatus int NOT NULL auto_increment,
  nombre varchar(100) not null,
  descEstaus varchar (200) not null,
  primary key(idEstatus)
);


CREATE TABLE tUsuario(
  idUsuario int not null auto_increment,
  nombre varchar(150) not null,
  apellido1 varchar (150) not null,
  apellido2 varchar (150) not null,
  idtcUsuario int not null,
  estatus int not null,
  idSucursal int not null,
  primary key (idUsuario)
);

CREATE TABLE tcSucursal(
  idSucursal int not null auto_increment,
  nombre varchar(150) not null,
  estado int not null,
  direccion varchar(200),
  estatus int,
  primary key (idSucursal)
);

create table tcEstado (
  idEstado int not null auto_increment,
  nombre  varchar(100),
  estatus int,
  primary key(idEstado)
);

create table tcAlamcen (
  idTipoAlmacen int not null auto_increment,
  descripcion varchar(100),
  primary key (idTipoAlmacen)
);


CREATE TABLE tAlmacen(
  idAlmacen int not null auto_increment,
  nombre varchar(100),
  ubicacion int not null,
  idTipoAlmacen int,
  primary key (idAlmacen)
);

Create table tcMedidas(
  idMedida int not null auto_increment,
  descripcion varchar(50),
  estatus int,
  primary key (idMedida)
);

create table tcProvedor(
  idProv int not null auto_increment,
  nombre varchar (200),
  estatus int,
  primary key (idProv)
);

Create table tcProductos(
  idProducto int not null auto_increment,
  nombre varchar (150) not null,
  idProvedor int,
  estatus int,
  costo float (7,2),
  precio float (7,2),
  primary key (idProducto)
);


CREATE TABLE  tInventario(
  idInventario int not null auto_increment,
  idProducto int not null,
  idAlmacen int not null,
  cantidad int not null,
  idMedida int not null,
  primary key (idInventario)
);

create table tcPAgo(
  idPago int not null auto_increment,
  desripcion varchar(130) not null,
  estatus int not null,
  primary Key (idPago)
);

create table tVentas(
  idVentas int not null auto_increment,
  idAgregadoVentas int not null,
  idSucursal int not null,
  idProducto int not null,
  idUsuario int not null,
  fecha datetime not null,
  cantidad int not null,
  tipoPago int not null,
  monto int not null,
  Primary Key (idVentas)
);

Create table Log_Usuaros(
  idLog int not null auto_increment,
  usaurioMod int not null,
  usuarioInsert int not null,
  fecha   datetime,
  Primary Key (idLog)
);

Create table Log_Producto(
  idLog int not null auto_increment,
  usuario int not null,
  precioAnt float (7,2),
  precioNew float (7,2),
  fecha datetime,
  primary key (idLog)
);

Create table Log_almacen(
  idPedido int not null auto_increment,
  idSucSol int not null,
  fecha datetime,
  primary key (idPedido)
);

-- Fin del script.
-- Migration_20200507_1550.sql