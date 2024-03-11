create table Pessoa
(
	idPessoa int PRIMARY KEY NOT NULL,
	nome varchar(255),
	logradouro varchar(255),
	cidade varchar (255),
	estado char(2),
	telefone varchar(255),
	email varchar(255),

);

create table PessoaFisica
(
	idPessoaFisica int primary key not null,
	idPessoa int not null,
	cpf varchar(255),
);

create table PessoaJuridica 
(
	idPessoaJuridica int primary key not null,
	idPessoa int NOT NULL,
	cnpj varchar(255),
);


alter table PessoaFisica
	add constraint fk_PessoaPF foreign key (idPessoa) references Pessoa (idPessoa)


alter table PessoaJuridica
	add constraint fk_PessoaPJ foreign key (idPessoa) references Pessoa (idPessoa);


create table produtos 
(
	idProduto int primary key not null,
	nome varchar(255),
	quantidade int,
	precoVenda numeric,
);

create table usuario
(
	idUsuario int primary key not null,
	idPessoa int not null,
	idPessoaFisica int,
	idPessoaJuridica int,
)

alter table usuario
	add constraint fk_UsuarioPessoa foreign key (idPessoa) references Pessoa (idPessoa);
	
alter table usuario
	add constraint fk_UsuarioPessoaF foreign key (idPessoaFisica) references PessoaFisica (idPessoaFisica);

alter table usuario
	add constraint fk_UsuarioPessoaJ foreign key (idPessoaJuridica) references PessoaJuridica (idPessoaJuridica);



create table movimento
( 
	idMovimento int primary key not null,
	idProduto int,
	idUsuario int,
	idPessoa int,
	quantidade int,
	tipo char(5),
	valorUnitario numeric,
)

alter table movimento
	add constraint fk_MovUsuario foreign key (idUsuario) references Usuario (idUsuario);

alter table movimento
	add constraint fk_MovPessoa foreign key (idPessoa) references Pessoa (idPessoa);

alter table movimento
	add constraint fk_MovProd foreign key (idProduto) references produtos (idProduto);


create table Compra 
(
	idCompra int primary key not null,
	idMovimento int not null,
	idPessoaFisica int not null,
	idUsuario int not null,
)

create table Venda
(
	idVenda int primary key not null,
	idMovimento int not null,
	idPessoaJuridica int not null,
	idUsuario int not null,
)

alter table Compra
	add constraint fk_CompraMov foreign key (idMovimento) references movimento (idMovimento);

alter table Compra
	add constraint fk_CompraUsua foreign key (idUsuario) references Usuario (idUsuario);

alter table Compra
	add constraint fk_CompraPF foreign key (idPessoaFisica) references PessoaFisica (idPessoaFisica);

alter table Venda
	add constraint fk_VendaMov foreign key (idMovimento) references Movimento (idMovimento);

alter table Venda
	add constraint fk_VendaUsua foreign key (idUsuario) references Usuario (idUsuario);

alter table Venda
	add constraint fk_VendaPJ foreign key (idPessoaJuridica) references PessoaJuridica (idPessoaJuridica);