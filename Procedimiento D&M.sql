USE db_dmsystems;

/*Procedimiento para aumentar el stock de los productos*/
DELIMITER //

CREATE PROCEDURE aumentarStockEntrada(IN p_id_entrada INT)
BEGIN
    DECLARE cantidad_entrada INT;
    DECLARE id_producto INT;

    -- Obtener la cantidad de entrada
    SELECT cantidad_entrada, id_producto INTO cantidad_entrada, id_producto
    FROM tb_entradas
    WHERE id_entrada = p_id_entrada;

    -- Actualizar la cantidad en stock del producto
    UPDATE tb_productos AS p
    INNER JOIN tb_inventarios AS i ON p.id_producto = i.id_producto
    SET p.existencia = p.existencia + cantidad_entrada
    WHERE i.id_entrada = p_id_entrada;
END //

DELIMITER ;

/*Procedimiento almacenado para disminuir el stock de los productos*/
DELIMITER //

CREATE PROCEDURE disminuirStockSalida(IN p_id_salida INT)
BEGIN
    DECLARE cantidad_salida INT;
    DECLARE id_producto INT;

    -- Obtener la cantidad de salida
    SELECT cantidad_salida, id_producto INTO cantidad_salida, id_producto
    FROM tb_salidas
    WHERE id_salida = p_id_salida;

    -- Actualizar la cantidad en stock del producto
    UPDATE tb_productos AS p
    INNER JOIN tb_inventarios AS i ON p.id_producto = i.id_producto
    SET p.existencia = p.existencia - cantidad_salida
    WHERE i.id_salida = p_id_salida;
END //

DELIMITER ;
/*tabla para crear los reportes debe ir aqui*/