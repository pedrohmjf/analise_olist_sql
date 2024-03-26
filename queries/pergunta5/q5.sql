-- Qual é a média móvel de vendas diárias ao longo de um período de tempo específico para cada vendedor?

WITH aux AS (
	SELECT ooid.seller_id AS vendedor, STRFTIME('%d-%m-%Y', ood.order_purchase_timestamp) AS data_compra, COUNT(1) AS num_vendas
	FROM
		olist_order_items_dataset AS ooid 
		LEFT JOIN olist_orders_dataset AS ood 
			ON ooid.order_id = ood.order_id
	GROUP BY vendedor, data_compra
)

SELECT
	vendedor,
	data_compra,
	AVG(num_vendas) OVER(
		PARTITION BY vendedor
		ORDER BY data_compra
		ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING
	) AS media_movel_vendas
FROM aux