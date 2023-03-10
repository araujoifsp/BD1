use ALUNO_F17;

/*                                                
                                                
 Aplicar os comandos criação de tabelas, Insert , delete, update e select

Obs.:
*/


-- Criar as Tabelas:

 /*       Funcionario
Coluna	          	Tipo		Tam 	    Descrição
NUM_FUNC (PK)            CHAR		 6	    Código do  empregado
NOME			VARCHAR	        12	    Primeiro nome
SOBRENOME	        VARCHAR	        25	    Sobrenome aluno - não nulo 
DEPT	(FK)		CHAR	         3	    Código de departamento do empregado
FONE			CHAR		14	    Numero de telefone
DTADIM		        DATE			    Data de admissão Data do Sistema como Padrão
NIVEL	        	Numero(Inteiro)	            Educação formal em anos
SEXO			CHAR		 1	    Masculino ou Feminico com 'M' para Masculino e 'F' para Feminino
DATANAS		        DATE			    Data de nascimento  
SALARIO         	Numero (moeda) 		    Salário Anual
BONUS	                Numero (moeda)		    Bônus Anual    - Valor Padrão  0	
COMIS	                Numero (moeda) 	            Comissão Anual
     

Obs.:   Para NIVEL  :-- 
                           1 -> Ensino Fundamental
                           2 –> Ensino Médio
                           3 –> Graduação
                           4 →  Pós-Graduação
 
 */

 create table funcionario(
	num_func char(3) PRIMARY KEY,
	nome varchar(12),
	sobrenome varchar(25) not null,
	dept int,
	fone varchar(14),
	dtadim date,
	nivel int,
	sexo char(1),
	datanas date,
	salario money,
	bonus money,
	comis money,

	constraint fk_depto FOREIGN KEY (dept) REFERENCES depto
 )



 /*


      Depto         

           
 Coluna	        	Tipo		Tam 	Descrição

 DEPTO (PK) 		CHAR	         3      Código do departamento
 DESC_DEPTO             VARCHAR          20     Nome do Departamento   Não nulo


 */

 create table depto(
	depto int IDENTITY(1,1) PRIMARY KEY,
	desc_depto varchar(20),
 )

 /*


Inserir os dados de   Depto

              DEPTO                              DESC_DEPTO
               001                               DIRETORIA
               002                               GERÊNCIA
               003                               ENGENHARIA
               004                               PRODUÇÃO
               005                               INFORMATICA
               006                               GERÊNCIA INFORMÁTICA

*/
	insert into depto values('Diretoria');
	insert into depto values('Gerência');
	insert into depto values('Engenharia');
	insert into depto values('Producao');
	insert into depto values('Informatica');
	insert into depto values('Gerencia Informatica');

	select * from depto;
	select * from funcionario;
/*
      
  Obs.: 1) Os códigos dos Funcionários deverão ser :”F001”,”F002”,”F003” ….
            2) Não inserir dados no campo BONUS
            3)Não inserir registros no Depto de “GERÊNCIA INFORMÁTICA”
            4) Para NIVEL  :--  
                                  1  -> Ensino Fundamental
                                  2  –> Ensino Médio
                                  3  –> Graduação
                                  4  -> Pós-Graduação

       Inserir   2 funcionários para Diretoria
       Inserir   3 funcionários para Gerência
       Inserir   3  funcionários para Engenharia
       Inserir   7  funcionários para Produção
       Inserir   5  funcionários para Informática

*/
	--diretoria
 	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F01','N1','S1',1,'(11)91111-1111','2018-09-19',4,'M','2003-05-15',5000);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F02','N2','S2',1,'(11)92222-2222','2018-09-19',3,'M','2003-07-19',5000);

	--Gerencia
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F03','N3','S3',2,'(11)93333-3333','2018-12-12',3,'M','2002-08-10',4000);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F04','N4','S4',2,'(11)94444-4444','2018-12-13',3,'F','2001-07-20',4000);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F05','N5','S5',2,'(11)95555-5555','2018-12-14',3,'F','2001-08-20',4000);

	--Engenharia
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F06','N6','S6',3,'(11)96666-6666','2019-02-08',4,'F','1995-12-09',3300);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F07','N7','S7',3,'(11)97777-7777','2019-02-09',3,'M','2000-11-01',3300);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F08','N8','S8',3,'(11)98888-8888','2019-02-19',3,'M','1999-09-10',3300);
	select * from funcionario

	--Produção
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F09','N9','S9',4,'(11)99999-9999','2019-02-02',2,'M','1984-05-01',2200);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F10','N10','N10',4,'(11)91111-2222','2019-02-15',2,'F','1993-06-03',2200);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F11','N11','S11',4,'(11)92222-1111','2019-02-19',1,'M','1990-12-10',2100);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F12','N12','S12',4,'(11)94444-0000','2019-03-12',1,'M','1989-11-16',2100);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F13','N13','S13',4,'(11)95555-1111','2019-03-16',2,'M','1995-10-01',2000);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F14','N14','S14',4,'(11)96666-0000','2019-05-20',2,'F','2000-06-19',2000);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F15','N15','S15',4,'(11)97777-0000','2019-05-22',2,'F','2000-04-08',1800);

	--Informatica
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F16','N16','S16',5,'(11)98888-0000','2019-02-02',2,'M','1984-05-01',2500);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F17','N17','N17',5,'(11)99999-1111','2019-02-15',2,'F','1993-06-03',2500);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F18','N18','S18',5,'(11)91010-1010','2019-02-19',1,'M','1990-12-10',2800);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F19','N19','S19',5,'(11)90000-2222','2019-03-12',1,'M','1989-11-16',2800);
	insert into funcionario(num_func,nome,sobrenome,dept,fone,dtadim,nivel,sexo,datanas,salario) values('F20','N20','S20',5,'(11)95555-4444','2019-03-16',2,'M','1995-10-01',3000);

