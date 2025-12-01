-- MANIPULAÇÃO DML (UPDATE e DELETE)

-- 1. UPDATES (3 Comandos)

-- A. Atualizar o status de um pedido específico de 'Em Processamento' para 'Faturado'.
UPDATE PEDIDO
SET ped_status = 'Faturado'
WHERE ped_id = 2 AND ped_status = 'Em Processamento';

-- B. Corrigir o preço de venda de um SKUP específico (Ajuste no preço do iPhone 15 Pro 256GB).
UPDATE SKUP
SET sku_preco_venda = 10199.00
WHERE sku_id = 1;

-- C. Mudar o email de um cliente específico (João Silva).
UPDATE CLIENTE
SET cli_email = 'joao.silva.novo@email.com'
WHERE cli_id = 1;

-- 2. DELETES (3 Comandos)

-- A. Excluir o registro do serviço Apple Care+ da tabela PEDIDO_SERVICO (para o Pedido 1).
-- Este comando garante a integridade, pois o serviço continua existindo na tabela SERVICO.
DELETE FROM PEDIDO_SERVICO
WHERE ps_ped_id = 1 AND ps_serv_id = 5;

-- B. Excluir um endereço secundário do cliente (Supondo que end_id = 3 seja o endereço secundário do cliente João).
DELETE FROM ENDERECO
WHERE end_id = 3 AND cli_id = 1;

-- C. Excluir o registro de um cliente que nunca fez um pedido (ID = 3).
DELETE FROM CLIENTE
WHERE cli_id = 3 AND cli_id NOT IN (SELECT cli_id FROM PEDIDO);