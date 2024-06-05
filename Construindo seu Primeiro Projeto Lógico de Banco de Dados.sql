-- CRIAÇÃO DO BANCO DE DADOS ECOMMERCE --

# CRIANDO E USANDO DATABASE Ecommerce
CREATE DATABASE ecommerce;
USE ecommerce;


-- CRIAÇÃO DE TABELAS --

# CRIAÇÃO TABELA CLIENTES
CREATE TABLE Clients(
	Idclient INT AUTO_INCREMENT PRIMARY KEY,
	Fname VARCHAR(10),
	Minit CHAR(30),
	Lname VARCHAR(20),
	CPF CHAR(11) NOT NULL,
	Address VARCHAR(200),
	CONSTRAINT unique_cpf_client UNIQUE (CPF)
);

ALTER TABLE Clients AUTO_INCREMENT = 1;

# CRIAÇÃO TABELA PRODUTO
CREATE TABLE Product(
	Idproduct INT AUTO_INCREMENT PRIMARY KEY,
	Pname VARCHAR(50) NOT NULL,
	Classification_Kids BOOL DEFAULT FALSE,
	Category ENUM('Eletronico', 'Vestuario', 'Alimentos', 'Brinquedos', 'Moveis') NOT NULL,
	Avaliacao FLOAT DEFAULT 0,
	Size VARCHAR(10)
);  

# CRIAÇÃO TABELA PAGAMENTO
CREATE TABLE Payments(
	IdClient INT PRIMARY KEY,
	IdPayment INT,
	TypePayment ENUM('Boleto', 'Cartao, 1Dois Cartoes'),
	LimitAvailable FLOAT
);

# CRIAÇÃO TABELA PEDIDO
CREATE TABLE Orders(
	IdOrder INT AUTO_INCREMENT PRIMARY KEY,
	IdOrderClient INT,
	OrderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
	OrderDescription VARCHAR(255), 
	SendValue FLOAT DEFAULT 10,
	PaymentCash BOOL DEFAULT FALSE,
	CONSTRAINT fk_orders_client FOREIGN KEY (IdOrderClient) REFERENCES Clients(Idclient)
);  

# CRIAÇÃO TABELA ESTOQUE
CREATE TABLE ProductStorage(
	IdProductStorage INT AUTO_INCREMENT PRIMARY KEY,
	StorageLocation VARCHAR(255),
	Quantity INT DEFAULT 0
);  

#CRIAÇÃO TABELA FORNECEDOR
CREATE TABLE Supplier(
	IdSupplier INT AUTO_INCREMENT PRIMARY KEY,
	SocialName VARCHAR(255) NOT NULL,
	CNPJ CHAR(15) NOT NULL,
	Contact CHAR(11) NOT NULL,
	CONSTRAINT unique_supplier UNIQUE(CNPJ)
);  

# CRIAÇÃO TABELA VENDEDOR
CREATE TABLE Seller(
	IdSeller INT AUTO_INCREMENT PRIMARY KEY,
	SocialName VARCHAR(255) NOT NULL,
        AbstractName VARCHAR(255),
	CNPJ CHAR(15) NOT NULL,
        CPF CHAR(9),
        location VARCHAR (255),
	Contact CHAR(11) NOT NULL,
	CONSTRAINT unique_cnpj_seller UNIQUE(CNPJ),
        CONSTRAINT unique_cpf_seller UNIQUE(CPF)
);

CREATE TABLE ProductSeller(
	IdPseller INT,
	IdProduct INT,
    	ProdQuantity INT DEFAULT 1,
    	PRIMARY KEY (IdPseller, IdProduct),
    	CONSTRAINT fk_product_seller FOREIGN KEY (IdPseller) REFERENCES Seller (IdSeller),
   	CONSTRAINT fk_product_product FOREIGN KEY (IdProduct) REFERENCES Product (IdProduct)
);

CREATE TABLE ProductOrder(
	IdPoProduct INT,
	IdPoOrder INT,
        PoQuantity INT DEFAULT 1,
    	PoStatus ENUM('Disponivel','Sem Estoque') DEFAULT 'Disponivel',
	PRIMARY KEY (IdPoProduct, IdPoOrder),
    	CONSTRAINT fk_productorder_seller FOREIGN KEY (IdPoProduct) REFERENCES Product (IdProduct),
        CONSTRAINT fk_productorder_product FOREIGN KEY (IdPoOrder) REFERENCES orders (Idorder)
);

