-- Qual é o total de vendas realizadas na categoria 'utilidades_domesticas' ao longo de um período de tempo específico?

--SELECT
--	STRFTIME('%m', ood.order_purchase_timestamp) AS mes,
--	STRFTIME('%Y', ood.order_purchase_timestamp) AS ano,
--	COUNT(*) AS numero_compras
--FROM
--	olist_orders_dataset AS ood 
--	INNER JOIN olist_order_items_dataset AS ooid
--		ON ood.order_id = ooid.order_id 
--	INNER JOIN olist_products_dataset AS opd
--		ON ooid.product_id = opd.product_id
--WHERE opd.product_category_name = 'utilidades_domesticas'
--GROUP BY ano, mes
--ORDER BY ano, mes

SELECT
	STRFTIME('%Y-%m', ood.order_purchase_timestamp) AS data_referencia,
	COUNT(*) AS numero_compras
FROM
	olist_orders_dataset AS ood 
	INNER JOIN olist_order_items_dataset AS ooid
		ON ood.order_id = ooid.order_id 
	INNER JOIN olist_products_dataset AS opd
		ON ooid.product_id = opd.product_id
WHERE opd.product_category_name = 'utilidades_domesticas'
GROUP BY data_referencia
ORDER BY data_referencia