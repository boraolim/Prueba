-- Migration_20200507_1605.sql

-- Autor: Olimpo Bonilla Ramírez.
-- Fecha: 2020-04-16.
-- Objetivo: Creación de tablas.

-- Eliminación de objetos.
DROP PROCEDURE IF EXISTS Velas.procGetUsuarios;
DROP PROCEDURE IF EXISTS Velas.procAddSale;

-- 1. Trigger que guarda el registro de nuevas cuentas de usuario.
DELIMITER $$

CREATE TRIGGER Velas.After_tUsuario_Insert
AFTER INSERT
ON Velas.tUsuario FOR EACH ROW
BEGIN
  IF (NEW.idUsuario IS NOT NULL) THEN
    INSERT INTO Log_Usuaros (usaurioMod, usuarioInsert, fecha)
    VALUES (NEW.estatus, NEW.idUsuario, current_timestamp());
  END IF;
END$$

DELIMITER ;

-- 2. Stored Procedure que muestra los usuarios activos.
DELIMITER $$
$$
CREATE PROCEDURE Velas.procGetUsuarios(IN strEstado varchar(40))
BEGIN
  -- Mostrar información de las cuentas de usuario por estado.
  SELECT tu.idUsuario, tu.nombre, tu.apellido1, tu.apellido2, 
         tcSuc.idSucursal, tcSuc.direccion
    FROM Velas.tUsuario tu
   INNER JOIN Velas.tcUsuario tcU ON (tu.idtcUsuario = tcU.idtcUsuario)
   INNER JOIN Velas.tcSucursal tcSuc ON (tu.idSucursal = tcSuc.idSucursal)
   INNER JOIN Velas.tcEstado tEst ON (tcSuc.estado = tEst.idEstado)
   WHERE (tu.estatus = 1) AND (tEst.nombre = strEstado);
END$$

DELIMITER ;

-- Call Velas.procGetUsuarios('CDMX');

-- 3. Stored procedure que genera una venta.
DELIMITER $$
$$
CREATE PROCEDURE Velas.procAddSale(IN strIdSucursal int, IN strIdUsuario int, IN strCantidad int, IN strIdTipoPago int, IN strPermissionArray VARCHAR(8000))
BEGIN

  -- Armado de la sentencia SQL.
  SET @sql := 'INSERT INTO Velas.tVentas ';
  SET @sql := CONCAT(@sql, 'SELECT 0, (SELECT (ifnull(MAX(t1.idAgregadoVentas), 0) + 1) FROM Velas.tVentas t1) as IdMax, ');
  SET @sql := CONCAT(@sql, strIdSucursal, ' as IdSucursal, tp.idProducto, ');
  SET @sql := CONCAT(@sql, strIdUsuario, ' as IdUsuario,  CURRENT_TIMESTAMP() as Fecha, ');
  SET @sql := CONCAT(@sql, strCantidad, ' as Cantidad, ', strIdTipoPago, ' as TipoPago, (', strCantidad, ' * tp.precio) as Monto ');
  SET @sql := CONCAT(@sql, 'FROM Velas.tcProductos tp WHERE (tp.idProducto IN (', strPermissionArray, '));');

  -- Ejecución de la sentencia SQL final.
  PREPARE stmt FROM @sql;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END$$
DELIMITER ;


-- 2. Trigger
/*
DELIMITER $$

CREATE TRIGGER after_sales_update
AFTER UPDATE
ON sales FOR EACH ROW
BEGIN
  IF OLD.quantity <> new.quantity THEN
    INSERT INTO SalesChanges(salesId,beforeQuantity, afterQuantity)
    VALUES (old.id, old.quantity, new.quantity);
  END IF;
END$$

DELIMITER ;
*/

-- Migration_20200507_1605.sql