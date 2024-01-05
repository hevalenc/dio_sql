-- criação do banco de dados
create database ecommerce;
use ecommerce;

-- tabela pagamento - continuar com a implementação
-- criar a conexão com as demais tabelas relacionais (necessárias)
-- criar constraints relacionadas ao pagamento
create table payment(
    idClient int,
    idPayment int,
    paymentType enum('Cartão de Crédito', 'Boleto Bancário', 'Pix'),
    primary key (idClient, idPayment)
);

-- criar tabela cliente
create table client(
    idClient int auto_increment primary key,
    Fname varchar(10),
    Minit varchar(3),
    Lname varchar(20),
    CPF char(11) not null,
    address varchar(30),
    constraint unique_cpf unique (CPF)
);

alter table client auto_increment = 1;

-- criar tabela produto
create table product(
    idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    classification_kids bool default false,
    category enum('Eletrônicos', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    rating float default 0,
    size varchar(10),
    constraint 
);

alter table product auto_increment = 1;

-- criar tabela pedido
create table orders(
    idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references client(idClient)
);

alter table orders auto_increment = 1;

-- criar tabela de estoque
create table storage(
    idProductStorage int auto_increment primary key,
    location varchar(255),
    quantity int default 0
);

alter table storage auto_increment = 1;

-- criar tabela fornecedor
create table supplier(
    idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

alter table supplier auto_increment = 1;

-- criar tabela vendedor
create table seller(
    idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    abstName varchar(255),
    CNPJ char(15),
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

alter table seller auto_increment = 1;

-- criar tabela vendedor produto - relacionamento
create table productSeller(
    idPseller int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct references product(idProduct)
);

-- criar tabela ordem de compra - relacionamento
create table productOrder(
    idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder) 
);

-- criar tabela local de armazenamento - relacionamento
create table storageLocation(
    idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references storage(idProductStorage)
);

-- criar tabela produto vendedor - relacionamento
create table productSupplier(
    idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);

