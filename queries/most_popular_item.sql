SELECT customer_id, product_name
FROM (
  SELECT s.customer_id, m.product_name, COUNT(*) AS purchase_count,
         RANK() OVER (PARTITION BY s.customer_id ORDER BY COUNT(*) DESC) AS rnk
  FROM sales s
  JOIN menu m ON s.product_id = m.product_id
  GROUP BY s.customer_id, m.product_name
) ranked
WHERE rnk = 1;
