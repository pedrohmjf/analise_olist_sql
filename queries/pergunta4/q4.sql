-- Quais são os vendedores que tiveram o maior número de pedidos cancelados?

SELECT seller_id, COUNT(*) AS numero_cancelamentos
FROM
	olist_order_items_dataset AS ooid
	INNER JOIN olist_orders_dataset AS ood
		ON ooid.order_id = ood.order_id
WHERE ood.order_status = 'canceled'
GROUP BY ooid.seller_id
ORDER BY numero_cancelamentos DESC
LIMIT 10