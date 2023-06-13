drop table if exists categoria;
create table categoria(
	id int not null,
	descricao varchar(45) not null,
	primary key(id)
);

insert into categoria values(1, 'Acessórios de Moda'), (2, 'Moda'), (3, 'Perfumaria e Cosméticos'), 
(4, 'Alimentos e Bebidas'), (5, 'Pet shop'), (6, 'Acessórios automotivos'), (7, 'Brinquedos'),
(8, 'Games'), (9, 'Jóias e Relógios'), (10, 'Eletrônicos');

drop table if exists produto;
create table produto(
	id int not null,
	nome varchar(45) not null,
	valor decimal not null,
	estoque int not null,
	categoria int not null,
	primary key(id),
	CONSTRAINT f1 foreign key (categoria) REFERENCES categoria (id)
);

ALTER TABLE produto
ALTER COLUMN valor TYPE decimal(10, 2);


insert into produto values (1, 'Óculos de sol', 299.90, 5, 1), (2, 'Moletom', 80.50, 3, 2), 
(3, '212 - Vip Rosé Carolina Herrera', 319.00, 6, 3), 
(4, 'Ração Pedigree - Adulto - 15kg', 154.99, 4,5),
(5, 'Diablo IV', 349.90, 10 , 8), 
(6, 'Cama Nuvem Calmante Para Cachorros', 193.90, 4, 5);


drop table if exists telefone;
create table telefone(
	id int not null,
	numero int not null,
	cliente int not null,
	primary key(id),
	constraint f1 foreign key (cliente) references cliente(id)
);

ALTER TABLE telefone
ALTER COLUMN numero TYPE varchar(15);

insert into telefone values(1, '(48)99999-9999', 1), (2, '(48)98888-8888', 2);

drop table if exists cidade;
create table cidade(
	id int not null,
	nome varchar(45),
	uf varchar(2),
	primary key(id)
);

insert into cidade values (1, 'Tubarão', 'SC'), (2, 'Imbituba', 'SC'), (3, 'Garopaba', 'SC'),
(4, 'Criciúma', 'SC'), (5, 'São Paulo', 'SP'), (6, 'Rio de Janeiro', 'RJ'), 
(7, 'Porto Alegre', 'RS');

drop table if exists endereco;
create table endereco(
	id int not null,
	rua varchar(45) not null,
	bairro varchar(45) not null,
	cidade int not null,
	cep int not null,
	primary key(id),
	constraint f1 foreign key (cidade) references cidade(id)
);

ALTER TABLE endereco
ALTER COLUMN cep TYPE varchar(9);

insert into endereco values (1, 'Avenida Rodovalho', 'Vila Moema', 1, '88705-090'),
(2, 'Rua Amazonas', 'Vila Santo Antônio', 2, '88780-000');

drop table if exists cliente;
create table cliente(
	id int not null,
	nome varchar(45) not null,
	sexo char not null,
	data_nascimento date not null,
	endereco int not null,
	primary key (id),
	constraint f1 foreign key (endereco) references endereco(id)
);

insert into cliente values (1, 'Cliente 1', 'F', '2000-07-12', 1),
(2, 'Cliente 2', 'M', '1982-04-01', 2);
insert into cliente values (3, 'Cliente 3', 'F', '2002-07-02', 1),
(4, 'Cliente 4', 'M', '1992-04-29', 2), 
(5, 'Cliente 5', 'F', '1985-08-15', 2),
(6, 'Cliente 6', 'M', '2001-09-11', 1);

drop table if exists venda;
create table venda(
	id int not null,
	data_venda date not null,
	cliente int not null,
	primary key (id),
	constraint f1 foreign key (cliente) references cliente(id)
);

insert into venda values(1, '2023-06-12', 1), (2, '2023-07-22', 2), (3, '2023-08-10', 2),
(4, '2023-08-11', 1), (5, '2023-09-01', 1);

drop table if exists venda_produto;
create table venda_produto(
	id int not null,
	venda int not null,
	produto int not null,
	quantidade int not null,
	primary key(id),
	constraint f1 foreign key (venda) references venda(id),
	constraint f2 foreign key (produto) references produto(id)
);

insert into venda_produto values (1, 1, 5, 1), (2, 1, 3, 1), (3, 2, 4, 2);
insert into venda_produto values (4, 2, 6, 2), (5, 2, 3, 1), 
(6, 3, 5, 1),
(7, 3, 2, 1),
(8, 4, 6, 1),
(9, 4, 2, 1 ),
(10, 4, 1, 2),
(11, 5, 4, 1),
(12, 5, 6, 1);

