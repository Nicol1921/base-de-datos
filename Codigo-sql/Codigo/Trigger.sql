CREATE OR REPLACE TRIGGER actualizar_stock_venta
AFTER INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    UPDATE inventario
    SET cantidad = cantidad - :NEW.cantidad
    WHERE producto_id = :NEW.producto_id
      AND tipo_movimiento = 'Entrada';
END;