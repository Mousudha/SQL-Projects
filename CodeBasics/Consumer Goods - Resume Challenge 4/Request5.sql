/* Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost
*/

SELECT 
	fm.product_code,
    product,
    manufacturing_cost
FROM fact_manufacturing_cost fm
LEFT JOIN dim_product p ON fm.product_code = p.product_code
WHERE manufacturing_cost IN (
								SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost 
									UNION
								SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost) ;

