/*
Identifique todos os problemas desta tabela
-Anotem qual forma normal cada problema viola
*/

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
/*
1FN
TelefonesContato VARCHAR(200) -> multiplos valores (uma lista)
ProdutoCategoria VARCHAR(50) -> multiplos possiveis valores (um produto pode ter mais de uma categoria)

2FN
Dados do client, produto dentro da tabela pedidos, e vendedor(Dados independentes que devem ser relacionados posteriormente na tabela pedido)

3FN
*/

-- Minha versão

CREATE TABLE Vendedores(
	VendedorID SERIAL PRIMARY KEY,
	NomeVendedor VARCHAR(100),
	PorcentagemVenda DECIMAL(5, 2)
	-- Caso tenha maus algum dado entra aqui
)

CREATE TABLE Pedidos(
	PedidoID SERIAL PRIMARY KEY,
	Quantidade INT,
	DataPedido DATE,
	Cliente INT REFERENCES Clientes(ClienteID),
	Vendedor INT REFERENCES Vendedores(VendedorID)
)

CREATE TABLE ProdutoPedidos(
	ProdutoPedidoID SERIAL PRIMARY KEY,
	Produto INT REFERENCES Produtos(ProdutoID),
	Pedido INT REFERENCES Pedidos(PedidoID)
)

CREATE TABLE Categorias(
	CategoriaID SERIAL PRIMARY KEY,
	Categoria VARCHAR(60)
)

CREATE TABLE ProdutoCategoria(
	ProdutoCategoriaID SERIAL PRIMARY KEY,
	Produto INT REFERENCES Produtos(ProdutoID),
	Categoria INT REFERENCES Categorias(CategoriaID)
)

CREATE TABLE Produtos(
	ProdutoID SERIAL PRIMARY KEY,
	ProdutoNome VARCHAR(100),
	ProdutoPreco DECIMAL(10, 2)
)

CREATE TABLE Enderecos(
	EnderecoID SERIAL PRIMARY KEY,
	ClienteCidade VARCHAR(80),
	ClienteEstado VARCHAR(2),
	ClientCEP VARCHAR(10) UNIQUE
)

CREATE TABLE Clientes(
	ClientID SERIAL PRIMARY KEY,
	ClienteNome VARCHAR(100) NOT NULL,
	ClienteEmail VARCHAR(60) UNIQUE NOT NULL,
	Cliente_endereco INT REFERENCES Enderecos(EnderecoID)
)

CREATE TABLE TelefoneCliente(
	TelefoneClienteID SERIAL PRIMARY KEY,
	Telefone VARCHAR(11),
	Cliente INT REFERENCES Clientes(ClienteID)
)
