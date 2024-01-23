-- What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT TOP 1
  m.product_name AS most_purchased_item,
  COUNT(s.product_id) AS purchase_count
FROM
  sales s
JOIN
  menu m ON m.product_id = s.product_id
GROUP BY
  m.product_name
ORDER BY
  purchase_count DESC;
