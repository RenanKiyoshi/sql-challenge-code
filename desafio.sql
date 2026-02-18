-- =====================================================
-- = Desafio Sql                                       =
-- = Autor: Renan Kiyoshi                              =
-- = Data: 18/02/2026                                  =
-- =====================================================

-- 1. Listar todos Clientes que não tenham realizado uma compra
SELECT c.*
FROM Clients c
LEFT JOIN Orders o ON o.client_id = c.id
WHERE o.id IS NULL;

-- 2. Listar os Produtos que não tenham sido comprados
SELECT p.*
FROM Products p
LEFT JOIN OrderItems oi ON oi.product_id = p.id
WHERE oi.id IS NULL;

-- 3. Listar os Produtos sem Estoque
SELECT *
FROM Products
WHERE stock = 0;

-- 4. Agrupar a quantidade de vendas por Marca por Loja
SELECT 
    s.name AS store,
    b.name AS brand,
    SUM(oi.quantity) AS total_sales
FROM OrderItems oi
JOIN Orders o ON o.id = oi.order_id
JOIN Products p ON p.id = oi.product_id
JOIN Brands b ON b.id = p.brand_id
JOIN Stores s ON s.id = o.store_id
GROUP BY s.name, b.name
ORDER BY s.name, b.name;

-- 5. Listar os Funcionários que não estejam relacionados a um Pedido
SELECT e.*
FROM Employees e
LEFT JOIN Orders o ON o.employee_id = e.id
WHERE o.id IS NULL;
