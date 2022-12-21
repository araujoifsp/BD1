 use ALUNO_F17
 
 --      Alterando tabelas com comandos SQL
 


--1) Abrir o banco de dados criado acima
 
   
--2) Criar as tabelas abaixo, conforme dados

   -- 2.1 Tabela : Tb_Categorias
/*
       Campo           Tipo          Tamanho Caracter�stica
	Cod_Categoria	   Inteiro
	Categoria          Alfanum�rico   20        Vari�vel
      
    Chave Prim�ria : Cod_Categoria  
      
  */
 create table tb_categorias(
	cod_categoria int identity primary key,
	categoria varchar(20),
 )


--R. 



  
  
    -- 2.1) Tabela :TB_Clientes
    /*
         Campo         Tipo                Tamanho Caracter�stica
     	cod_Cli	       inteiro 
       	Nome	 	   Alfanum�rico        60     Tamanho Vari�vel
	    Sexo		   Alfanum�rico        1      Tamanho fixo - Deve aceitar somente 'F' ou 'M'
	    cpf		 	   Alanum�rico         10     Tamanhio fixo           
	    Cep            Alfanum�rico        09     Tamanho fixo
	    Cod_Categoria  Inteiro       
        Valor_Compra   Monet�rio         
       Chave Prim�ria: Cod_cli
       Chave Estrangeira: Cod_Categoria

*/    
create table tb_clientes (
	cod_cli int identity primary key,
	nome varchar(50),
	sexo varchar(1),
	cpf varchar(10),
	cep varchar(9),
	cod_categoria int,
	valor_compra real,

	constraint fk_categoria foreign key(cod_categoria) references tb_categorias
)

--R.



--3) Alterar o Tamanho do CPF para 12
--R.

alter table tb_clientes
	ALTER COLUMN cpf varchar(12);


 -- Listar os campos e suas caracter�sticas

 
go
--4) Excluir o campo (Coluna) Cep da tabela tb_clientes
--R.  

alter table tb_clientes
	DROP COLUMN cep;


 go
--5)Alterar o nome do Campo cpf para CPF_Cliente
--R.

	sp_rename 'tb_clientes.cpf', CPF_cliente;

	
          

--6) Listar os campos e suas caracter�sticas

	sp_help tb_clientes


--7) Adicionar o campo Data_Cadastro com o tipo datetime colocando como default a data do sistema
--R.
   
   alter table tb_clientes
	add data_cadastro date;


-- Listar os campos e suas caracter�sticas
	sp_help tb_clientes

-- inserir os dados na tabela: Tb_Categorias
        
  --*      Cod_Categoria   Categoria
         --1               Especial


			insert tb_categorias values('Especial')
	


-- inserir os dados na tabela: Tb_clientes

    /*(1,'Antonio da Malta','M','023876123-54',1,1500.00,getdate()) */
     
	 insert tb_clientes values('Antonio da Malta','M','023876123-54',1,1500.00,getdate())
	 

  -- listar os dados inseridos na tabela de categorias e clientes
  	select * from tb_categorias
	select * from tb_clientes

  
  
-- 8) Alterar o Campo Valor_compra com a constraint Check para valor > 0  sem alterar os registros 

	update tb_clientes set valor_compra = 0

--R. 

 
 
--9)Listar todos os campos e suas caracter�sticas das tabelas

   --  8.1) Tb_Clientes
          --R.   
          
          sp_help tb_clientes

    --8.2) Tb_Categorias
           --R.  

		   sp_help tb_categorias

--10)Inclluir a constraint unique na coluna CPF_cliente da Tb_Cliente
--R.

	alter table tb_clientes
		add constraint a unique(CPF_cliente);

--11) Excluir a constraint unique da coluna cpf
-- R.
	alter table tb_clientes
		drop constraint a;

  
 /*12) Inserir os registros nas respectivas tabelas
 
  Inserir os dados na tabela Tb_Categorias
        Cod_Categoria   Categoria
         2               Normal
         3               Novo 
         
         
R.

*/
	insert tb_categorias values('normal');
	insert tb_categorias values('novol');
/*

  Inserir os dados na tabela Tb_Clientes  

     Cod_Cliente  Nome                         Sexo    cpf              Cod_Categoria   Data          Valor_Compra
         2         Maria da Cruz dos Santos      F     '011556878-11'         2        23/03/2005      1365.00
         3        Maria das Gra�as               F     '012556878-13'         2        20/02/2005      1600.00

--R.
 
*/
	insert tb_clientes values('Maria da Cruz dos Santos','F','011556878-11',2,1365.00,'03-23-2005');
	insert tb_clientes values('Maria das Gra�as','F','012556878-13',2,1600.00,'02-20-2005');

--13) Alterar o campo Nome do cliente  para o tamanho de 60 caracteres
	
	ALTER TABLE tb_clientes
		ALTER COLUMN nome VARCHAR(60)

--14) Listar todos os dados da  tabela tb_Categorias
--R.

	select * from tb_categorias	

--15) Listar todos os dados da tabela Tb_Clientes
--R
	select * from tb_clientes

