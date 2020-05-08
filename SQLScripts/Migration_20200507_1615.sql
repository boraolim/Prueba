-- Migration_20200507_1615.sql

-- Autor: Olimpo Bonilla Ramírez.
-- Fecha: 2020-04-16.
-- Objetivo: Creación de tablas.

-- Limpieza de tablas temporales.
TRUNCATE TABLE Velas.tcUsuario;
TRUNCATE TABLE Velas.tcEstatus;
TRUNCATE TABLE Velas.tcEstado;
TRUNCATE TABLE Velas.tcSucursal;
TRUNCATE TABLE Velas.tcAlamcen;
TRUNCATE TABLE Velas.tcMedidas;
TRUNCATE TABLE Velas.tcProvedor;
TRUNCATE TABLE Velas.tcProductos;
TRUNCATE TABLE Velas.tInventario;
TRUNCATE TABLE Velas.tcPAgo;
TRUNCATE TABLE Velas.tUsuario;

-- Velas.tcUsuario => Insertamos roles de usuarios.
INSERT INTO Velas.tcUsuario (desUsuario, estatus)
VALUES ('VENDEDOR', 1),
       ('ADMINISTRADOR', 1),
       ('SISTEMAS', 1);

-- Velas.tcEstatus => Insertamos status de cuentas de usuarios.
INSERT INTO Velas.tcEstatus (nombre, descEstaus)
VALUES ('ACT', 'Activo'),
       ('NACT', 'Inactivo'),
       ('BLOCK', 'Bloqueado');

-- Velas.tcEstado => Insertamos las entidades federativas.
INSERT INTO Velas.tcEstado (nombre, estatus)
VALUES ('CDMX', 1),
       ('JALISCO', 1),
       ('NUEVO LEON', 1),
       ('ESTADO DE MÉXICO', 1),
       ('HIDALGO', 1),
       ('PUEBLA', 1);

-- Velas.tcSucursal => Insertamos las sucursales asociadas a las entidades federativas.
INSERT INTO Velas.tcSucursal (nombre, estado, direccion, estatus)
VALUES ('ERMITA', 1, 'CALZ. ERMITA IZTAPALAPA 2048', 1),
       ('SANTA MARTHA', 1, 'CALZ. IGNACIO ZARAGOZA 753', 1),
       ('CALLE 7', 1, 'PERIFERICO ORIENTE CALLE 7 1205', 1),
       ('LAS ANTENAS', 1, 'PERIFERICO ORIENTE CANAL DE GARAY 5842', 1),
       ('ZAPOPAN', 2, 'IGNACIO L. VALLARTA 438', 1),
       ('CIUDAD AZTECA', 4, 'AV. CENTRAL 2801', 1),
       ('TULANCINGO', 5, 'AV. 234 # 8', 1),
       ('SAN MARTIN TEXMELUCAN', 6, 'AV. NORTE 234 # 8', 1);

-- Velas.tcAlamcen => Insertamos los tipos de almacenes.
INSERT INTO Velas.tcAlamcen (descripcion)
VALUES ('CENTRAL'),
       ('REGIONAL'),
       ('TRANSITO'),
       ('TEMPORAL');

-- Velas.tAlmacen => Insertamos los almacenes.
INSERT INTO Velas.tAlmacen (nombre, ubicacion, idTipoAlmacen)
VALUES ('ALMACEN 1', 1, 1),
       ('ALMACEN 2', 1, 1),
       ('ALMACEN 3', 1, 1),
       ('ALMACEN 4', 2, 1);

-- Velas.tcMedidas => Insertamos las medidas del producto.
INSERT INTO Velas.tcMedidas (descripcion, estatus)
VALUES ('UNIDAD', 1),
       ('CAJA', 1),
       ('SET', 1);

-- Vela.tcProveedor => Insertamos la lista de proveedores.
INSERT INTO Velas.tcProvedor (nombre, estatus)
VALUES ('VELAS LA CATOLICA S.A DE C.V.', 1),                           -- Proveedor No. 1
       ('COMPAÑIA DE VELADORAS MEXICANAS S.A. DE C.V.', 1),            --               2...
       ('FLAMA S.A. de C.V.', 1),
       ('VELAS AC S.A. DE C.V.', 1),
       ('CERILLERA LA CENTRAL S.A. de C.V.', 1);

