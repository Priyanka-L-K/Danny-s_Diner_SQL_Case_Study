SELECT s.customer_id, m.product_name
FROM sales s
JOIN menu m ON s.product_id = m.product_id
JOIN members mem ON s.customer_id = mem.customer_id
WHERE s.order_date < mem.join_date
AND s.order_date = (SELECT MAX(order_date) FROM sales s2 WHERE s2.customer_id = s.customer_id AND s2.order_date < mem.join_date);
