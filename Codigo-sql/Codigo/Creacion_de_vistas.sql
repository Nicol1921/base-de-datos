CREATE OR REPLACE VIEW vista_ventas_clientes AS
SELECT
    v.venta_id,
    v.cliente_id,
    c.nombre_cliente,
    v.fecha_venta,
    v.total_venta
FROM ventas v
JOIN clientes c ON v.cliente_id = c.cliente_id;

CREATE OR REPLACE VIEW vista_detalle_venta_productos AS
SELECT
    dv.detalle_id,
    dv.venta_id,
    dv.producto_id,
    p.nombre_producto,
    dv.cantidad,
    dv.precio_unitario
FROM detalle_venta dv
JOIN productos p ON dv.producto_id = p.producto_id;

CREATE OR REPLACE VIEW vista_inventario_actual AS
SELECT
    i.producto_id,
    p.nombre_producto,
    SUM(CASE WHEN i.tipo_movimiento = 'Entrada' THEN i.cantidad ELSE -i.cantidad END) AS stock_actual
FROM inventario i
JOIN productos p ON i.producto_id = p.producto_id
GROUP BY i.producto_id, p.nombre_producto;

CREATE OR REPLACE VIEW vista_resumen_ventas_cliente AS
SELECT
    c.cliente_id,
    c.nombre_cliente,
    COUNT(v.venta_id) AS cantidad_ventas,
    SUM(v.total_venta) AS total_comprado
FROM clientes c
JOIN ventas v ON c.cliente_id = v.cliente_id
GROUP BY c.cliente_id, c.nombre_cliente;