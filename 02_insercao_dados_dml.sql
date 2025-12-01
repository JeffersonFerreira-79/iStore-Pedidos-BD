-- DML: INSERÇÃO DE DADOS (INSERT)

-- 1. CLIENTE
INSERT INTO CLIENTE (cli_nome, cli_email, cli_cpf, data_cadastro) VALUES
('João Silva', 'joao.silva@email.com', '12345678901', '2025-10-01'),
('Maria Santos', 'maria.santos@email.com', '98765432109', '2025-10-15'),
('Pedro Alvares', 'pedro.alvares@email.com', '55544433322', '2025-11-20');

-- 2. ENDERECO
INSERT INTO ENDERECO (cli_id, end_logradouro, end_cep, end_cidade) VALUES
(1, 'Rua das Flores, 100', '01000100', 'São Paulo'),
(2, 'Av. Principal, 500, Bloco B', '90000900', 'Porto Alegre'),
(1, 'Rua Secundária, 30', '01000200', 'São Paulo'); -- Cliente João tem 2 endereços

-- 3. MODELO_IPHONE
INSERT INTO MODELO_IPHONE (mod_nome, mod_ano) VALUES
('iPhone 15 Pro', 2024),
('iPhone SE', 2022);

-- 4. SKUP (VARIAÇÕES)
INSERT INTO SKUP (mod_id, sku_capacidade, sku_cor, sku_preco_venda, estoque_atual) VALUES
(1, 256, 'Titânio Natural', 9999.00, 50),
(1, 512, 'Titânio Preto', 11999.00, 30),
(2, 64, 'Estelar', 4299.00, 120),
(1, 256, 'Película Protetora', 150.00, 500); -- SKU genérico para acessorio vendido

-- 5. SERVICO
INSERT INTO SERVICO (serv_nome, serv_preco) VALUES
('Apple Care+ (2 Anos)', 1599.00);

-- 6. PEDIDO
INSERT INTO PEDIDO (cli_id, end_id, ped_data, ped_status, ped_valor_total) VALUES
(1, 1, '2025-11-25 10:30:00', 'Faturado', 11999.00), -- Pedido 1 (João)
(2, 2, '2025-11-26 14:00:00', 'Em Processamento', 4449.00); -- Pedido 2 (Maria)

-- 7. ITEM_PEDIDO (Associação de produtos/acessórios ao pedido)
INSERT INTO ITEM_PEDIDO (ip_ped_id, ip_sku_id, ip_quantidade, ip_preco_unitario) VALUES
(1, 2, 1, 11999.00), -- Pedido 1: 1x iPhone 15 Pro 512GB
(2, 3, 1, 4299.00), -- Pedido 2: 1x iPhone SE 64GB
(2, 4, 1, 150.00); -- Pedido 2: 1x Película Protetora

-- 8. PEDIDO_SERVICO (Associação de serviços ao pedido)
INSERT INTO PEDIDO_SERVICO (ps_ped_id, ps_serv_id, ps_data_contratacao) VALUES
(1, 5, '2025-11-25'); -- Pedido 1 contrata Apple Care+