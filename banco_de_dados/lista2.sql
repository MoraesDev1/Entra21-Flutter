-- 1
create database lista2;
use lista2;

-- 2
create table cursos (
	id int auto_increment,
    nome varchar(45) not null,
    primary key (id)
);

-- 3
create table alunos (
	id int auto_increment,
    nome varchar(45) not null,
    id_curso int,
    primary key (id),
    foreign key (id_curso) references cursos (id)
);

-- 4
-- insert into cursos (nome) values ('Flutter');
-- insert into cursos (nome) values ('Java');
-- insert into cursos (nome) values ('Kotlin');
-- insert into cursos (nome) values ('Objective-c');
-- insert into cursos (nome) values ('Swift');

select * from cursos;

-- 5
-- insert into alunos (nome,id_curso) values ('José',1);
-- insert into alunos (nome,id_curso) values ('Dalva',2);
-- insert into alunos (nome,id_curso) values ('Osvaldo',2);
-- insert into alunos (nome,id_curso) values ('Guga',3);
-- insert into alunos (nome,id_curso) values ('Zilda',1);
-- insert into alunos (nome,id_curso) values ('Humberto',5);
-- insert into alunos (nome,id_curso) values ('Aroldo',1);
-- insert into alunos (nome,id_curso) values ('Anastácio',5);
-- insert into alunos (nome,id_curso) values ('Regina',2);
-- insert into alunos (nome,id_curso) values ('Dolores',1);
-- insert into alunos (nome,id_curso) values ('Eustácio',1);
-- insert into alunos (nome,id_curso) values ('Fernanda',3);

select * from alunos;


-- 6
select a.nome from alunos a, cursos c where a.id_curso = c.id and c.nome = 'Flutter';
select a.nome from alunos a join cursos c on a.id_curso = c.id where c.nome = 'Flutter';

-- 7
select alunos.nome as Aluno, cursos.nome as Curso from alunos inner join cursos on alunos.id_curso = cursos.id;

-- 8
select cursos.nome as Curso, count(alunos.id_curso) as Total from alunos right join cursos on alunos.id_curso = cursos.id group by cursos.nome;


