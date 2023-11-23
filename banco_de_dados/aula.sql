create database projeto;
use projeto;
create table cliente (
	nome varchar(50) not null,
    telefone varchar(11),
    idade int,
    dependentes int
);
alter table cliente add email varchar(20);
alter table cliente drop column dependentes;
alter table cliente modify column email varchar(50);
-- drop table cliente;

insert into cliente values ('Leonardo', '65656565656',21,'leo@gmail.com');
select * from cliente;
INSERT INTO cliente (nome, telefone, idade) VALUES ('Ana', '46990005555', 30);
INSERT INTO cliente VALUES
('Zilda','47990001001',45,'zilda@terra.com'),
('José','47990003003',45,'ze@gmail.com'),
('Jim','47990002002',37,'jim@bol.com');
select * from cliente;
select nome, telefone from cliente;
SELECT * FROM cliente WHERE idade > 40;
SELECT * FROM cliente WHERE idade > 20 AND idade < 40;