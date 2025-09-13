-- Добавляем цену в product 
ALTER TABLE product ADD COLUMN IF NOT EXISTS price DOUBLE PRECISION;

-- Переносим цены из product_info в product
UPDATE product 
SET price = pi.price 
FROM product_info pi 
WHERE product.id = pi.product_id;


-- Добавляем дату в orders
ALTER TABLE orders ADD COLUMN IF NOT EXISTS date_created DATE;

-- Переносим даты и статусы из orders_date в orders
UPDATE orders 
SET date_created = od.date_created, 
    status = od.status 
FROM orders_date od 
WHERE orders.id = od.order_id;


-- Удаляем временные таблицы
DROP TABLE IF EXISTS product_info;
DROP TABLE IF EXISTS orders_date;