SELECT s.customer_id, m.product_name
FROM sales s
JOIN menu m ON s.product_id = m.product_id
WHERE s.order_date = (SELECT MIN(order_date) FROM sales s2 WHERE s2.customer_id = s.customer_id);
