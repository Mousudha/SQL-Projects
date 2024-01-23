-- Which item was purchased just before the customer became a member?

WITH RankedPurchases AS (
  SELECT
    s.customer_id,
	me.join_date,
	s.order_date,
    m.product_name,
    RANK() OVER (PARTITION BY s.customer_id ORDER BY s.order_date DESC) AS rn
  FROM
    sales s
  JOIN
    menu m ON s.product_id = m.product_id
  JOIN
    members me ON s.customer_id = me.customer_id AND
	s.order_date < me.join_date
)

SELECT
  r.customer_id,
  r.product_name AS last_item_before_join
FROM
  RankedPurchases r
WHERE
  rn = 1
ORDER BY
  r.customer_id;
