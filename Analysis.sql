-- Combine the menu_items and order_details tables into a single table
SELECT *
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id;

-- 2. What were the least and most ordered items? what categproes were they in?
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY 3 DESC;

-- 3. What were the top 5 orders that spend the most money?
SELECT order_id, SUM(price) AS total_price
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY 2 DESC
LIMIT 5;

-- 4. Wiew the detasils of the highest spend order. What insights can you gather from this?
SELECT category, COUNT(item_id) AS num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY Category;

-- 5. Wiew the details of the top 5 highest spend orders. What insights can you gather from this?
SELECT category, order_id, COUNT(item_id) AS num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY category, order_id;
