create table tb_enderecos (
    id_endereco serial primary key,
	logradouro varchar(100) not null,
	numero varchar(10) not null,
	complemento varchar(20),
	cep varchar(8) not null,	
);

create table tb_usuarios (
	id_usuario serial primary key,
	nome varchar(100) not null,
	sobrenome varchar(100) not null,
	cpf varchar(11) not null,
	id_endereco int,
	id_credencial unique not null,

	foreign key (id_endereco) references tb_enderecos (id_endereco),
	foreign key (id_credencial) references tb_credencias(id_credencial)
);

create table tb_credenciais (
	id_credencial serial primary key,
	email varchar(200) not null,
	senha varchar(24) not null
);

create table tb_compras (
	id_compra serial primary key,
	data_comprea date now,
	quantidade int(100),
	id_usuario int not null,
	id_produto int not null,	

	foreign key (id_usuario) references tb_usuarios(id_usuarios),
	foreign key (id_produto) references tb_produtos(id_produtos)
);

create table tb_produtos (
	id_produto serial primary key,
	nome varchar(100) not null,
	descricao varchar not null,
	preco numeric(5,2) not null	
);