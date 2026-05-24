# SQL Queries para Testing de Software

## 📌 Contexto

Estas consultas SQL simulan pruebas para una base de datos de tienda online (similar a SauceDemo).

**Tablas involucradas:**
- `users` - Información de usuarios
- `products` - Catálogo de productos
- `orders` - Órdenes de compra
- `order_items` - Detalles de cada orden
- `login_attempts` - Registro de intentos de login

## 🎯 Categorías de pruebas

| Categoría | Qué valida | Queries |
|-----------|-----------|---------|
| **Validación de datos** | Datos guardados correctamente | 1.1, 1.2 |
| **Login y seguridad** | Usuarios activos, intentos fallidos | 2.1, 2.2 |
| **Carrito y órdenes** | Totales, consistencia | 3.1, 3.2 |
| **Inventario** | Control de stock | 4.1, 4.2 |
| **Integridad** | Datos huérfanos | 5.1, 5.2 |

## 🛠️ Cómo usar estas queries

1. Conectarse a la base de datos de testing
2. Ejecutar la query específica
3. Verificar que los resultados sean los esperados

## ✅ Habilidades demostradas

- Consultas `SELECT` con condiciones
- `JOIN` entre tablas
- Agrupaciones con `GROUP BY`
- Filtros con `HAVING`
- Subconsultas y funciones de agregación
- Validación de integridad referencial