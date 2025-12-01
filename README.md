# iStore-Pedidos-BD
Implementação SQL do sistema de pedidos de iPhones.
# 💻 Sistema de Pedidos de iPhones (iStore Delivery)

**Projeto:** Experiência Prática IV - Implementação e Manipulação de Dados
**Disciplina:** Modelagem de Banco de Dados

## Objetivo do Projeto

Este projeto implementa o modelo lógico de um sistema de e-commerce e logística especializado na venda de iPhones (Mini-mundo: iStore Delivery). O foco é garantir a integridade dos dados e a correta aplicação das Formas Normais (3FN) via comandos SQL.

## 💾 Estrutura e Scripts

O repositório contém 8 tabelas modeladas para o sistema. Os scripts devem ser executados **em ordem numérica**.

| Arquivo | Tipo de Comando | Função |
| :--- | :--- | :--- |
| **01_estrutura_ddl.sql** | DDL (Data Definition Language) | **CRIA** todas as 8 tabelas (CLIENTE, PEDIDO, SKUP, etc.) e define as chaves primárias e estrangeiras (Integridade Referencial). |
| **02_insercao_dados_dml.sql** | DML (Data Manipulation Language) | **INSERE** dados iniciais de teste (clientes, produtos, pedidos) em todas as tabelas. |
| **03_consultas_dml.sql** | DML (SELECT) | **EXECUTA CONSULTAS** complexas (usando JOIN, WHERE, ORDER BY e GROUP BY) para extrair informações do negócio (Ex: Clientes de alto valor). |
| **04_manipulacao_dml.sql** | DML (UPDATE / DELETE) | **MANIPULA** os dados existentes, demonstrando comandos de atualização de status e exclusão com condições, respeitando as restrições do modelo. |

## Instruções de Execução

1. Crie um novo esquema (database) no seu SGBD (MySQL, PostgreSQL ou similar).
2. Execute o script **`01_estrutura_ddl.sql`** para construir a estrutura.
3. Execute o script **`02_insercao_dados_dml.sql`** para popular as tabelas.
4. Execute os scripts **`03_consultas_dml.sql`** e **`04_manipulacao_dml.sql`** para testar as funcionalidades DML.
