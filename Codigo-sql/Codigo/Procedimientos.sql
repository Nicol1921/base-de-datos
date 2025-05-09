CREATE OR REPLACE PROCEDURE registrar_venta (
    p_cliente_id IN NUMBER,
    p_fecha_venta IN DATE,
    p_total_venta IN NUMBER
) AS
BEGIN
    INSERT INTO ventas (venta_id, cliente_id, fecha_venta, total_venta)
    VALUES (seq_venta_id.NEXTVAL, p_cliente_id, p_fecha_venta, p_total_venta);
END;

BEGIN
    registrar_venta(5, TO_DATE('06/05/2025', 'DD/MM/YYYY'), 15000);
END;