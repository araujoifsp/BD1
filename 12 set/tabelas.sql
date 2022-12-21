use ALUNO_F17;
/*Gabriel ARaújo de Sousa - Gu3027261 */

create table shopping(
	codigo_shop varchar(3) PRIMARY KEY,
	nome_shop varchar(40) not null,
	endereco_shop varchar(30) not null,
	bairro_shop varchar(30),
	cidade_shop varchar(30) ,
	uf_shop varchar(2),
	fone_adm varchar(3)
)

create table lojas(
	Codigo_Loja varchar(3) PRIMARY KEY,
	Nome_Loja varchar(30) NOT NULL,
	Codigo_Shopping Varchar(03),
	CNPJ_Loja varchar(17) unique
	constraint fk_shop FOREIGN KEY (Codigo_Shopping) REFERENCES shopping
)

create table cargo(
	Codigo_Cargo varchar(5) PRIMARY KEY,
	Nome_do_Cargo varchar(05) not null,
	Comissao_Cargo real
)

create table funcionarios(
  Codigo_Funcionario varchar(3) PRIMARY KEY,
  Nome_do_Funcionario varchar(40) not null,
  Sexo char(1),
  Data_Nascimento date,
  cpf varchar(12) unique,
  Cod_Cargo varchar(5),
  Cod_loja varchar(3),
  Data_Admissao date,

  constraint fk_cargo FOREIGN KEY (Cod_Cargo) REFERENCES cargo,
  constraint fk_loja FOREIGN KEY (Cod_loja) REFERENCES lojas,
)

