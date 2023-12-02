

-- EXERCICIO 1

-- A)
create table funcionarios (
	id int auto_increment,
    nome varchar(50),
    cargo varchar(50),
    primary key (id)
);

-- B)
start transaction;

-- C)
insert into funcionarios (nome, cargo) 
 values ('Joao', 'Caixa'),
		('Maria', 'Caixa'),
        ('José', 'Repositor'),
        ('Josefa', 'Contadora'),
        ('Joaquim', 'Gerente');

-- D)
select * from funcionarios;

-- E)
commit;

-- F)
select * from funcionarios;

-- G)
rollback;

-- H)
select * from funcionarios;


-- EXERCICIO 2

-- A)
create table transacoes (
	id int auto_increment,
    nome varchar(50),
    descricao varchar(50) not null,
    primary key (id)
);

-- B)
start transaction;

-- C)
insert into transacoes (nome, descricao) 
 values ('Consultar', 'Veirifca se usuario ja existe no BD'),
		('Cadastrar', 'Cadastra usuário no BD'),
        ('Excluir', 'Exclui usuário no BD'),
        ('Alterar', 'Aletra informaçoes no cadastro do usuário no BD');

-- D)
select * from transacoes;

-- E)
insert into transacoes (nome, descricao) values ('Teste null', null);

-- F)
rollback;

-- G)
select * from transacoes;

-- EXERCICIO 3

-- A)
create table inventario (
	id int auto_increment,
    nome varchar(50),
    quantidade int,
    primary key (id)
);

-- B)
insert into inventario (nome, quantidade) 
 values ('Item A', 10),
		('Item B', 5),
        ('Item C', 23),
        ('Item D', 39),
        ('Item E', 3); 	

-- C)
start transaction;

-- D)
select * from inventario;

-- E)
update inventario set quantidade = 100 where nome = 'Item A';

-- F)
commit;

-- G)
select * from inventario;

-- H)
start transaction;

-- I)
update inventario set quantidade = 50 where nome = 'Item C';

-- J)
rollback;

-- K)
select * from inventario;

-- EXERCICIO 4

-- A)
create table pessoas (
	id int auto_increment,
    nome varchar(50),
    idade int,
    primary key (id)
);

-- B)
start transaction;

-- C)
insert into pessoas (nome, idade) 
 values ('Joao', 40),
		('Maria', 45),
        ('José', 14),
        ('Josefa', 18),
        ('Joaquim', 85);

-- D)
savepoint save_1;

-- E)
insert into pessoas (nome, idade) 
 values ('Enzo', 8),
		('Eliza', 60),
        ('Lucas', 36);
        
-- F)
select * from pessoas;

-- G)
rollback to savepoint save_1;

-- H)
commit;

-- I)
select * from pessoas;

-- EXERCICIO 5

-- A)
create table estoque (
	id int auto_increment,
    nome varchar(50),
    quantidade int,
    primary key (id)
);

-- B)
lock table estoque read;
lock table estoque write;

-- C)
start transaction;

-- D)
insert into estoque (nome, quantidade) 
 values ('Batata', 40),
		('Alface', 45),
        ('Beterraba', 14),
        ('Tomate', 18),
        ('Repolho', 85);

-- E)
commit;

-- F)
select * from estoque;

-- G)
unlock tables;






