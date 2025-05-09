CREATE INDEX idx_ventas_clientes_id ON ventas(cliente_id);
CREATE INDEX idx_ventas_detalles_ventas_venta_id ON detalle_venta(venta_id);
CREATE INDEX idx_ventas_detalles_ventas_producto_id ON detalle_venta(producto_id);
CREATE INDEX idx_inventario_producto_id ON inventario(producto_id);