--	Alterar todos os alguns dados dos Funcionários (Cuidado com o Nome - a pessoa pode casar e tirar e /ou acrescentar um sobrenome) – pelo menos 6 update para cada funcionário.
	

--	Aumentar  o  Salário dos funcionários em 17%
		update funcionario set salario = salario + (salario*0.17);
--	Alterar o campo Bonus  com 5% de Salário para todos os funcionários
		update funcionario set bonus = (salario*0.05);
--	Alterar o campo  Bonus com 15% de Salário para todos os funcionários de Engenharia
		update funcionario set bonus = (salario*0.15) where dept = 3;
--	Aumentar em 5% todos os Salários
		update funcionario set salario = salario + (salario*0.05);
--	Aumentar em 6% o Salário dos funcionários do Depto da Gerência
		update funcionario set salario = salario + (salario*0.06) where dept = 2;
--	Diminuir em 2% o Salário dos funcionários de Engenharia
		update funcionario set salario = salario - (salario*0.02) where dept = 3;
--	Alterar a Descrição do Depto de “INFORMATICA”  para “INFORMÁTICA”
		update depto set desc_depto = 'INFORMÁTICA' where desc_depto = 'Informatica';
--	Alterar o fone do Funcionário com código “F004”, para “3643-4576”
		update funcionario set fone = '3643-4576' where num_func = 'F04';
--	Excluir todos os registros de  Depto (Conseguiu ? explique)
		delete from funcionario
		delete from depto
--	Excluir o registro do Depto “GERENCIA INFORMÁTICA”
		delete from depto where desc_depto = 'Gerencia Informatica';
--	Excluir todos os registros de funcionários.
		delete from funcionario;
		delete from depto;
--      Incluir todos  os registros do Depto e Funcionários (Novamente ?)

--	Excluir os registros dos funcionários do departamento de INFORMÁTICA
		delete from funcionario where dept = 5
--	Excluir o registro do Depto de GERÊNCIA INFORMÁTICA
		delete from depto where desc_depto = 'Gerencia Informatica';
--	Listar todos os campos de todos os funcionários
		select * from funcionario
--	Listar todos os campos de todos os Departamentos		
		select * from depto
--	Listar os campos Numero  e Nome e Salário  (Colocar um Alias para cada campo)  de todos funcionários
		select num_func as Número,nome as Nome,salario as Salário from funcionario
--	Listar os campos Numero  e Nome e Salário de todos funcionários do Departamento de informática
		select num_func as Número,nome as Nome,salario as Salário from funcionario where dept = 5
--	Listar os campos Numero  e Nome e Salário de todos funcionários do Departamento de Produção com salário maior que R$ 2.000,00
		select num_func,nome,salario from funcionario where dept = 4 and salario > 2000.00
--	Listar os campos Numero  e Nome e Salário de todos funcionários do Departamento de Produção com salário menor que R$ 20.000,00
		select num_func,nome,salario from funcionario where dept = 4 and salario > 2000.00
--	Listar os campos Numero  e Nome e Salário de todos funcionários do Departamento de Informática com salário menor ou igual a  R$ 7.000,00
		select num_func,nome,salario from funcionario where dept = 5 and salario <= 7000.00
--	Listar os campos Numero  e Nome e Salário de todos funcionários do Departamento de Produção com salário entre R$ 600,00  e  R$ 2.000,00
	select num_func,nome,salario from funcionario where dept = 4 and salario <= 2000.00 and salario >= 600
--       Listar os campos Numero  e Nome e Salário de todos func	ionários do Departamento de Produção
	select num_func,nome,salario from funcionario where dept = 4
--	Listar os campos Número,Nome, Salário em ordem crescente de salário
	select num_func,nome,salario from funcionario order by salario
--	Listar os campos Número,Nome, Salário do Departamento de produção em ordem decrescente de salário.
	select num_func,nome,salario from funcionario where dept = 4 order by salario
--	Listar os campos Número, Nome, Data de Nascimento e Bonus dos funcionários de Informática.
	select num_func,nome,datanas,bonus from funcionario where dept = 5
--	Listar todos os dados dos funcionários com curso Superior (Graduação)  em ordem alfabética de nome (Colocar um apelido para campo)
	select * from funcionario where nivel = 3 order by nome
--	Listar todos dados dos funcionários com curso Pós-Graduação em ordem decrescente de nome
	select * from funcionario where nivel = 4 order by nome
--      listar os campos dos funcionários do Departamento de Informática com salário entre R$ 5.600,00 e R$ 8.000,00 usando 
	select num_func,nome,salario from funcionario where dept = 5 and salario <= 8000.00 and salario >= 5.600
  