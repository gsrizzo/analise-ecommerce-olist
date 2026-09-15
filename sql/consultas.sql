USE Olist;
GO

/* =====================================================
   1. VALOR VENDIDO POR ESTADO
   =====================================================
 
   Objetivo:
   Identificar os estados com maior valor vendido em produtos,
   considerando apenas pedidos entregues.*/

SELECT 
	clientes.customer_state,
	SUM(itens.price) AS valor_vendido
FROM itens
INNER JOIN pedidos
	ON itens.order_id = pedidos.order_id
INNER JOIN clientes
	ON pedidos.customer_id = clientes.customer_id
WHERE pedidos.order_status = 'delivered'
GROUP BY clientes.customer_state
ORDER BY valor_vendido DESC


/* Insight:
 SP apresentou o maior valor vendido em produtos (R$ 5,07 milhões),
 seguido por RJ (R$ 1,76 milhão) e MG (R$ 1,55 milhão).*/


/* =====================================================
   2. TICKET MÉDIO POR ESTADO
   =====================================================

   Objetivo:
   Identificar os estados com maior ticket médio por pedido,
   considerando apenas pedidos entregues.*/

SELECT 
    customer_state,
    COUNT(order_id) AS quantidade_pedidos,
    AVG(valor_pedido) AS ticket_medio
FROM (
    SELECT
        itens.order_id,
        clientes.customer_state,
        SUM(itens.price) AS valor_pedido
    FROM itens
    INNER JOIN pedidos
        ON itens.order_id = pedidos.order_id
    INNER JOIN clientes
        ON pedidos.customer_id = clientes.customer_id
    WHERE pedidos.order_status = 'delivered'
    GROUP BY
        itens.order_id,
        clientes.customer_state
) AS pedidos_por_estado
GROUP BY customer_state
ORDER BY ticket_medio DESC;


/*
Insight:
A Paraíba apresentou o maior ticket médio entre os pedidos entregues,
com aproximadamente R$ 217,77 por pedido. Entretanto, o estado possui
um volume de pedidos consideravelmente menor que mercados como SP, RJ
e MG, portanto o ticket médio deve ser interpretado em conjunto com
a quantidade de pedidos.
*/