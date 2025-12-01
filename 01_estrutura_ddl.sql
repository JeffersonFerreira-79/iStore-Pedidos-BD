-- DDL: CRIAÇÃO DA ESTRUTURA DO BANCO DE DADOS

-- 1. CRIAÇÃO DA TABELA CLIENTE
CREATE TABLE CLIENTE (
    cli_id INT PRIMARY KEY AUTO_INCREMENT,
    cli_nome VARCHAR(100) NOT NULL,
    cli_email VARCHAR(150) UNIQUE NOT NULL,
    cli_cpf CHAR(11) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL
);

-- 2. CRIAÇÃO DA TABELA ENDERECO
CREATE TABLE ENDERECO (
    end_id INT PRIMARY KEY AUTO_INCREMENT,
    cli_id INT NOT NULL,
    end_logradouro VARCHAR(150) NOT NULL,
    end_cep CHAR(8) NOT NULL,
    end_cidade VARCHAR(50) NOT NULL,
    FOREIGN KEY (cli_id) REFERENCES CLIENTE(cli_id)
);

-- 3. CRIAÇÃO DA TABELA MODELO_IPHONE (PRODUTO GERAL)
CREATE TABLE MODELO_IPHONE (
    mod_id INT PRIMARY KEY AUTO_INCREMENT,
    mod_nome VARCHAR(50) UNIQUE NOT NULL,
    mod_ano INT NOT NULL
);

-- 4. CRIAÇÃO DA TABELA SKUP (VARIAÇÃO DO PRODUTO)
CREATE TABLE SKUP (
    sku_id INT PRIMARY KEY AUTO_INCREMENT,
    mod_id INT NOT NULL,
    sku_capacidade INT NOT NULL,
    sku_cor VARCHAR(30) NOT NULL,
    sku_preco_venda DECIMAL(10, 2) NOT NULL CHECK (sku_preco_venda > 0),
    estoque_atual INT NOT NULL DEFAULT 0,
    FOREIGN KEY (mod_id) REFERENCES MODELO_IPHONE(mod_id)
);

-- 5. CRIAÇÃO DA TABELA PEDIDO
CREATE TABLE PEDIDO (
    ped_id INT PRIMARY KEY AUTO_INCREMENT,
    cli_id INT NOT NULL,
    end_id INT NOT NULL,
    ped_data DATETIME NOT NULL,
    ped_status VARCHAR(30) NOT NULL,
    ped_valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cli_id) REFERENCES CLIENTE(cli_id),
    FOREIGN KEY (end_id) REFERENCES ENDERECO(end_id)
);

-- 6. CRIAÇÃO DA TABELA ITEM_PEDIDO (N:N entre PEDIDO e SKUP)
CREATE TABLE ITEM_PEDIDO (
    ip_ped_id INT,
    ip_sku_id INT,
    ip_quantidade INT NOT NULL CHECK (ip_quantidade > 0),
    ip_preco_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ip_ped_id, ip_sku_id),
    FOREIGN KEY (ip_ped_id) REFERENCES PEDIDO(ped_id),
    FOREIGN KEY (ip_sku_id) REFERENCES SKUP(sku_id)
);

-- 7. CRIAÇÃO DA TABELA SERVICO
CREATE TABLE SERVICO (
    serv_id INT PRIMARY KEY AUTO_INCREMENT,
    serv_nome VARCHAR(50) UNIQUE NOT NULL,
    serv_preco DECIMAL(10, 2) NOT NULL
);

-- 8. CRIAÇÃO DA TABELA PEDIDO_SERVICO (N:N entre PEDIDO e SERVICO)
CREATE TABLE PEDIDO_SERVICO (
    ps_ped_id INT,
    ps_serv_id INT,
    ps_data_contratacao DATE NOT NULL,
    PRIMARY KEY (ps_ped_id, ps_serv_id),
    FOREIGN KEY (ps_ped_id) REFERENCES PEDIDO(ped_id),
    FOREIGN KEY (ps_serv_id) REFERENCES SERVICO(serv_id)
);