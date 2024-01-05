use ecommerce;

show tables;

insert into client (Fname, Minit, Lname, CPF, address) values
    ('Maria', 'M', 'Gomes', 12378945612, 'Rua Maria Dolores - 25, Centro - São Paulo'),
    ('Marcos', 'O', 'Rangel', 96325874136, 'Rua castelhanos - 79, Maranduba - Caraguatatuba'),
    ('Juliana', 'J', 'Abuquerque', 45678996388, 'Rua das Constelações - 529, Morumbi - São Paulo'),
    ('Anderson', 'A', 'Barbosa', 12374175356, 'Rua Brasil - 1598, Mandacarú - Sergipe');

insert into product (Pname, classification_kids, category, rating, size) values
    ('Fone de ouvido', false, 'Eletrônicos', 4, null),
    ('Camiseta com gola em V', true, 'Vestimenta', 3, 'M'),
    ('Camiseta com gola em U', false, 'Vestimenta', 2, 'GG'),
    ('Poltrona reclinável', false, 'Móveis', '50x90x40cm'),
    ('Barbie Praia', true, 'Brinquedos', null);

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
    (1, default, 'Compra via aplicativo', null, 1),
    (2, default, 'Compra via aplicativo', 50, 0),
    (3, 'Confirmado', null, null, 1),
    (4, null, 'Compra via website', 150, 0);
    
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
    (1, 1, 2, null),
    (2, 1, 1, null),
    (3, 2, 1, null);

insert into productStorage (storageLocation, quantity) values
    ('Rio de Janeiro', 1000),
    ('São Paulo', 500),
    ('Brasília', 250),
    ('Goiás', 350),
    ('Santa Catarina', 600);

insert into storageLocation (idLproduct, idLstorage, location) values
    (1, 2, 'RJ'),
    (2, 6, 'GO');

insert into supplier (SocialName, CNPJ, contact) values
    ('Almeida e filhos', 12345679132456, 12456789452),
    ('Eletrônicos Modernos', 789456132147258, 78369852147),
    ('Conforto em madeiras', 789258147369123, 11456789324);

insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
    (1, 1, 500),
    (1, 2, 400),
    (2, 4, 300),
    (3, 3, 100),
    (3, 4, 10);
    
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
    ('Tech tudo', null, 123456123456123, null, 'Rio de Janeiro', 23789654123),
    ('Botecário festas', null, null, 12345678923, 'Brasília', 56124578963),
    ('Sonhar', null, 789654123698521, null, 'São Paulo', 114452369874);

insert into productSeller (idPseller, idPproduct, prodQuantity) values
    (1, 6, 80),
    (2, 5, 70),
    (3, 2, 5);