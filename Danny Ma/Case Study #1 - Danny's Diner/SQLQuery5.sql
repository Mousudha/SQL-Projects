-- Which item was the most popular for each customer?

WITH PopularItems AS (
  SELECT
    s.customer_id,
    m.product_name,
    COUNT(s.product_id) AS purchase_count,
	RANK() OVER (PARTITION BY s.customer_id ORDER BY COUNT(s.product_id) DESC) AS rn
  FROM
    sales s
  JOIN
    menu m ON s.product_id = m.product_id
  GROUP BY
    s.customer_id, m.product_name
)

SELECT
  customer_id,
  product_name AS most_popular_item
FROM
  PopularItems
WHERE
  rn = 1
ORDER BY
  customer_id;
