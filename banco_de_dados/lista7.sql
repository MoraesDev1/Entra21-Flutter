-- EXERCICIO 1 - Store procedure

-- A)
create table usuarios (
	id int auto_increment,
    nome varchar(50),
    email varchar(50),
    primary key (id)
);

-- B)
DELIMITER //
create procedure cadastra_usuarios (nome varchar(50), email varchar(50))
begin
insert into usuarios (nome, email) values (nome, email);
end;
//
DELIMITER ;

-- C)
call cadastra_usuarios('Joao', 'joao@email.com');
call cadastra_usuarios('Maria', 'maria@email.com');

-- D)
select * from usuarios;

-- E)
drop procedure if exists cadastra_usuarios;

-- EXERCICIO 2 - Functions

-- A)
create table funcionarios (
	id int auto_increment,
    nome varchar(50),
    salario double, 
    primary key (id)
);

insert into funcionarios (nome, salario) values ('João', 2000),('Maira', 4000);

-- B)
DELIMITER //
create function soma_salarios() returns double deterministic
begin
	declare soma_salarios double;
    select sum(salario) from funcionarios where salario > 0 into soma_salarios;
    return soma_salarios;
end;
//
DELIMITER ;

-- C)
DELIMITER //
create function media_salarios() returns double deterministic
begin
	declare media_salarios double;
    select avg(salario) from funcionarios where salario > 0 into media_salarios;
    return media_salarios;
end;
//
DELIMITER ;

-- D)
select soma_salarios() as 'Soma dos Salarios';
select media_salarios() as 'Media dos Salarios';

-- E)
drop function if exists soma_salarios;
drop function if exists media_salarios;













