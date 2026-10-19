 --database/consultas.sql

-- 1. Listar productos con su categoría, ordenados por nombre.
SELECT p.id, p.nombre AS producto, c.nombre AS categoria, p.precio, p.stock
FROM productos p
JOIN categorias c ON c.id = p.categoria_id
ORDER BY p.nombre ASC;

-- 2. Productos con stock menor a 5.
SELECT id, nombre, stock
FROM productos
WHERE stock < 5
ORDER BY stock ASC;

-- 3. Precio promedio por categoría.
SELECT c.nombre AS categoria, ROUND(AVG(p.precio), 2) AS precio_promedio
FROM categorias c
JOIN productos p ON p.categoria_id = c.id
GROUP BY c.id, c.nombre
ORDER BY c.nombre;

--4. Pedidos de un cliente: cambiar 1 por el ID deseado.
SELECT pe.id, pe.fecha, pe.estado
FROM pedidos pe
WHERE pe.cliente_id = 1
ORDER BY pe.fecha DESC;

-- 5. Importe total de cada pedido.
SELECT pe.id AS pedido_id,
       COALESCE(SUM(dp.cantidad * dp.precio_unitario), 0) AS total
FROM pedidos pe
LEFT JOIN detalle_pedido dp ON dp.pedido_id = pe.id
GROUP BY pe.id
ORDER BY pe.id;

-- 6. Clientes que tienen más de dos pedidos.
SELECT c.id, c.nombre, COUNT(pe.id) AS cantidad_pedidos
FROM clientes c
JOIN pedidos pe ON pe.cliente_id = c.id
GROUP BY c.id, c.nombre
HAVING COUNT(pe.id) > 2
ORDER BY cantidad_pedidos DESC;

-- 7. Eliminar un cliente que no tenga pedidos.
-- El cliente 6 se deja sin pedidos en los datos de prueba.
DELETE FROM clientes c
WHERE c.id = 6
  AND NOT EXISTS (
      SELECT 1
      FROM pedidos pe
      WHERE pe.cliente_id = c.id
  )
RETURNING id, nombre, email;
