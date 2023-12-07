-- AVALIAÇÃO 

-- 1) Crie um banco de dados chamado avaliacao

create database avaliacao;
use avaliacao;


-- 2) Crie as tabelas no banco de acordo com o MER abaixo

create table produto (
	id int auto_increment,
    nome varchar(45) not null,
    descricao varchar(200) not null,
    valor double not null,
    estoque int not null,
    primary key (id)    
);

create table categoria (
id int auto_increment,
nome varchar(45) not null,
primary key (id)  
);

create table cliente (
	id int auto_increment,
    nome varchar(45) not null,
    cpf varchar(14) not null,
    email varchar(100) not null,
    primary key (id) 
);

create table venda (
	id int auto_increment,
    id_cliente int,
    data_hora datetime,
    valor_total double,
    parcelas int,
    primary key (id),
    foreign key (id_cliente) references cliente (id)
);

create table item_venda (
	id_venda int,
    id_produto int,
    valor_unitario int,
    quantidade int,
    foreign key (id_venda) references venda (id),
    foreign key (id_produto) references produto (id)
);

create table produto_categoria (
	id_produto int,
    id_categoria int,
    foreign key (id_produto) references produto (id),
    foreign key (id_categoria) references categoria (id)
);

-- 3) Crie 3 categorias de produtos a sua escolha. Crie 10 produtos sendo que pelo menos 5 deles devem ter mais de uma categoria. Um produto deve ter 3 categorias

insert into categoria (nome) values 
	('Eletronicos'),
    ('Casa e Cozinha'),
    ('Automoveis');

insert into produto (nome, descricao, valor, estoque) values
	('WAP lavadora', 'Lavadora de alta pressão', 950, 600),
	('Alexa', 'Assistente virtual', 200, 1000),
    ('Lampada Smart', 'Lampada Smart 127/220V para casa', 80, 500),
    ('Aspirador Smart', 'Aspirador inteligente para casa', 800, 300),
    ('Smart TV LED 32"', 'Televisão smart 32 polegadas Led', 1500, 85),
    ('Oculos VR', 'Oculos de Realidade Virtual', 70, 550),
    ('Lampada Farol', 'Lampadas 12v p/ Farol automotivo', 15, 10000),
    ('Cherinho', 'Cheirinho para veiculos', 20, 4000),
    ('Cera de polir', 'Cera automotiva para polir', 35, 1000),
    ('Fones', 'Fones de ouvido Bluetooth', 80, 1000);
    
insert into produto_categoria values 
	(1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 2),
    (3, 1),
    (3, 2),
    (4, 1),
	(4, 2),
    (5, 1),
    (5, 2),
    (6, 1),
    (7, 1),
    (7, 3),
    (8, 3),
    (9, 3),
    (10, 1);
 
 -- 4 Crie o cadastro de 3 clientes
 
insert into cliente (nome, cpf, email) values 
	('Joao', '123.456.789-10', 'joao@gmail.com'),
	('Maria', '111.222.333-44','maria@hotmail.com'),
    ('Joaquim',	'999.888.777-66','joaquim@outlook.com');
    
-- 5 Crie registros para as seguintes vendas:
-- a) 3 items diferentes, à vista.
-- b) 2 items iguais, parcelada em 3x.
-- c) 2 items iguais, 3 itens diferentes, parcelada em 10x.

insert into venda (id_cliente, data_hora, valor_total, parcelas) values 
	(1, '2023-12-06 12:10:01', 1230.00, 1),
    (2, '2023-12-06 12:20:01', 30.00, 3),
    (3, '2023-12-06 12:30:01', 2530.00, 10);
    
insert into item_venda (id_venda, id_produto, valor_unitario, quantidade) values 
	(1, 1, (select valor from produto where id = 1), 1),
    (1, 2, (select valor from produto where id = 2), 1),
    (1, 3, (select valor from produto where id = 3), 1),
    (2, 7,(select valor from produto where id = 7), 2),
    (3, 7,(select valor from produto where id = 7), 2),
    (3, 5, (select valor from produto where id = 5), 1),
    (3, 4, (select valor from produto where id = 4), 1),
    (3, 2, (select valor from produto where id = 2), 1);
    
    
-- 6 Exiba a lista de clientes

select * from cliente;

-- 7 Exiba todos os produtos em estoque com suas respectivas categorias.

select p.descricao, c.nome from produto p inner join produto_categoria pc on pc.id_produto = p.id inner join categoria c on pc.id_categoria = c.id;

-- 8 Exiba o nome da categoria que possui mais de um produto relacionado com ela

select c.nome, count(id_produto) as 'Quantidade de produtos' from categoria c inner join produto_categoria pc on pc.id_categoria = c.id group by id_categoria having (count(id_produto) > 1);

-- 9 Exiba as seguintes informações do cliente:
-- a. nome
-- b. quantidade de vendas
-- c. valor total pago por ele.

create view qtd_venda_por_cliente as select id_cliente, count(id_cliente) as qtd_vendas from venda group by id_cliente;

select nome as Nome, qtd_vendas as 'Quantidade de vendas', valor_total as 'Valor total' from cliente inner join venda v on v.id_cliente = cliente.id inner join qtd_venda_por_cliente qvpc on qvpc.id_cliente = cliente.id;

-- 10 Exiba todos produtos adquiridos por um cliente através do cpf

select cpf as CPF, descricao as Produto from produto p inner join item_venda iv on iv.id_produto = p.id inner join venda v on iv.id_venda = v.id inner join cliente c on v.id_cliente = c.id where cpf = '123.456.789-10';

