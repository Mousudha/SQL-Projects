-- In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

SELECT
  s.customer_id,
  SUM(
	CASE
        WHEN s.order_date BETWEEN me.join_date AND DATEADD(day, 6, me.join_date) THEN 2 * 10 * m.price
        ELSE 10 * m.price
    END
	) AS total_points
FROM
  sales s
JOIN
  menu m ON s.product_id = m.product_id
JOIN
  members me ON s.customer_id = me.customer_id
WHERE
	s.order_date <= '2021-01-31'
GROUP BY
  s.customer_id;
