CREATE TABELE PedidosProblematicos(
	PedidoID INT,
	ClienteNome VARCHAR(100),
	ClienteEmail VARCHAR(100),
	ClienteCidade VARCHAR(50),
	ClienteEstado VARCHAR(2),
	ClientCEP VARCHAR(10),
	ProdutoNome VARCHAR(100),
	ProdutoCategoria VARCHAR(50),
	ProdutoPreco DECIMAL(10, 2),
	Quantidade INT,
	DataPedido DATE,
	TelefonesContato VARCHAR(200),
	NomeVendedor VARCHAR(100),
	ComissaoVendedor DECIMAL(5, 2),
	EnderecoCompleto VARCHAR(300)
)



-- Minha versão

CREATE TABLE Vendedores(
	VendedorID SERIAL PRIMARY KEY,
	NomeVendedor VARCHAR(100),
	PorcentagemVenda DECIMAL(5, 2)
	-- Caso tenha maus algum dado entra aqui
);

CREATE TABLE Pedidos(
	PedidoID SERIAL PRIMARY KEY,
	Quantidade INT,
	DataPedido DATE,
	Cliente INT REFERENCES Clientes(ClienteID),
	Vendedor INT REFERENCES Vendedores(VendedorID)
);

CREATE TABLE ProdutoPedidos(
	ProdutoPedidoID SERIAL PRIMARY KEY,
	Produto INT REFERENCES Produtos(ProdutoID),
	Pedido INT REFERENCES Pedidos(PedidoID)
);

CREATE TABLE Categorias(
	CategoriaID SERIAL PRIMARY KEY,
	Categoria VARCHAR(60)
);

CREATE TABLE ProdutoCategoria(
	ProdutoCategoriaID SERIAL PRIMARY KEY,
	Produto INT REFERENCES Produtos(ProdutoID),
	Categoria INT REFERENCES Categorias(CategoriaID)
);

CREATE TABLE Produtos(
	ProdutoID SERIAL PRIMARY KEY,
	ProdutoNome VARCHAR(100),
	ProdutoPreco DECIMAL(10, 2)
);

CREATE TABLE Enderecos(
	EnderecoID SERIAL PRIMARY KEY,
	ClienteCidade VARCHAR(80),
	ClienteEstado VARCHAR(2),
	ClientCEP VARCHAR(10) UNIQUE
);

CREATE TABLE Clientes(
	ClientID SERIAL PRIMARY KEY,
	ClienteNome VARCHAR(100) NOT NULL,
	ClienteEmail VARCHAR(60) UNIQUE NOT NULL,
	Cliente_endereco INT REFERENCES Enderecos(EnderecoID)
);

CREATE TABLE TelefoneCliente(
	TelefoneClienteID SERIAL PRIMARY KEY,
	Telefone VARCHAR(11),
	Cliente INT REFERENCES Clientes(ClienteID)
);

/*02 Criando Desnormalização
Objetivo criar um relatorio de vendas
*/

CREATE TABLE RelatorioVendas (
	PedidoID INT,
	DataPedido DATE,
	ClienteNome VARCHAR(100),
	ProdutoNome VARCHAR(100),
	ProdutoPreco DECIMAL(10, 2),
	NomeVendedor VARCHAR(100)
);
/* Adicionei dados que achei mais relevantes, essa tabela terá dados 'repetidos.
 Exemplo: Juninho comprou uma bala e uma caneta
 na tabela ficara uma linha para a bala e uma para a caneta.
*/

-- Exemplo de Views

CREATE VIEW RelatorioVendas AS
SELECT Pedidos.PedidoID, Pedidos.DataPedido, Clientes.ClienteNome, Produtos.ProdutoNome, Produtos.ProdutoPreco, Vendedores.NomeVendedor
FROM Pedidos
JOIN Clientes ON Pedidos.Cliente = Clientes.ClientID
JOIN ProdutoPedidos ON ProdutoPedidos.Pedido = Pedidos.PedidoID
JOIN Produtos ON ProdutoPedidos.Produto = Produtos.ProdutoID
JOIN Vendedores ON Pedidos.Vendedor = Vendedores.VendedorID;


-- Dataset do Julio

Selecionar todos os cliente cadastrados
SELECT *
FROM clientes;

Selecionar todos os produtos que a categoria = Acessórios
SELECT *
FROM Produtos
WHERE Categoria = 'Acessórios';

Selecionar todos os pedidos da ana
SELECT *
FROM Pedidos
JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID
WHERE Clientes.Nome = 'Ana Silva';

Selecionar Valor de cada Pedido
SELECT Pedidos.PedidoID,
SUM (Produtos.Preco * ItensPedido.Quantidade) AS total
FROM Pedidos
JOIN ItensPedido ON ItensPedido.PedidoID = Pedidos.PedidoID
JOIN Produtos ON Produtos.ProdutoID = ItensPedido.ProdutoID
GROUP BY Pedidos.PedidoID;

Query de quantidade de gasto por clientes
SELECT Clientes.ClienteID, Clientes.Nome,
SUM (Produtos.Preco * ItensPedido.Quantidade) AS total
FROM Clientes
JOIN Pedidos ON Pedidos.ClienteID = Clientes.ClienteID
JOIN ItensPedido ON ItensPedido.PedidoID = Pedidos.PedidoID
JOIN Produtos ON Produtos.ProdutoID = ItensPedido.ProdutoID
GROUP BY Clientes.ClienteID;
