-- CONSULTAS DML (SELECT, JOIN, WHERE, ORDER BY, LIMIT)

-- Consulta 1: Clientes que compraram modelos 'Pro' e o valor total do pedido.
SELECT
    C.cli_nome,
    P.ped_valor_total,
    M.mod_nome
FROM
    CLIENTE C
JOIN
    PEDIDO P ON C.cli_id = P.cli_id
JOIN
    ITEM_PEDIDO IP ON P.ped_id = IP.ip_ped_id
JOIN
    SKUP S ON IP.ip_sku_id = S.sku_id
JOIN
    MODELO_IPHONE M ON S.mod_id = M.mod_id
WHERE
    M.mod_nome LIKE '%Pro%'
GROUP BY
    C.cli_nome, P.ped_valor_total, M.mod_nome;

-- Consulta 2: Listar todos os SKUs disponíveis do iPhone SE, ordenados por preço.
SELECT
    S.sku_cor,
    S.sku_capacidade,
    S.sku_preco_venda
FROM
    SKUP S
JOIN
    MODELO_IPHONE M ON S.mod_id = M.mod_id
WHERE
    M.mod_nome = 'iPhone SE'
ORDER BY
    S.sku_preco_venda ASC;

-- Consulta 3: Mostrar o tempo médio de um pedido (simulação) em 'Em Processamento'.
SELECT
    TIMESTAMPDIFF(MINUTE, ped_data, NOW()) AS tempo_decorrido_minutos,
    ped_status
FROM
    PEDIDO
WHERE
    ped_status = 'Em Processamento'
ORDER BY
    ped_data DESC
LIMIT 1;

-- Consulta 4: Encontrar clientes que possuem mais de um endereço cadastrado.
SELECT
    C.cli_nome,
    COUNT(E.end_id) AS total_enderecos
FROM
    CLIENTE C
JOIN
    ENDERECO E ON C.cli_id = E.cli_id
GROUP BY
    C.cli_nome
HAVING
    COUNT(E.end_id) > 1;