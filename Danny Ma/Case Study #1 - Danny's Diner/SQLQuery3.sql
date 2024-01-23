-- What was the first item from the menu purchased by each customer?

WITH RankedPurchases AS (
  SELECT
    s.customer_id,
    m.product_name,
    RANK() OVER (PARTITION BY s.customer_id ORDER BY s.order_date) AS rn
  FROM
    sales s
  JOIN
    menu m ON s.product_id = m.product_id
)

SELECT
  customer_id,
  product_name AS first_purchased_item
FROM
  RankedPurchases
WHERE
  rn = 1
ORDER BY
  customer_id;
