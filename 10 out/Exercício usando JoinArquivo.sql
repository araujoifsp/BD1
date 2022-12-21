
--Criar as tabelas 

use ALUNO_F17

  Create table TB_Fornecedores
(
  Cod_Fornec    varchar(04),
  Nome_Fornec   Varchar(30),
  End_Foenec    Varchar(30),
  Bairro_Fornec Varchar(20),
  Contato_Fornec Varchar(30),
  Fone_Fornec    Varchar(30)
  Constraint PK_Fornec  primary key(Cod_Fornec)
)

Insert into TB_Fornecedores values 
('F001','Fabricas Matara ZZ','R. Lapa ,125','Centro','Jo�o Meirelles','11-4123-6565')
Insert into TB_Fornecedores values 
('F002','Distribuidora Lenz','R. Margarida Lis ,12','Santa Barbara','Mario Bora','12-3423-4576')


Create Table TB_Produtos
(
Cod_Prod    Varchar(05),
Nome_Prod   Varchar(30),
Tipo_Prod   Char   Check(Tipo_Prod in('P','N')),
Qtde_Estoque   Int,
Qtde_Minima  int,
Unidade      Varchar(05),
Vl_Venda    Decimal(10,2),
Vl_Compra   Decimal (10,2),
Cod_Fornec  Varchar(04),
  Constraint PK_Fornec_P  primary key(Cod_Prod),
  Constraint FK_Fornec_P  foreign key (Cod_Fornec) references TB_Fornecedores(Cod_Fornec),

)

insert into tb_produtos values
 ('P01','Leite Desnatado','P',100,50,'Un',1.27,0.60,'F001')

insert into tb_produtos values
 ('P10','Macarr�o Letra','P',150,150,'Un',1.70,0.70,'F001')

insert into tb_produtos values
 ('P20','Spaguetti','P',100,250,'Un',1.75,0.75,'F001')

insert into tb_produtos values
 ('P30','Geleia Uvao','P',100,50,'Un',4.30,1.90,'F002')

insert into tb_produtos values
 ('P40','Leite Integral','P',200,150,'Un',1.78,0.90,'F002')

insert into tb_produtos values
 ('P02','DVD-Virgem','N',100,200,'Un',0.50,0.10,'F001')

insert into tb_produtos values
 ('P03','Capacete','N',100,50,'Un',70.00,20.00,'F002')



go



Create Table TB_Pereciveis
(
 Cod_Prod   Varchar(05),
 Data_Compra datetime,
 Data_Vencimento Datetime
  Constraint PK_Perecivel  primary key(Cod_Prod)
  Constraint FK_Pereciveis  foreign key (Cod_Prod) references TB_Produtos(Cod_Prod)
)

go

insert into TB_Pereciveis values
 ('P01','03-25-2011','06-24-2013')

insert into TB_Pereciveis values
 ('P10','04-26-2011','06-25-2013')

insert into TB_Pereciveis values
 ('P20','05-25-2011','08-24-2014')

insert into TB_Pereciveis values
 ('P30','02-25-2011','11-09-2013')

insert into TB_Pereciveis values
 ('P40','02-25-2011','01-09-2013')



--1) Selecionar o c�digo do Fornecedor,nome do fornecedor e  Nome do produtos e valor de Compra 
 select TB_Fornecedores.Cod_Fornec,Nome_Fornec,Nome_Prod,Vl_Compra from TB_Fornecedores inner join TB_Produtos on TB_Fornecedores.Cod_Fornec = TB_Produtos.Cod_Fornec
 

--2) Selecionar o Codigo do Fornecedor, Nome do Fornecedor, Codigo do Produto,
      -- Nome do Produto que s�o Perec�veis
 select TB_Fornecedores.Cod_Fornec,Nome_Fornec,Cod_Prod from TB_Fornecedores inner join TB_Produtos on TB_Fornecedores.Cod_Fornec = TB_Produtos.Cod_Fornec where TB_Produtos.Tipo_prod = 'P'
 
--3) Selecionar o Nome do Fornecedor, Nome do Contato, Fone e Codigo do Produto e Nome dos Produtos, quantidade Minima e quantidade em estoque  que est�o com a
   --  quantidade abaixo do estoque
  select Nome_Fornec,Contato_Fornec,Fone_Fornec,Cod_Prod from TB_Fornecedores inner join TB_Produtos on TB_Fornecedores.Cod_Fornec = TB_Produtos.Cod_Fornec where TB_Produtos.Qtde_Minima < TB_Produtos.Qtde_Estoque
  

--4) Selecionar o  Codigo do Produto e Nome do Produto, 
    -- data vencimento dos produtos perec�veis
  select TB_Produtos.Cod_Prod,Nome_Prod,Data_Vencimento from TB_Produtos inner join TB_Pereciveis on TB_Produtos.Cod_Prod = TB_Pereciveis.Cod_Prod

--5) Selecionar o  Codigo do Produto e Nome do Produto, data vencimento
     --  dos produtos perec�veis que ir�o vencer em 30 dias.
select TB_Produtos.Cod_Prod,Nome_Prod,Data_Vencimento from TB_Produtos inner join TB_Pereciveis on TB_Produtos.Cod_Prod = TB_Pereciveis.Cod_Prod where DATEDIFF(day, Data_Vencimento, getdate()) < 30;

--6) Selecionar o  Codigo do Produto e Nome do Produto, data vencimento, qtde de dias a vencer 
     --  dos produtos perec�veis
select TB_Produtos.Cod_Prod,Nome_Prod,Data_Vencimento,DATEDIFF(day, GETDATE(), Data_Vencimento)from TB_Produtos inner join TB_Pereciveis on TB_Produtos.Cod_Prod = TB_Pereciveis.Cod_Prod


 
--7) Selecionar o  Codigo do Fornecedor, Nome do Fornecedor, total de Venda do estoque por fornecedor referente aos produtos perec�veis
select Nome_Fornec,sum(TB_Produtos.Vl_Venda) from TB_Produtos inner join TB_Fornecedores on TB_Produtos.Cod_Fornec = TB_Fornecedores.Cod_Fornec GROUP BY Nome_Fornec 

--8) Selecionar o  Codigo do Fornecedor, Nome do Fornecedor, Total de Compra do estoque por fornecedor referente aos produtos perec�veis
 select Nome_Fornec,sum(TB_Produtos.Vl_Compra) from TB_Produtos inner join TB_Fornecedores on TB_Produtos.Cod_Fornec = TB_Fornecedores.Cod_Fornec GROUP BY Nome_Fornec 

