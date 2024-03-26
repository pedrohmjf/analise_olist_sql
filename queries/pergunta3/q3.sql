-- Qual é o valor médio de compra por cliente nos diferentes estados do Brasil?

WITH aux AS (
	SELECT
		ocd.customer_state AS estado,
		COUNT(ocd.customer_unique_id) AS numero_clientes,
		SUM(oopd.payment_value) AS receita_total
	FROM
		olist_customers_dataset AS ocd
		INNER JOIN olist_orders_dataset AS ood
			ON ocd.customer_id = ood.customer_id
		INNER JOIN olist_order_payments_dataset AS oopd
			ON ood.order_id = oopd.order_id
	GROUP BY estado
)

SELECT
	*,
	(receita_total / numero_clientes) AS valor_medio_por_cliente
FROM aux
ORDER BY valor_medio_por_cliente DESC
LIMIT 10