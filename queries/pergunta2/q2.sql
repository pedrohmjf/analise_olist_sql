-- Quais são os 10 produtos mais vendidos em termos de quantidade e receita no ano de 2017?

--SELECT
--	ooid.product_id AS produto,
--	COUNT(*) AS quantidade_vendas
--FROM
--	olist_order_items_dataset AS ooid
--	INNER JOIN olist_orders_dataset AS ood
--		ON ooid.order_id = ood.order_id 
--WHERE STRFTIME('%Y', ood.order_purchase_timestamp) = '2017'
--GROUP BY produto
--ORDER BY quantidade_vendas DESC
--LIMIT 10

SELECT
	ooid.product_id AS produto,
	SUM(ooid.price) AS receita_total
FROM
	olist_order_items_dataset AS ooid
	INNER JOIN olist_orders_dataset AS ood
		ON ooid.order_id = ood.order_id
WHERE STRFTIME('%Y', ood.order_purchase_timestamp) = '2017'
GROUP BY produto
ORDER BY receita_total DESC
LIMIT 10