create database dbavaliacao;
use dbavaliacao;

create table pessoa (
	id int auto_increment,
	nome varchar(50),
    telefone varchar(50),
    email varchar(50),
    estadocivil bool,
    primary key (id)
);
