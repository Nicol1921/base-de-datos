CREATE OR REPLACE FUNCTION total_por_cliente (
    p_cliente_id IN NUMBER
) RETURN NUMBER AS
    total NUMBER;
BEGIN
    SELECT SUM(total_venta)
    INTO total
    FROM ventas
    WHERE cliente_id = p_cliente_id;

    RETURN NVL(total, 0); -- devuelve 0 si no hay ventas
END;

SELECT total_por_cliente(5) AS total_cliente_5 FROM dual;