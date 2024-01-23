-- What is the total items and amount spent for each member before they became a member?

SELECT
	s.customer_id,
	COUNT(s.product_id) AS total_items_purchased,
	SUM(m.price) AS total_amount
FROM
	sales s
JOIN
	members me ON s.customer_id = me.customer_id AND s.order_date < me.join_date
JOIN
	menu m ON s.product_id = m.product_id
GROUP BY
	s.customer_id;
