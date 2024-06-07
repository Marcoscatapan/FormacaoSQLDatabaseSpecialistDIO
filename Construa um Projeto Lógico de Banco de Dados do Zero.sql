-- CRIAÇÃO DO BANCO DE DADOS AUTOPECAS --

# CRIANDO E USANDO DATABASE Ecommerce
CREATE DATABASE autopecas;
USE autopecas;


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
	Category ENUM('Peça', 'Acessório', 'Parafusos', 'Baterias', 'Rodas') NOT NULL,
	Avaliacao FLOAT DEFAULT 0,
	Size VARCHAR(10)
);  

# CRIAÇÃO TABLE PAGAMENTO
CREATE TABLE Payments(
	IdClient INT PRIMARY KEY,
	IdPayment INT,
	TypePayment ENUM('Boleto', 'Cartao, Dois Cartoes'),
	LimitAvailable FLOAT
);

#CREATE TABLE PEDIDO
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

#CRIAÇÃO TABELA VENDEDOR
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
	VALUES ('Lucas','Medeiros', 'Borges', 12345677, 'rua Metallics 36, Contrabaixo - Metalandia'),
		   ('Rogério','Maciel', 'Medeiros', 987654322, 'rua redhot 123, Centro- Metalandia'),
           ('Renan','Francisco', 'Teixeira', 45678911, 'avenida metal velho 1054, bateria - Metalandia'),
           ('Helena','Silva', 'Ferreira', 789123458, 'rua batera doida 857, Centro - Metalandia'),
           ('Tiffany','Gisele', 'Catapan', 987456329, 'avenida geene simons 199, GuitarHeroe - Metalandia'),
           ('Isadora','Medrado', 'Silveira', 654789121, 'rua metal grey 68, Centro - Metalandia');

# IdProduct, Pname, Classification_Kids boolean, category('Eletronico', 'Vestuario', 'Alimentos', 'Brinquedos', 'Moveis')
INSERT INTO Product (Pname, Category, Avaliacao, Size)
	VALUES ('Espelho Retrovisor', 'Acessório', '3', NULL),
		   ('Manopla de cambio', 'Acessório', '4', NULL),
		   ('Bateria 24A', 'Baterias', '4', NULL),
		   ('Kit parafuso 10', 'Parafusos', '2', '10cm'),
		   ('Jogo de Rodas BBQ Aro27',  'Rodas', '3', '3x57x80'),
           ('Motor V6',  'Peça', '4', NULL),
		   ('Disco de freio', 'Peça', '4', NULL);

# IdOrder, IdOrderClient, OrderStatus, OrderDescription, SendValue, PaymentCash
INSERT INTO Orders(IdOrder, OrderStatus, OrderDescription, SendValue, PaymentCash)
	VALUES (1, DEFAULT, 'compra via website', NULL, 1),
		   (2, DEFAULT, 'compra via aplicativo', 50, 0),
           (3, 'Confirmado', NULL, 240, 1),
           (4, DEFAULT, 'compra via web site', 420, 0);

# IdPoProduct,IdPoOrder, Poquantity, PoStatus
INSERT INTO ProductOrder(IdPoProduct,IdPoOrder, Poquantity, PoStatus)
	VALUES (1,1,2, NULL),
		   (2,1,1, NULL),
		   (3,2,1, NULL);

# StorageLocation, Quantity
INSERT INTO ProductStorage(StorageLocation, Quantity)
	VALUES ('Bahia', 000),
		   ('Bahia', 700),
		   ('Bahia', 30),
           ('São Paulo', 180),
		   ('Espirito Santo', 20),
		   ('Espirito Santo', 90);

# IdLproduct, IdLStorage, Location
INSERT INTO StorageLocation(IdLproduct, IdLStorage, Location)
	VALUES (1,2, 'BA'),
		   (2,6, 'ES');