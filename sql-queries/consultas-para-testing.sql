-- ======================================================
-- PORTFOLIO QA - CONSULTAS SQL PARA TESTING
-- ======================================================
-- Contexto: Base de datos de tienda online
-- Habilidades: SELECT, JOIN, GROUP BY, HAVING, subconsultas

-- ======================================================
-- 1. VALIDACIÓN DE DATOS POST-REGISTRO
-- ======================================================

-- 1.1 Verificar que un usuario nuevo se creó correctamente
SELECT * FROM users 
WHERE email = 'laureano@test.com' 
AND created_at > NOW() - INTERVAL '5 minutes';

-- 1.2 Verificar que no hay emails duplicados (validación única)
SELECT email, COUNT(*) as cantidad
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

-- ======================================================
-- 2. VALIDACIÓN DE LOGIN Y SEGURIDAD
-- ======================================================

-- 2.1 Verificar que el usuario existe y está activo
SELECT user_id, username, email, status, last_login
FROM users
WHERE username = 'standard_user' 
AND status = 'active';

-- 2.2 Detectar posibles ataques de fuerza bruta
-- (más de 3 intentos fallidos en 1 hora)
SELECT user_id, ip_address, COUNT(*) as failed_attempts
FROM login_attempts
WHERE success = false
AND attempt_time > NOW() - INTERVAL '1 hour'
GROUP BY user_id, ip_address
HAVING COUNT(*) > 3;

-- ======================================================
-- 3. VALIDACIÓN DE CARRITO Y ÓRDENES
-- ======================================================

-- 3.1 Verificar que el total del carrito se calcula correctamente
SELECT 
    c.user_id, 
    SUM(c.quantity * p.price) as calculated_total, 
    c.cart_total as stored_total
FROM cart c
JOIN products p ON c.product_id = p.product_id
WHERE c.user_id = 123
GROUP BY c.user_id, c.cart_total
HAVING SUM(c.quantity * p.price) != c.cart_total;

-- 3.2 Verificar órdenes huérfanas (sin usuario asociado)
SELECT o.order_id, o.user_id
FROM orders o
LEFT JOIN users u ON o.user_id = u.user_id
WHERE u.user_id IS NULL;

-- ======================================================
-- 4. VALIDACIÓN DE INVENTARIO
-- ======================================================

-- 4.1 Verificar que no se vende más stock del disponible
SELECT 
    p.product_id, 
    p.product_name, 
    p.stock_quantity, 
    oi.quantity_ordered
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE oi.quantity_ordered > p.stock_quantity;

-- 4.2 Productos sin precio definido (dato faltante)
SELECT product_id, product_name
FROM products
WHERE price IS NULL OR price <= 0;

-- ======================================================
-- 5. PRUEBAS DE INTEGRIDAD
-- ======================================================

-- 5.1 Verificar que el total de la orden = suma de items
SELECT 
    o.order_id, 
    o.total_amount as order_total,
    SUM(oi.quantity * oi.unit_price) as items_sum,
    ROUND(o.total_amount - SUM(oi.quantity * oi.unit_price), 2) as difference
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.total_amount
HAVING ABS(o.total_amount - SUM(oi.quantity * oi.unit_price)) > 0.01;

-- 5.2 Usuarios sin ninguna orden (para campañas de marketing)
SELECT u.user_id, u.username, u.email
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.order_id IS NULL;

-- ======================================================
-- 6. MÉTRICAS PARA REPORTES DE CALIDAD
-- ======================================================

-- 6.1 Top 10 productos más vendidos
SELECT 
    p.product_name, 
    SUM(oi.quantity) as total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 10;

-- 6.2 Usuarios más activos (por cantidad de órdenes)
SELECT 
    u.username, 
    COUNT(o.order_id) as order_count
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.username
ORDER BY order_count DESC
LIMIT 10;