-- 1
create database exercicio1;

-- 2
use exercicio1;

-- 3
create table colaborador (
	nome varchar(20) not null,
    cpf varchar(14) not null,
    salario double,
    idade int,
    email varchar(100)
);

-- 4
alter table colaborador add data_de_nascimento date;

-- 5
alter table colaborador drop column idade;

-- 6
alter table colaborador modify column nome varchar(50);

-- 7
insert into colaborador values ('Carlos', '239.862.380-77', 2000, 'carlos@outlook.com', '2000/02/10');

-- 8
insert into colaborador VALUES
('Joana', '86952872035', 1500, 'joana@terra.com.br', '2000-03-01'),
('João', '54377915002', 2700, 'joao@gmail.com', '1990-05-20'),
('Adilson', '97306659073', 1350, 'adilson@gmail.com', '2002-10-10'),
('Laura', '73175925014', 1680, 'laura@yahoo.com', '2001-02-02'),
('Jeferson', '29077529012', 3000, 'Jeferson@terra.com.br', '1980-07-26'),
('Urda', '49727319076', 2000, 'urda@aol.com', '1969-04-25'),
('Toni', '97752175048', 5090, 'toni@gmail.com', '1987-04-17'),
('Aroldo', '87329726010', 2400, 'aroldo@gmail.com', '1990-01-01'),
('José', '36170990090', 7000, 'jose@gmail.com', '1976-03-15'),
('Zilda', '82576518001', NULL, NULL, '1950-12-20');

-- 9
select * from colaborador;

-- 10
select count(*) from colaborador;

-- 11
select count(*) from colaborador where email like '%gmail%';

-- 12
select count(*) from colaborador where data_de_nascimento between '2001-01-01' and '2001-11-23';

-- 13
select count(*) from colaborador where nome like 'A%';

-- 14
select nome from colaborador where email is null;

-- 15
update colaborador set data_de_nascimento = '1981-05-16' WHERE nome = 'Jeferson';

-- 16
select nome, salario from colaborador where salario > 2000;

-- 17
select nome, data_de_nascimento from colaborador order by nome asc;

-- 18
select * from colaborador where data_de_nascimento < '2000-01-01';

-- 19
select max(salario) from colaborador;

-- 20
select min(salario) from colaborador;

-- 21
select avg(salario) from colaborador;

-- 22
select sum(salario) from colaborador;

-- 23
delete from colaborador where salario > 2500;