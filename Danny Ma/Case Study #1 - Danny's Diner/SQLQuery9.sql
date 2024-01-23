-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

SELECT DISTINCT
	s.customer_id,
	SUM(
	CASE
		WHEN m.product_name = 'sushi' THEN 2 * 10 * m.price
		ELSE 10 * m.price
	END
	) OVER (PARTITION BY s.customer_id) AS total_points
FROM
  sales s
JOIN
  menu m ON s.product_id = m.product_id
ORDER BY
  s.customer_id;