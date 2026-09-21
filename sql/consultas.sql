USE Olist;
GO

/* 
=====================================================
1. VALOR VENDIDO POR ESTADO
=====================================================
 
Objetivo:
Identificar os estados com maior valor vendido em produtos,
considerando apenas pedidos entregues.
*/

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
ORDER BY valor_vendido DESC;

/* 
Insight:
SP apresentou o maior valor vendido em produtos (R$ 5,07 milhões),
seguido por RJ (R$ 1,76 milhão) e MG (R$ 1,55 milhão).
*/


/* 
=====================================================
2. TICKET MÉDIO POR ESTADO
=====================================================

Objetivo:
Identificar os estados com maior ticket médio por pedido,
considerando apenas pedidos entregues.
*/

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


/* 
=====================================================
3. CATEGORIAS COM MAIOR VALOR VENDIDO POR ESTADO
=====================================================

Objetivo:
Identificar quais categorias de produtos apresentam maior valor vendido
em cada estado, considerando apenas os pedidos entregues.
*/

SELECT 
    customer_state,
    product_category_name,
    valor_vendido
FROM (
    SELECT
        clientes.customer_state,
        produtos.product_category_name,
        SUM(itens.price) AS valor_vendido,
        ROW_NUMBER() OVER (
            PARTITION BY clientes.customer_state
            ORDER BY SUM(itens.price) DESC) AS posicao
    FROM clientes
    INNER JOIN pedidos
        ON clientes.customer_id = pedidos.customer_id
    INNER JOIN itens
        ON pedidos.order_id = itens.order_id
    INNER JOIN produtos
        ON itens.product_id = produtos.product_id
    WHERE pedidos.order_status = 'delivered'
    GROUP BY
        clientes.customer_state,
        produtos.product_category_name
) AS ranking_categorias
WHERE posicao = 1
ORDER BY customer_state;

/*
Insight:
A categoria beleza_saude apresentou o maior valor vendido em grande parte
dos estados. Outras categorias também se destacaram regionalmente, como
relogios_presentes, esporte_lazer e cama_mesa_banho.

Em São Paulo, cama_mesa_banho foi a categoria com maior valor vendido,
com aproximadamente R$ 472,2 mil.
*/


/* 
=====================================================
4. PRAZO MÉDIO DE ENTREGA POR ESTADO
=====================================================

Objetivo:
Analisar o tempo médio de entrega dos pedidos em cada estado,
considerando apenas os pedidos entregues.
*/

SELECT
    clientes.customer_state,
    ROUND(
        AVG(
            CAST(
                DATEDIFF(
                    DAY,
                    pedidos.order_purchase_timestamp,
                    pedidos.order_delivered_customer_date
                ) AS DECIMAL(10,2)
            )
        ), 2
    ) AS prazo_medio_entrega
FROM pedidos
INNER JOIN clientes
    ON pedidos.customer_id = clientes.customer_id
WHERE pedidos.order_status = 'delivered'
    AND pedidos.order_delivered_customer_date IS NOT NULL
GROUP BY clientes.customer_state
ORDER BY prazo_medio_entrega DESC;

/*
Insight:
Roraima apresentou o maior prazo médio de entrega, com aproximadamente
29,34 dias, seguido por Amapá (27,18 dias) e Amazonas (26,36 dias).

São Paulo apresentou o menor prazo médio entre os estados analisados,
com aproximadamente 8,70 dias.
*/


/*
=====================================================
5. CLIENTES RECORRENTES
=====================================================

Objetivo:
Identificar quantos clientes realizaram mais de uma compra,
considerando apenas os pedidos entregues.
*/

SELECT 
    COUNT(customer_unique_id) AS quantidade_clientes_recorrentes
FROM (
    SELECT
        clientes.customer_unique_id,
        COUNT(pedidos.order_id) AS quantidade_pedidos
    FROM clientes
    INNER JOIN pedidos
        ON clientes.customer_id = pedidos.customer_id
    WHERE pedidos.order_status = 'delivered'
    GROUP BY clientes.customer_unique_id
    HAVING COUNT(pedidos.order_id) > 1
    ) AS clientes_recorrentes;

/*
Insight:
Considerando apenas os clientes que realizaram mais de um pedido entregue,
foram identificados 2.801 clientes recorrentes.
*/