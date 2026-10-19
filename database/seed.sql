-- database/seed.sql
-- Datos de prueba: 3 categorías, 12 productos, 6 clientes,
-- 10 pedidos y 25 detalles de pedido.

INSERT INTO categorias (id, nombre) VALUES
(1, 'Computación'),
(2, 'Accesorios'),
(3, 'Muebles');

INSERT INTO productos (id, nombre, categoria_id, precio, stock) VALUES
(1, 'Laptop', 1, 650.00, 8),
(2, 'Monitor', 1, 180.00, 4),
(3, 'Teclado', 2, 25.00, 20),
(4, 'Mouse', 2, 15.00, 3),
(5, 'Impresora', 1, 120.00, 6),
(6, 'Auriculares', 2, 35.00, 2),
(7, 'Escritorio', 3, 140.00, 5),
(8, 'Silla ergonómica', 3, 110.00, 9),
(9, 'Webcam', 2, 45.00, 4),
(10, 'Disco SSD', 1, 75.00, 12),
(11, 'Estante', 3, 80.00, 0),
(12, 'Micrófono', 2, 55.00, 7);

INSERT INTO clientes (id, nombre, telefono, email) VALUES
(1, 'Ana Flores', '70010001', 'ana@example.com'),
(2, 'Luis Pérez', '70010002', 'luis@example.com'),
(3, 'Marta Rojas', '70010003', 'marta@example.com'),
(4, 'Diego Cruz', '70010004', 'diego@example.com'),
(5, 'Sofía Lima', '70010005', 'sofia@example.com'),
(6, 'Pablo Vargas', '70010006', 'pablo@example.com');

INSERT INTO pedidos (id, cliente_id, fecha, estado) VALUES
(1, 1, '2026-10-01', 'pagado'),
(2, 1, '2026-10-03', 'enviado'),
(3, 1, '2026-10-05', 'pendiente'),
(4, 2, '2026-10-06', 'pagado'),
(5, 2, '2026-10-08', 'enviado'),
(6, 3, '2026-10-09', 'pendiente'),
(7, 4, '2026-10-10', 'pagado'),
(8, 4, '2026-10-11', 'cancelado'),
(9, 5, '2026-10-12', 'pagado'),
(10, 5, '2026-10-14', 'pendiente');

INSERT INTO detalle_pedido (id, pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 1, 650.00),
(2, 1, 3, 2, 25.00),
(3, 1, 4, 1, 15.00),
(4, 2, 2, 1, 180.00),
(5, 2, 6, 2, 35.00),
(6, 3, 5, 1, 120.00),
(7, 3, 10, 2, 75.00),
(8, 4, 7, 1, 140.00),
(9, 4, 8, 1, 110.00),
(10, 4, 3, 1, 25.00),
(11, 5, 9, 2, 45.00),
(12, 5, 12, 1, 55.00),
(13, 6, 1, 1, 650.00),
(14, 6, 4, 2, 15.00),
(15, 7, 2, 2, 180.00),
(16, 7, 10, 1, 75.00),
(17, 7, 6, 1, 35.00),
(18, 8, 11, 1, 80.00),
(19, 8, 3, 1, 25.00),
(20, 9, 5, 1, 120.00),
(21, 9, 9, 1, 45.00),
(22, 10, 7, 1, 140.00),
(23, 10, 8, 2, 110.00),
(24, 10, 12, 1, 55.00),
(25, 10, 4, 1, 15.00);

-- Ajustar los contadores de identidad tras insertar IDs explícitos.
SELECT setval(pg_get_serial_sequence('categorias', 'id'), (SELECT MAX(id) FROM categorias));
SELECT setval(pg_get_serial_sequence('productos', 'id'), (SELECT MAX(id) FROM productos));
SELECT setval(pg_get_serial_sequence('clientes', 'id'), (SELECT MAX(id) FROM clientes));
SELECT setval(pg_get_serial_sequence('pedidos', 'id'), (SELECT MAX(id) FROM pedidos));
SELECT setval(pg_get_serial_sequence('detalle_pedido', 'id'), (SELECT MAX(id) FROM detalle_pedido));
