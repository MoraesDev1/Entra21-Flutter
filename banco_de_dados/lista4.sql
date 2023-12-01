create database lista4;
use lista4;

create table estoque (
	id int auto_increment,
    nome varchar (50) not null,
    fabricante varchar (30)not null,
    quantidade int,
    valor double,
    tipo varchar (30),
    primary key (id)
);

INSERT INTO estoque (id, nome, fabricante, quantidade, valor, tipo)
VALUES
  (1, 'Playstation 4', 'Sony', 100, 1999, 'Console'),
  (2, 'Core i5 8GB Ram SSD 240', 'Dell', 200, 1899, 'Notebook'),
  (3, 'Xbox one', 'Microsoft', 350, 1299, 'Console'),
  (4, 'J1', 'Samsung', 300, 499, 'Celular'),
  (5, 'iPhone 10', 'Apple', 50, 1499, 'Smartphone'),
  (6, 'Playstation 3', 'Sony', 100, 399, 'Console'),
  (7, 'Sofá estofado', 'Coréia', 200, 499, 'Sofá'),
  (8, 'Armário de Serviço', 'Aracaju', 50, 129, 'Armário'),
  (9, 'Refrigerador 420L', 'CCE', 200, 1499, 'Refrigerador'),
  (10, 'Wii', 'Nintendo', 250, 999, 'Console');
  
-- 1 Exibir o número de produtos em estoque agrupados pelo tipo
select tipo, sum(quantidade) as Quantidade from estoque group by tipo;

-- 2 Exibir o número de produtos em estoque por fabricante
select fabricante, sum(quantidade) as Quantidade from estoque group by fabricante;

-- 3 Exibir o número de produtos em estoque de acordo com o tipo e fabricante
select fabricante, tipo, sum(quantidade) as Quantidade from estoque group by fabricante, tipo;

-- 4 Exibir o valor total dos produtos em estoque agrupados pelo tipo
select tipo, sum(valor*quantidade) as 'Valor Total' from estoque group by tipo;

-- 5 Exibir o número de produtos em estoque agrupados pelo tipo, exibir somente os que possuem quantidade em estoque superior a 200
select tipo, sum(quantidade) as Quantidade from estoque group by tipo having (sum(quantidade) > 200);

-- 6 A partir do anterior, agrupar além do tipo o fabricante
select tipo, fabricante, sum(quantidade) as Quantidade from estoque group by tipo,fabricante having (sum(quantidade) > 200);

-- 7 Exibir a quantidade em estoque e o valor do estoque agrupados pelo nome, cujo a quantidade supere 200 e o valor do estoque seja igual ou superior a 100 mil
select nome, sum(quantidade) as Quantidade, sum(valor*quantidade) as Valor_Total from estoque group by nome having (sum(quantidade) > 200 and sum(valor*quantidade) >= 100000);






