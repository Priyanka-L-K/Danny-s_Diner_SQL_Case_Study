SELECT s.customer_id, 
       SUM(CASE 
           WHEN s.order_date BETWEEN mem.join_date AND mem.join_date + INTERVAL '6 days' THEN m.price * 20
           WHEN m.product_name = 'sushi' THEN m.price * 20
           ELSE m.price * 10 
       END) AS total_points
FROM sales s
JOIN menu m ON s.product_id = m.product_id
JOIN members mem ON s.customer_id = mem.customer_id
WHERE s.customer_id IN ('A', 'B') AND s.order_date <= '2021-01-31'
GROUP BY s.customer_id;
