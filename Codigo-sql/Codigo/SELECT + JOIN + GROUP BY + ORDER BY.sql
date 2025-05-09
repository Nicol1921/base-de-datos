SELECT * FROM VENTAS;

SELECT 
    v.venta_id,
    c.nombre_cliente,
    v.fecha_venta,
    v.total_venta
FROM ventas v
JOIN clientes c ON v.cliente_id = c.cliente_id;

SELECT 
    v.cliente_id,
    c.nombre_cliente,
    SUM(v.total_venta) AS total_comprado
FROM ventas v
JOIN clientes c ON v.cliente_id = c.cliente_id
GROUP BY v.cliente_id, c.nombre_cliente;

SELECT 
    venta_id,
    cliente_id,
    total_venta
FROM ventas
ORDER BY total_venta DESC;