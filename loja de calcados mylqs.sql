
-- Cria a base de dados
CREATE DATABASE loja_de_Calcados;

-- Seleciona a base de dados a ser usada
USE loja_de_Calcados;

-- Cria a tabela Fornecedores
CREATE TABLE Fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(100) NOT NULL,
    contato VARCHAR(100),
    telefone VARCHAR(15),
    endereco VARCHAR(200)
);-- Insere dados na tabela Fornecedores
INSERT INTO Fornecedores (nome_fornecedor, contato, telefone, endereco) VALUES
('Fornecedora A', 'Maria Silva', '11-987654321', 'Rua Exemplo, 123, São Paulo'),
('Fornecedora B', 'João Souza', '21-912345678', 'Avenida Teste, 456, Rio de Janeiro'),
('Fornecedora C', 'Ana Costa', '31-998765432', 'Praça Modelo, 789, Belo Horizonte');

-- Cria a tabela Produtos
CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    tamanho VARCHAR(10),  -- Ex: 38, 39, 40, etc.
    cor VARCHAR(50),
    id_fornecedor INT,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

-- Insere dados na tabela Produtos
INSERT INTO Produtos (nome_produto, tamanho, cor, id_fornecedor, preco, quantidade_estoque) VALUES
('Tênis Esportivo', '42', 'Preto', 1, 199.90, 50),
('Sandália Casual', '37', 'Bege', 2, 89.90, 30),
('Bota de Couro', '39', 'Marrom', 3, 299.90, 20);

-- Cria a tabela Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(15),
    data_nascimento DATE
);

-- Insere dados na tabela Clientes
INSERT INTO Clientes (nome_cliente, email, telefone, data_nascimento) VALUES
('Carlos Pereira', 'carlos@gmail.com', '11-912345678', '1985-08-12'),
('Fernanda Lima', 'fernanda@hotmail.com', '21-998765432', '1990-05-30'),
('Marcos Oliveira', 'marcos@yahoo.com', '31-987654321', '1988-03-15');

-- Cria a tabela Vendas
CREATE TABLE Vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    data_venda DATE,
    quantidade INT,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- Insere dados na tabela Vendas
INSERT INTO Vendas (id_cliente, id_produto, data_venda, quantidade, total) VALUES
(1, 1, '2024-08-17', 2, 399.80),
(2, 2, '2024-08-16', 1, 89.90),
(3, 3, '2024-08-15', 1, 299.90);

-- Cria a tabela Funcionarios
CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10, 2),
    data_contratacao DATE
);

-- Insere dados na tabela Funcionarios
INSERT INTO Funcionarios (nome_funcionario, cargo, salario, data_contratacao) VALUES
('Pedro Silva', 'Vendedor', 2500.00, '2023-01-10'),
('Ana Pereira', 'Gerente', 4500.00, '2022-11-05'),
('Lucas Santos', 'Caixa', 1800.00, '2024-06-01');
