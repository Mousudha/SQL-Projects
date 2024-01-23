-- What is the total amount each customer spent at the restaurant?

SELECT
  s.customer_id,
  SUM(m.price) AS total_amount_spent
FROM
  sales s
JOIN
  menu m ON s.product_id = m.product_id
GROUP BY
  s.customer_id
ORDER BY
  s.customer_id	;