-- Vela.tcProductos => Insertamos los productos.
INSERT INTO Velas.tcProductos (nombre, idProvedor, estatus, costo, precio )
VALUES ('Vela Haus Cena marfil', 1, 1, 53.40, 53.40),
       ('Vela Haus Dinner Candle Roja', 2, 1, 107.40, 107.40),
       ('Vela Haus Mymy Rosa Claro', 2, 1, 107.40, 107.40),
       ('Cirio Haus Mora Azul', 1, 1, 89.40, 89.40),
       ('Cirio Haus Basic Beige', 2, 1, 131.40, 131.40),
       ('Vela Haus Cilly Marfil', 2, 1, 41.40, 41.40),
       ('Set de Velas PB Basic', 3, 1, 207.20, 207.20),
       ('Vela Haus Caty Negra', 2, 1, 83.40, 83.40),
       ('Set de 9 velas Haus Chico Tea Light Blanco', 3, 1, 89.40, 89.40),
       ('Vela Haus Blanca', 3, 1, 17.40, 17.40),
       ('Vela aromática Haus Apple Vino', 3, 1, 113.40, 113.40),
       ('Vela aromática Haus Olas Azul', 4, 1, 113.40, 113.40),
       ('Cirius Haus Manzana Verde', 5, 1, 113.40, 113.40);

-- Vela.tInventario => Insertamos el inventario del almacen.
INSERT INTO Velas.tInventario (idProducto, idAlmacen, cantidad, idMedida)
VALUES (1, 1, 250, 1),
       (2, 1, 250, 1),
       (3, 1, 250, 2),
       (4, 1, 250, 1),
       (5, 1, 250, 2),
       (6, 1, 250, 1),
       (7, 1, 250, 3),
       (8, 1, 250, 1),
       (9, 1, 250, 3),
       (10, 1, 250, 2),
       (11, 1, 250, 2),
       (12, 1, 250, 2),
       (13, 1, 250, 2);

-- Vela.tcPago => Insertamos los tipos de pago.
INSERT INTO Velas.tcPAgo (desripcion, estatus)
VALUES ('TDD', 1),
       ('TDC', 1),
       ('EFECTIVO', 1);

-- Vela.tcUsuarios.
INSERT INTO Velas.tUsuario (nombre, apellido1, apellido2, estatus, idSucursal, idtcUsuario )
VALUES ('OLIMPO', 'BONILLA', 'RAMIREZ', 1, 1, 1),
       ('PATRICIA', 'LARA', 'MARTINEZ', 1, 2, 1),
       ('ADRIANA PAOLA', 'GUTIERREZ', 'GOMEZ', 1, 3, 1),
       ('YUNERI', 'GUTIERREZ', 'LOPEZ', 1, 4, 1),
       ('SARA', 'ESTRADA', 'MENDEZ', 1, 5, 1),
       ('SORAYA', 'ESCAMILLA', 'ALVAREZ', 1, 6, 1),
       ('TANIA INGRID', 'CORONEL', 'CERON', 1, 7, 1),
       ('JOSE ALBERTO', 'ABAD', 'TORRES', 1, 8, 1),
       ('SHEILA ELIZABETH', 'SOLIZ', 'MARTINEZ', 1, 1, 1),
       ('ARMANDO ROGER', 'DAZA', 'ALZAGA', 1, 2, 1);

/*
SELECT * FROM Velas.tcUsuario;
SELECT * FROM Velas.tcEstatus;
SELECT * FROM Velas.tcEstado;
SELECT * FROM Velas.tcSucursal;
SELECT * FROM Velas.tcAlamcen;
SELECT * FROM Velas.tcMedidas;
SELECT * FROM Velas.tcProvedor;
SELECT * FROM Velas.tcProductos;
SELECT * FROM Velas.tInventario;
SELECT * FROM Velas.tcPAgo;
SELECT * FROM Velas.tUsuario;
*/

-- Fin del script.
-- Migration_20200507_1615.sql