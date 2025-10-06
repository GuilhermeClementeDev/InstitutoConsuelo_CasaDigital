/*
 Lista de Exercícios – SQL com Dataset juliaostore.sql
📌 Parte 1 – Consultas Básicas
Liste todos os clientes cadastrados. 💡 Dica: SELECT simples na tabela Clientes
Liste todos os produtos da categoria "Acessórios". 💡 Dica: WHERE com filtro de categoria
Mostre todos os pedidos feitos por Ana Silva. 💡 Dica: JOIN entre Clientes e Pedidos + filtro no nome

📌 Parte 2 – Consultas Intermediárias
Exiba o valor total de cada pedido. 💡 Dica: Preciso multiplicar quantidade × preço, depois somar por pedido 🤔 Quais tabelas conectar? Pedidos → ItensPedido → Produtos
Traga o total gasto por cada cliente. 💡 Dica: Expandir a consulta anterior agrupando por cliente
Mostre os produtos mais vendidos em quantidade. 💡 Dica: SUM(Quantidade) GROUP BY Produto + ORDER BY DESC

📌 Parte 3 – Consultas Avançadas
Liste os clientes que já compraram mais de um tipo diferente de produto. 💡 Dica: COUNT(DISTINCT ProdutoID) > 1
Mostre os pedidos cujo valor total foi acima de R$ 3000. 💡 Dica: Use a consulta do exercício 4 + HAVING
Calcule o ticket médio dos clientes (média de valor gasto por pedido). 💡 Dica: AVG() da soma dos subtotais
Liste os clientes que nunca fizeram pedidos. 💡 Dica: LEFT JOIN + WHERE campo IS NULL

🎯 Desafios Extras (Para os Ninjas!)
Qual produto gerou mais receita total?
Quantos clientes compraram em setembro de 2025?
Qual a diferença entre o maior e menor ticket de pedido?
*/

-- PARTE 1
--1 Liste todos os clientes cadastrados.
SELECT *
FROM clientes;
-- 2 Liste todos os produtos da categoria "Acessórios"
SELECT *
FROM Produtos
WHERE Produtos.Categoria = 'Acessórios';
-- 3 Mostre todos os pedidos feitos por Ana Silva.
SELECT p.PedidoID,
	   c.Nome,
	   p.DataPedido
FROM Pedidos p
JOIN Clientes c ON c.ClienteID = p.ClienteID
WHERE c.Nome = 'Ana Silva';

-- PARTE 2
-- Exiba o valor total de cada pedido.
SELECT p.PedidoID,
	   SUM(i.Quantidade * pr.Preco) AS total
FROM Pedidos p
JOIN ItensPedido i ON i.PedidoID = p.PedidoID
JOIN Produtos pr ON i.ProdutoID = pr.ProdutoID
GROUP BY p.PedidoID;
-- Traga o total gasto por cada cliente.
SELECT c.ClienteID,
	   c.Nome,
	   SUM(i.Quantidade * pr.Preco) AS total
FROM Clientes c
JOIN Pedidos p ON p.ClienteID = c.ClienteID
JOIN ItensPedido i ON i.PedidoID = p.PedidoID
JOIN Produtos pr ON i.ProdutoID = pr.ProdutoID
GROUP BY c.ClienteID;
-- Mostre os produtos mais vendidos em quantidade.
SELECT p.ProdutoID,
	   p.Nome,
	   p.Preco,
	   SUM(i.Quantidade) AS Mais_Vendidos
FROM Produtos p
JOIN ItensPedido i ON p.ProdutoID = i.ProdutoID
GROUP BY p.ProdutoID
ORDER BY Mais_Vendidos DESC;

-- Parte 3
-- Liste os clientes que já compraram mais de um tipo diferente de produto.
SELECT c.ClienteID,
	   c.Nome,
	   COUNT(DISTINCT i.ProdutoID) AS Produtos_Diferentes
FROM Clientes c
JOIN Pedidos p ON p.ClienteID = c.ClienteID
JOIN ItensPedido i ON i.PedidoID = p.PedidoID
GROUP BY c.ClienteID
HAVING COUNT(DISTINCT i.ProdutoID) > 1;
-- Having (contendo alguma condição), Bom para usar dps de um orderby
-- Mostre os pedidos cujo valor total foi acima de R$ 3000.
SELECT p.PedidoID,
	   SUM(i.Quantidade * pr.Preco) AS total
FROM Pedidos p
JOIN ItensPedido i ON i.PedidoID = p.PedidoID
JOIN Produtos pr ON i.ProdutoID = pr.ProdutoID
GROUP BY p.PedidoID
HAVING SUM(i.Quantidade * pr.Preco) > 3000;
--Calcule o ticket médio dos clientes (média de valor gasto por pedido).
WITH total AS (
	SELECT p.PedidoID,
	   SUM(i.Quantidade * pr.Preco) AS total
	FROM Pedidos p
	JOIN ItensPedido i ON i.PedidoID = p.PedidoID
	JOIN Produtos pr ON i.ProdutoID = pr.ProdutoID
	GROUP BY p.PedidoID
)
SELECT AVG(total) AS Ticket_Médio
FROM total;
/* CTE Common Table Expression
É uma query tempóraria, que é criada antes da query principal.
Como se fosse uma tabela virtual que existe apenas enquanto a query roda.

Pq usar:
Muito bom para organizar queries complexas
Para reutilziar dados intermediarios
Substitui consultas aninhadas, deixando o codigo mais legivel
*/
--Liste os clientes que nunca fizeram pedidos.
SELECT DISTINCT c.ClienteID,
				c.Nome
FROM Clientes c
LEFT JOIN Pedidos p ON c.ClienteID = p.ClienteID
WHERE p.ClienteID IS NULL;