CREATE TABLE StorageLocation(
	IdLproduct INT,
	IdLstorage INT,
        Location VARCHAR(255) NOT NULL,
	PRIMARY KEY (IdLproduct, IdLstorage),
        CONSTRAINT fk_storage_location_product FOREIGN KEY (IdLproduct) REFERENCES Product (IdProduct),
        CONSTRAINT fk_storage_location_storage FOREIGN KEY (IdLstorage) REFERENCES ProductStorage (IdProductStorage)
);

CREATE TABLE ProductSupplier(
	IdPsSupplier INT,
	IdPsProduct INT,
    Quantity INT NOT NULL, 
	PRIMARY KEY (IdPsSupplier, IdPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (IdPsSupplier) REFERENCES Supplier (IdSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (IdPsProduct) REFERENCES Product (IdProduct)
);

-- PERSISTINDO DADOS --

# IdClient, Fname, Minit, Lname, CPF, Address
INSERT INTO Clients(Fname, Minit, Lname, CPF, Address)
	VALUES ('Maria','M', 'Silva', 12345679, 'rua silva de prata 29, Carangola - Cidade das Flores'),
	       ('Matheus','O', 'Pimentel', 987654321, 'rua alameda 289, Cemtro- Cidade das Flores'),
               ('Ricardo','F', 'Silva', 45678913, 'avenida alameda vinha 1009, Centro - Cidade das Flores'),
               ('Julia','S', 'França', 789123456, 'rua laranjeiras 861, Centro - Cidade das Flores'),
               ('Roberta','G', 'Assis', 987456321, 'avenida Koller 19, Centro - Cidade das Flores'),
               ('Isabela','M', 'Cruz', 654789123, 'rua alameda das flores 28, Centro - Cidade das Flores');

# IdProduct, Pname, Classification_Kids boolean, category('Eletronico', 'Vestuario', 'Alimentos', 'Brinquedos', 'Moveis')
INSERT INTO Product (Pname, Classification_Kids, Category, Avaliacao, Size)
	VALUES ('Fone de ouvido', FALSE, 'Eletronico', '4', NULL),
	       ('Barbie Elsa', TRUE, 'Brinquedos', '3', NULL),
	       ('Body Carters', TRUE, 'Vestuario', '5', NULL),
	       ('Microfone Vedo - youtuber', FALSE, 'Eletronico', '4', NULL),
	       ('Sofá Retrátil', FALSE, 'Moveis', '3', '3x57x80'),
               ('Farinha de arroz', FALSE, 'Alimentos', '2', NULL),
	       ('Fire stick amazon', FALSE, 'Eletronico', '3', NULL);

# IdOrder, IdOrderClient, OrderStatus, OrderDescription, SendValue, PaymentCash
INSERT INTO Orders(IdOrder, OrderStatus, OrderDescription, SendValue, PaymentCash)
	VALUES (1, DEFAULT, 'compra via aplicativo', NULL, 1),
	       (2, DEFAULT, 'compra via aplicativo', 50, 0),
               (3, 'Confirmado', NULL, NULL, 1),
               (4, DEFAULT, 'compra via web site', 150, 0);

# IdPoProduct,IdPoOrder, Poquantity, PoStatus
INSERT INTO ProductOrder(IdPoProduct,IdPoOrder, Poquantity, PoStatus)
	VALUES (1,1,2, NULL),
	       (2,1,1, NULL),
	       (3,2,1, NULL);

# StorageLocation, Quantity
INSERT INTO ProductStorage(StorageLocation, Quantity)
	VALUES ('Rio de Janeiro', 1000),
               ('Rio de Janeiro', 500),
	       ('São Paulo', 10),
               ('São Paulo', 100),
	       ('São Paulo', 10),
	       ('Brasília', 60);

# IdLproduct, IdLStorage, Location
INSERT INTO StorageLocation(IdLproduct, IdLStorage, Location)
	VALUES (1,2, 'RJ'),
	       (2,6, 'GO');
