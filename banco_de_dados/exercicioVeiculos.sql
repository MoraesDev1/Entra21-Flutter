create database exercicio_veiculos;
use exercicio_veiculos;

create table marca (
	cd_marca int auto_increment,
    ds_marca varchar(30) not null,
    primary key (cd_marca)
);

create table modelo (
	cd_modelo int auto_increment,
    cd_marca int,
    ds_modelo varchar(50) not null,
    primary key (cd_modelo),
    foreign key (cd_marca) references marca (cd_marca)
);

create table veiculo (
	nr_placa char(7) not null,
	cd_modelo int,
    nr_ano_fab int not null,
    nr_ano_mod int not null,
    primary key (nr_placa),
    foreign key (cd_modelo) references modelo (cd_modelo)
);

create table combustivel (
	cd_combustivel int auto_increment,
    ds_combustivel varchar(30),
    primary key (cd_combustivel)
);

create table veiculo_combustivel (
	cd_combustivel int,
    nr_placa char(7),
    primary key (cd_combustivel, nr_placa),
    foreign key (cd_combustivel) references combustivel (cd_combustivel),
    foreign key (nr_placa) references veiculo (nr_placa)
);

-- Exibir

-- select ds_modelo as Veiculo,
-- 	   veiculo.nr_placa as Placa,
-- 	   ds_marca as Marca,nr_ano_fab as 'Ano Fab',
--        nr_ano_mod as 'Ano Mod', 
--        ds_combustivel as Combustível 
--        from veiculo 
-- 	inner join modelo on veiculo.cd_modelo = modelo.cd_modelo 
--     inner join marca on modelo.cd_marca = marca.cd_marca 
--     inner join veiculo_combustivel on veiculo.nr_placa = veiculo_combustivel.nr_placa 
--     inner join combustivel on veiculo_combustivel.cd_combustivel = combustivel.cd_combustivel
--     where nr_ano_fab > 2009;

-- 2
select * from veiculo where nr_ano_fab >= 2010;

-- 3
select veiculo.nr_placa as Placa,
	   ds_modelo as Veiculo 
       from veiculo 
       inner join modelo on veiculo.cd_modelo = modelo.cd_modelo;

-- 4
select ds_modelo as Veiculo, 
	   marca.ds_marca as Marca 
       from modelo 
       inner join marca on modelo.cd_marca = marca.cd_marca 
       where marca.ds_marca = 'volkswagem';
       
-- sub-select
select ds_modelo as Veiculo from modelo where cd_marca = (select cd_marca from marca where ds_marca = 'volkswagem');

-- 5
select ds_modelo as Veiculo, 
	   marca.ds_marca as Marca 
       from modelo 
       inner join marca on modelo.cd_marca = marca.cd_marca 
       where marca.ds_marca = 'citroen' 
       or marca.ds_marca = 'peugeot';

-- 6
select * from veiculo where nr_ano_fab = nr_ano_mod;

-- 7
select * from veiculo where nr_ano_fab <> nr_ano_mod;

-- 8
select veiculo.nr_placa as Placa, 
	   ds_combustivel as Combustível 
       from veiculo 
       inner join veiculo_combustivel on veiculo.nr_placa = veiculo_combustivel.nr_placa 
       inner join combustivel on veiculo_combustivel.cd_combustivel = combustivel.cd_combustivel 
       where combustivel.ds_combustivel = 'gasolina';

-- 9
select veiculo.nr_placa as Placa,
	   ds_modelo as Veiculo,
	   ds_marca as Marca,
       nr_ano_fab as 'Ano Fab',
       nr_ano_mod as 'Ano Mod'
       from veiculo 
	inner join modelo on veiculo.cd_modelo = modelo.cd_modelo 
    inner join marca on modelo.cd_marca = marca.cd_marca;

-- 10
select veiculo.nr_placa as Placa,
	   ds_modelo as Veiculo,
	   ds_marca as Marca,
       nr_ano_fab as 'Ano Fab',
       nr_ano_mod as 'Ano Mod'
       from veiculo 
	inner join modelo on veiculo.cd_modelo = modelo.cd_modelo 
    inner join marca on modelo.cd_marca = marca.cd_marca
    where nr_ano_fab >= 2010;
    
-- 11
select ds_modelo as Veiculo,
	   ds_marca as Marca,
       nr_ano_fab as 'Ano Fab',
       nr_ano_mod as 'Ano Mod'
       from veiculo 
	inner join modelo on veiculo.cd_modelo = modelo.cd_modelo 
    inner join marca on modelo.cd_marca = marca.cd_marca
	inner join veiculo_combustivel on veiculo.nr_placa = veiculo_combustivel.nr_placa 
	inner join combustivel on veiculo_combustivel.cd_combustivel = combustivel.cd_combustivel
    where nr_ano_fab >= 2010 and combustivel.ds_combustivel = 'diesel';

-- 12
select avg(2023 - nr_ano_mod) as 'Idade Média dos Veículos' from veiculo;

-- 13
create view rep as select cd_modelo, COUNT(*) as quantidade from veiculo group by cd_modelo;
select ds_modelo as Modelo,
	   ds_marca as Marca,
       quantidade as Quantidade
       from veiculo
       inner join modelo on veiculo.cd_modelo = modelo.cd_modelo 
       inner join marca on modelo.cd_marca = marca.cd_marca 
       inner join rep on veiculo.cd_modelo = rep.cd_modelo
       where quantidade = (select max(quantidade) from rep)
       group by ds_modelo, ds_marca, quantidade;

-- 14
create view info_veiculos as 
select ds_modelo as Modelo,
	ds_marca as Marca,
    nr_ano_fab as 'Ano Fab',
	nr_ano_mod as 'Ano Mod',
	ds_combustivel as Combustível
	from veiculo
	inner join modelo on veiculo.cd_modelo = modelo.cd_modelo 
	inner join marca on modelo.cd_marca = marca.cd_marca 
	inner join veiculo_combustivel on veiculo.nr_placa = veiculo_combustivel.nr_placa 
	inner join combustivel on veiculo_combustivel.cd_combustivel = combustivel.cd_combustivel;
select * from info_veiculos;

-- 15
create view qtd_comb_util as select nr_placa, count(nr_placa) as qtd_comb_util from veiculo_combustivel group by nr_placa;
select ds_modelo as Modelo,
	qtd_comb_util as 'Quant. de Comb. Utilizados'
	from veiculo
	inner join modelo on veiculo.cd_modelo = modelo.cd_modelo
	inner join qtd_comb_util on veiculo.nr_placa = qtd_comb_util.nr_placa
    where qtd_comb_util.qtd_comb_util > 1;

-- 16
select ds_modelo as Modelo
	from veiculo
	inner join modelo on veiculo.cd_modelo = modelo.cd_modelo
	inner join qtd_comb_util on veiculo.nr_placa = qtd_comb_util.nr_placa
    inner join veiculo_combustivel on veiculo.nr_placa = veiculo_combustivel.nr_placa 
	inner join combustivel on veiculo_combustivel.cd_combustivel = combustivel.cd_combustivel
    where qtd_comb_util.qtd_comb_util > 1 and ds_combustivel like 'gnv';
