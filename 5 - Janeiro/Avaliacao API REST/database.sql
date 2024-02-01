create database dbavaliacao;
use dbavaliacao;

create table pessoa (
	id int auto_increment,
	nome varchar(50) not null,
    telefone varchar(50) not null,
    email varchar(50) not null,
    estadocivil bool not null,
    primary key (id)
);
