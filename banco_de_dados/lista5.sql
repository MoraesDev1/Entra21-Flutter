grant select on exercicio_veiculos.rep to 'gabriel'@'%';
flush privileges;

grant select on exercicio_veiculos.veiculo to 'gabriel'@'%';
flush privileges;

revoke select on exercicio_veiculos.veiculo from 'gabriel'@'%';
revoke select on exercicio_veiculos.rep from 'gabriel'@'%';
flush privileges;