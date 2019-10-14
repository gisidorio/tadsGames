/* MER_-_Loja_Games(v2): */
create database dbGames;
use dbGames;
/*drop database dbgames;*/
/* MER_-_Loja_Games(v3): */

CREATE TABLE EstadoRegiao (
    idEstado INTEGER AUTO_INCREMENT PRIMARY KEY,
    uf VARCHAR(2) UNIQUE,
    estado VARCHAR(50),
    capital VARCHAR(50),
    regiao VARCHAR(15),
    pais VARCHAR(2)
);

CREATE TABLE Empresa (
    idEmpresa INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    cnpj VARCHAR(14) UNIQUE,
    dataCriacao DATE,
	idEstado INTEGER NOT NULL,
    matriz BOOLEAN,
    ativo BOOLEAN,
    FOREIGN KEY (idEstado) REFERENCES EstadoRegiao (idEstado)
);

CREATE TABLE Produto (
    idProduto INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    descricao VARCHAR(264),
    tipo VARCHAR(50),
    ativo BOOLEAN
);

CREATE TABLE EmpresaProduto (
    idEmpresa INTEGER,
    idProduto INTEGER,
    PRIMARY KEY (idEmpresa, idProduto),
    FOREIGN KEY (idEmpresa) REFERENCES Empresa (idEmpresa),
    FOREIGN KEY (idProduto) REFERENCES Produto (idProduto)
);

CREATE TABLE Cliente (
	idCliente INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    cpf VARCHAR(11),
    dtNasc VARCHAR (8),
    ativo boolean
);

CREATE TABLE Estoque (
    idEstoque INTEGER AUTO_INCREMENT PRIMARY KEY,
    qtdEstoque INTEGER,
    valorVendaUnitario float,
    idProduto INTEGER,
    FOREIGN KEY (idProduto) REFERENCES Produto (idProduto)    
);

CREATE TABLE Compra (
    idCompra INTEGER AUTO_INCREMENT PRIMARY KEY,
    dataEntrada DATE,
    qtdComprada INTEGER,
    valorCompraUnitario float,
    idEmpresa INTEGER,
    FOREIGN KEY (idEmpresa) REFERENCES Empresa (idEmpresa)
);



CREATE TABLE Pedido (
    idPedido INTEGER AUTO_INCREMENT PRIMARY KEY,
    valorTotal float,
    dataSolicitaco INTEGER,
    dataFinalizacao DATE,
    statusPedido VARCHAR(20),
    Servico BOOLEAN,
    idCliente integer,
    FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente)
    
);
CREATE TABLE DetalheProduto (
    idPedido INTEGER,
    idProduto INTEGER,
    qtdVenda INTEGER,
    vlrVenda float,
    PRIMARY KEY (idPedido, idProduto),
	FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido),
    FOREIGN KEY (idProduto) REFERENCES Produto (idProduto)
);



CREATE TABLE Funcionario (
    idFuncionario INTEGER AUTO_INCREMENT PRIMARY KEY,
    idEmpresa INTEGER,
    nome VARCHAR(50),
    sobrenome VARCHAR(30),
    sexo VARCHAR(12),
    cpf VARCHAR(11) UNIQUE,
    dtNasc DATE,
    ativo BOOLEAN,
    login VARCHAR(50),
    senha VARCHAR(20),
    salario float,
    cargo VARCHAR(50),
    departamento VARCHAR(50),
    FOREIGN KEY (idEmpresa) REFERENCES Empresa (idEmpresa)    
);

CREATE TABLE Usuario (
    idUsuario INTEGER AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50),
    senha VARCHAR(16),
    idFuncionario INTEGER,
    ativo BOOLEAN,
    UNIQUE (email, idFuncionario),
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario (idFuncionario)
);

CREATE TABLE Servicos (
    idServicos INTEGER AUTO_INCREMENT PRIMARY KEY,
    nomeServico VARCHAR(50),
    descricao text,
    ativo BOOLEAN,
    valorServico FLOAT
);

CREATE TABLE DetalheServico (
    idServico INTEGER,
    idPedido INTEGER,
    valorServico FLOAT,
    PRIMARY KEY (idServico, idPedido),
    FOREIGN KEY (idPedido) REFERENCES Pedido (idPedido),
    FOREIGN KEY (idServico) REFERENCES Servicos (idServicos)
);


Select * from Produto ;
Insert into Produto (idProduto, nome, descricao, tipo, ativo) Values (1, 'Dragon Ball Xenoverse: 2', 'Sequencia de Dragon Ball Xenoverse', 'Jogo', true)

