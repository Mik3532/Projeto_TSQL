create database Romullus;

use Romullus;

--banco de dados pode da erro no ID de algumas tabelas
--lembrar de conferir o ID quando fazer os insert


--inserido 
create table uf (
	id int primary key identity (1,1),
	nome_uf varchar (120),
	sigla_uf char (2)
);

--inserido 
create table tipoContato (
	id int primary key identity (1,1),
    nome varchar (80) not null
);

--inserido 
create table contatoSite (
	id int primary key identity (1,1),  
	nome varchar (80) not null,
	email varchar (80) not null,
	mensagem text not null, 
	datahora datetime not null,
    fk_TipoContato_id int, 
	foreign key (fk_TipoContato_id)	references tipoContato(id)
);

--inserido
create table logins (
id int primary key identity (1,1),
email varchar (120),
senha nchar (32),
fk_usuario_id int
);

--inserido
create table imovel (
	id int primary key identity (1,1),
	qtd_vaga int not null,
	qtd_quarto int not null,
	qtd_suite int not null,
	qtd_banheiro int not null,
	area_util int not null,
	valor_imovel decimal not null,
	observacoes text null,
	fk_tipoimovel_id int,
	fk_endereco_id int,
	fk_tipoanuncio_id int,
);

--inserido 
create table endereco (
	id int primary key identity (1,1),
	logradouro varchar (120) not null,
	numero int not null,
	complemento varchar (120) ,
	fk_bairro_id int
);

--inserido
create table bairro (
	id int primary key identity  (1,1),
	nome_bairro varchar (120) not null,
	fk_cidade_id int
);

--inserido
create table cidade (
	id int primary key identity  (1,1),
	nome_cidade varchar (120) not null,
	fk_uf_id int
);

--inserido
create table usuario (
	id int primary key identity (1,1),
	nome varchar (120) not null,
	senha nchar (32) not null,
	datahoracriacao datetime not null,
	datahoraultimoacesso datetime not null,
	email varchar (120) not null,
	fk_tipousuario_id int
);

--inserido
create table tipoanuncio (
	id int primary key identity (1,1),
	nome_tipo_anuncio varchar (120) not null
);

--inserido
create table tipoimovel (
	id int primary key identity (1,1),
	nometipoimovel varchar (120) not null
);

--inserido 
create table tipousuario (
	id int primary key identity (1,1),
	tipo varchar (120) not null
);

--inserido
create table imagem (
	id int primary key identity  (1,1),
	nome_imagem varchar (120) not null,
	ur_l varchar (120) not null,
	fk_imovel_id int
);


--criando as Foreign Key pela Alteração de tabela 

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_TipoUsuario_ID)
    REFERENCES TipoUsuario (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (fk_UF_ID)
    REFERENCES UF (ID)
 
 
ALTER TABLE Bairro ADD CONSTRAINT FK_Bairro_2
    FOREIGN KEY (fk_Cidade_ID)
    REFERENCES Cidade (ID)

 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_2
    FOREIGN KEY (fk_Bairro_ID)
    REFERENCES Bairro (ID)
  
 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_2
    FOREIGN KEY (fk_TipoImovel_ID)
    REFERENCES TipoImovel (ID)

 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_3
    FOREIGN KEY (fk_Endereco_ID)
    REFERENCES Endereco (ID)

 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_4
    FOREIGN KEY (fk_TipoAnuncio_ID)
    REFERENCES TipoAnuncio (ID)
    ON DELETE CASCADE;
 
 
ALTER TABLE Imagem ADD CONSTRAINT FK_Imagem_2
    FOREIGN KEY (fk_Imovel_ID)
    REFERENCES Imovel (ID)
 
 
ALTER TABLE logins ADD CONSTRAINT FK_logins_2
    FOREIGN KEY (Fk_Usuario_Id)
    REFERENCES Usuario (ID);

--inserindo na tabela UF
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Acre', 'AC');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Alagoas', 'AL');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Amapá', 'AP');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Amazonas', 'AM');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Bahia', 'BA');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Ceará', 'CE');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Distrito Federal', 'DF');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Espírito Santo', 'ES');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Goiás', 'GO');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Maranhão', 'MA');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Mato Grosso', 'MT');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Mato Grosso do Sul', 'MS');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Minas Gerais', 'MG');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Pará', 'PA');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Paraíba', 'PB');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Paraná', 'PR');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Pernambuco', 'PE');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Piauí', 'PI');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Rio de Janeiro', 'RJ');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Rio Grande do Norte', 'RN');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Rio Grande do Sul', 'RS');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Rondônia', 'RO');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Roraima', 'RR');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Santa Catarina', 'SC');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('São Paulo', 'SP');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Sergipe', 'SE');
INSERT INTO UF (nome_uf, sigla_uf) VALUES ('Tocantins', 'TO');

--inserindo na tabela TipoContato
 insert into tipoContato (nome) values ('Não encontrei o imóvel');
 insert into tipoContato (nome) values ('Não encontrei o Vendedor');
 insert into tipoContato (nome) values ('Quero Vender');
 insert into tipoContato (nome) values ('Critica');
 insert into tipoContato (nome) values ('Sugestão');



  insert into contatoSite (Nome, Email, Mensagem, DataHora , fk_TipoContato_id) values
('Maria da Silva', 'mariasilva@gmail.com', 'Olá, gostaria de agendar uma visita para ver o apartamento.', '2023-11-09 10:00:00',4),
('João Santos', 'joaosantos@hotmail.com', 'Gostaria de saber se o apartamento ainda está disponível.', '2023-11-09 10:30:00',2),
('Ana Paula', 'anapaula@yahoo.com', 'Qual é o valor do aluguel?', '2023-11-09 11:00:00',1),
('Pedro Henrique', 'pedrohenrique@gmail.com', 'O apartamento tem vaga de garagem?', '2023-11-09 11:30:00',3),
('Juliana Oliveira', 'julianaoliveira@hotmail.com', 'Gostaria de saber se o apartamento tem varanda.', '2023-11-09 12:00:00',2),
('Rafaela Souza', 'rafaelasouza@yahoo.com', 'O apartamento fica próximo a alguma estação de metrô?', '2023-11-09 12:30:00',3),
('Luiz Carlos', 'luizcarlos@gmail.com', 'Gostaria de saber se o apartamento tem armários embutidos.', '2023-11-09 13:00:00',5),
('Fernanda Alves', 'fernandaalves@hotmail.com', 'Qual é a forma de pagamento do aluguel?', '2023-11-09 13:30:00',4),
('Carlos Eduardo', 'carloseduardo@yahoo.com', 'O apartamento tem área de lazer?', '2023-11-09 14:00:00',1),
('Isabela Santos', 'isabelasantos@gmail.com', 'Gostaria de saber se o apartamento tem ar-condicionado.', '2023-11-09 14:30:00',2);

--inserindo na tabela TipoAnuncio
INSERT INTO TipoAnuncio (nome_tipo_anuncio) VALUES ('Venda');
INSERT INTO TipoAnuncio (nome_tipo_anuncio) VALUES ('Aluguel');
INSERT INTO TipoAnuncio (nome_tipo_anuncio) VALUES ('Temporada');
INSERT INTO TipoAnuncio (nome_tipo_anuncio) VALUES ('Compartilhamento');
INSERT INTO TipoAnuncio (nome_tipo_anuncio) VALUES ('Leilão');

--inserindo na tabela TipoImovel
INSERT INTO TipoImovel (nometipoimovel) VALUES ('Casa');
INSERT INTO TipoImovel (nometipoimovel) VALUES ('Apartamento');
INSERT INTO TipoImovel (nometipoimovel) VALUES ('Sítio');
INSERT INTO TipoImovel (nometipoimovel) VALUES ('Loja');
INSERT INTO TipoImovel (nometipoimovel) VALUES ('Terreno');

--inserindo na tabela TipoUsuario
INSERT INTO TipoUsuario (tipo) VALUES ('Administrador');
INSERT INTO TipoUsuario (tipo) VALUES ('Corretor');
INSERT INTO TipoUsuario (tipo) VALUES ('Proprietário');
INSERT INTO TipoUsuario (tipo) VALUES ('Usuário Comum');
INSERT INTO TipoUsuario (tipo) VALUES ('Visitante');

--inserindo na tabela logins
INSERT INTO Logins (email, senha, fk_usuario_id) VALUES ('admin@example.com', 'admin123', 1);
INSERT INTO Logins (email, senha, fk_usuario_id) VALUES ('corretor1@example.com', 'corretor123', 2);
INSERT INTO Logins (email, senha, fk_usuario_id) VALUES ('proprietario1@example.com', 'proprietario123', 3);
INSERT INTO Logins (email, senha, fk_usuario_id) VALUES ('usuario1@example.com', 'usuario123', 4);
INSERT INTO Logins (email, senha, fk_usuario_id) VALUES ('visitante1@example.com', 'visitante123', 5);

--inserindo na tabela logins
INSERT INTO Cidade (nome_cidade, fk_uf_id) VALUES ('São Paulo', 1);
INSERT INTO Cidade (nome_cidade, fk_uf_id) VALUES ('Rio de Janeiro', 1);
INSERT INTO Cidade (nome_cidade, fk_uf_id) VALUES ('Belo Horizonte', 2);
INSERT INTO Cidade (nome_cidade, fk_uf_id) VALUES ('Porto Alegre', 3);
INSERT INTO Cidade (nome_cidade, fk_uf_id) VALUES ('Salvador', 4);

--inserindo na tabela bairro
INSERT INTO Bairro (nome_bairro, fk_cidade_id) VALUES ('Moema', 1);
INSERT INTO Bairro (nome_bairro, fk_cidade_id) VALUES ('Copacabana', 2);
INSERT INTO Bairro (nome_bairro, fk_cidade_id) VALUES ('Lourdes', 3);
INSERT INTO Bairro (nome_bairro, fk_cidade_id) VALUES ('Moinhos de Vento', 4);
INSERT INTO Bairro (nome_bairro, fk_cidade_id) VALUES ('Barra', 5);

--inserindo na tabela endereco
INSERT INTO Endereco (logradouro, numero, complemento, fk_bairro_id) VALUES ('Av. Paulista', 123, 'Apto 45', 1);
INSERT INTO Endereco (logradouro, numero, complemento, fk_bairro_id) VALUES ('Rua Nascimento Silva', 456, 'Casa 78', 2);
INSERT INTO Endereco (logradouro, numero, complemento, fk_bairro_id) VALUES ('Av. Bias Fortes', 789, 'Loja 12', 3);
INSERT INTO Endereco (logradouro, numero, complemento, fk_bairro_id) VALUES ('Rua Padre Chagas', 101, 'Apto 23', 4);
INSERT INTO Endereco (logradouro, numero, complemento, fk_bairro_id) VALUES ('Av. Tancredo Neves', 555, 'Sala 34', 5);

--inserindo na tabela usuario
INSERT INTO Usuario (nome, senha, datahoracriacao, datahoraultimoacesso, email, fk_tipousuario_id) VALUES ('CelsoCarequinha', 'admin123', GETDATE(), GETDATE(), 'celsodoTreno@gmail.com', 1);
INSERT INTO Usuario (nome, senha, datahoracriacao, datahoraultimoacesso, email, fk_tipousuario_id) VALUES ('Vitoria', 'corretor123', GETDATE(), GETDATE(), 'vitoriabraba1@gmail.com', 2);
INSERT INTO Usuario (nome, senha, datahoracriacao, datahoraultimoacesso, email, fk_tipousuario_id) VALUES ('Gomes', 'bolinha123', GETDATE(), GETDATE(), 'ProfessorGomes@gmail.com', 3);
INSERT INTO Usuario (nome, senha, datahoracriacao, datahoraultimoacesso, email, fk_tipousuario_id) VALUES ('Tatiene', 'skt82341', GETDATE(), GETDATE(), 'tatiquebrabarraco1@gmail.com', 4);
INSERT INTO Usuario (nome, senha, datahoracriacao, datahoraultimoacesso, email, fk_tipousuario_id) VALUES ('Pedro', 'carropreto', GETDATE(), GETDATE(), 'PedroAlves1@gmail.com', 5);

--inserindo na tabela imovel
INSERT INTO Imovel (qtd_vaga, qtd_quarto, qtd_suite, qtd_banheiro, area_util, valor_imovel, observacoes, fk_tipoimovel_id, fk_endereco_id, fk_tipoanuncio_id)VALUES (2, 3, 2, 3, 150, 350000.00, 'Ótima localização', 1, 6, 1);
INSERT INTO Imovel (qtd_vaga, qtd_quarto, qtd_suite, qtd_banheiro, area_util, valor_imovel, observacoes, fk_tipoimovel_id, fk_endereco_id, fk_tipoanuncio_id) VALUES (1, 2, 1, 1, 80, 200000.00, 'Próximo à praia', 1, 7, 2);
INSERT INTO Imovel (qtd_vaga, qtd_quarto, qtd_suite, qtd_banheiro, area_util, valor_imovel, observacoes, fk_tipoimovel_id, fk_endereco_id, fk_tipoanuncio_id) VALUES (3, 4, 3, 4, 200, 500000.00, 'Excelente vista', 2, 8, 1);
INSERT INTO Imovel (qtd_vaga, qtd_quarto, qtd_suite, qtd_banheiro, area_util, valor_imovel, observacoes, fk_tipoimovel_id, fk_endereco_id, fk_tipoanuncio_id) VALUES (2, 2, 1, 2, 90, 180000.00, 'Bem conservado', 1, 9, 2);
INSERT INTO Imovel (qtd_vaga, qtd_quarto, qtd_suite, qtd_banheiro, area_util, valor_imovel, observacoes, fk_tipoimovel_id, fk_endereco_id, fk_tipoanuncio_id) VALUES (1, 1, 1, 1, 60, 120000.00, 'Ótimo para investimento', 3, 10, 3);


--inserindo na tabela Imagem 

--imagem 1
INSERT INTO Imagem (nome_imagem, ur_l, fk_imovel_id) VALUES ('1.1','C:\Users\ead\Desktop\img\Romullus\ASSETS\1.1.jpg', 12),('1.2','C:\Users\ead\Desktop\img\Romullus\ASSETS\1.2.jpg',12);
--imagem 2
INSERT INTO Imagem (nome_imagem, ur_l, fk_imovel_id) VALUES ('2.1','C:\Users\ead\Desktop\img\Romullus\ASSETS\2.1.jpg',13),('2.2','C:\Users\ead\Desktop\img\Romullus\ASSETS\2.2.jpg',13);
--imagem 3
INSERT INTO Imagem (nome_imagem, ur_l, fk_imovel_id) VALUES ('3.1','C:\Users\ead\Desktop\img\Romullus\ASSETS\3.1.jpg',14),('3.2','C:\Users\ead\Desktop\img\Romullus\ASSETS\3.2.jpg',14);
--imagem 4
INSERT INTO Imagem (nome_imagem, ur_l, fk_imovel_id) VALUES ('4.1','C:\Users\ead\Desktop\img\Romullus\ASSETS\4.1.jpg',15),('4.2','C:\Users\ead\Desktop\img\Romullus\ASSETS\4.2.jpg',15);
--imagem 5
INSERT INTO Imagem (nome_imagem, ur_l, fk_imovel_id) VALUES ('5.1','C:\Users\ead\Desktop\img\Romullus\ASSETS\5.1.jpg',16),('5.2','C:\Users\ead\Desktop\img\Romullus\ASSETS\5.2.jpg',16);


 select*from uf;
 select*from tipoContato;
 select*from contatoSite;
 select*from tipoanuncio;
 select*from TipoImovel;
 select*from logins;
 select*from endereco;
 select*from usuario;
 select*from imovel;
 select*from imagem;


--Apagando procedure caso ja exista uma com mesmo nome 
 if object_id ('imagensPorImovel','P') is not null
    drop procedure imagensPorImovel;
 go

 --criando nova procedure
 create procedure imagensPorImovel 
	@imovelid int 
as
begin
	select*
	from imagem 
	where fk_imovel_id = @imovelid

end;
go
exec imagensPorImovel @imovelid = 12 ;


--apagando procedure caso exista 
 if object_id ('inserirlog','P') is not null
    drop procedure inserirlog ;
 go

 --criando procedure 
Create procedure inserirlog
	@email varchar (120),
	@senha varchar (32),
	@fkusuario int
as 
begin
	insert into logins (email,senha,fk_usuario_id) 
	values (@email,@senha,@fkusuario);

end;
go

--inserindo os dados do logins
exec inserirlog  @email = 'DogCaramelo@gmail.com' , @senha = ViraLara321 , @fkusuario = 5;



--apagando procedure alterasenha caso exista
if object_id ('alterasenha','P') is not null
    drop procedure alterasenha;
 go

 --criando procedure para altera senha 
create procedure alterasenha
	@id int,
	@novasenha varchar (32)
as
begin 

update usuario 
set senha = @novasenha
where id = @id;

end;

exec alterasenha @id = 3 , @novasenha = 'GammaGoblins';


--apagando procedure caso exista
if object_id ('deletelogin','P') is not null
    drop procedure deletelogin;
 go
 
 --criando procedure para deletar login
 create procedure deletelogin
 @id int

 as
 begin

	delete from logins
	where id = @id;

end;
go
--falando qual id quero deletar
exec deletelogin @id = 13;


--apagando a procedure caso exista
if object_id ('ImoveisTipoAnuncio','P') is not null
    drop procedure ImoveisTipoAnuncio;
 go

 create procedure ImoveisTipoAnuncio
	@idtipo int
 as
 begin
	select  tipoanuncio.nome_tipo_anuncio,imovel.valor_imovel ,  imovel.observacoes 
	from imovel
	inner join tipoanuncio
	on imovel.fk_tipoanuncio_id = tipoanuncio.id
	where fk_tipoanuncio_id = @idtipo;

 end;
 go

 exec ImoveisTipoAnuncio @idtipo = 2;

 select*from tipoanuncio;
  select*from imovel;

go

--apagando procedure caso exista
if object_id ('aumento ','P') is not null
    drop procedure aumento ;
 go


create procedure aumento 
 @fatoraumento float

as 
begin
	update imovel
	set valor_imovel = valor_imovel * @fatoraumento

end;
go

exec aumento @fatoraumento = 1.20;

select*from imovel;


update imovel
set valor_imovel= 500000;

go

--apagando procedure caso exista
if object_id ('inseriusuarios','P') is not null
    drop procedure inseriusuarios;
 go

create procedure inseriusuarios
@nome varchar (120),
@senha nchar(32),
@email varchar (120),
@fk int

as
begin
	
	insert into usuario (nome,senha,datahoracriacao,datahoraultimoacesso,email,fk_tipousuario_id)
	values (@nome, @senha, GETDATE(), GETDATE(), @email, @fk);

end;
go

exec inseriusuarios @nome= 'MatheusOliveira' , @senha = 'Fritinho123' , @email = 'matheusfritinho@gmail.com', @fk = 3;

select*from usuario;

go
--------viws
create view vw_DetalhesImoveisAcre as 
select 
	i.id,
	i.valor_imovel,
	e.logradouro,
	e.numero,
	b.nome_bairro,
	c.nome_cidade,
	u.nome_uf
	
from imovel i
join endereco e
on i.fk_endereco_id = e.id
join bairro b
on e.fk_bairro_id = b.id
join cidade c
on b.fk_cidade_id = c.id
join uf u
on c.fk_uf_id= u.id
where nome_uf = 'Acre';

go

select*from vw_DetalhesImoveisAcre;

--------------------------------------------
go
CREATE VIEW detalhesimovel AS
SELECT
    i.id, 
    i.qtd_vaga ,
    i.qtd_quarto ,
    i.qtd_suite, 
    i.qtd_banheiro ,
    i.area_util ,
    i.valor_imovel, 
    i.observacoes ,
    ti.nometipoimovel ,
    e.logradouro ,
    e.numero ,
    e.complemento ,
    b.nome_bairro ,
    c.nome_cidade ,
    uf.sigla_uf ,
    ta.nome_tipo_anuncio 
FROM imovel i
    JOIN tipoimovel ti 
	ON i.fk_tipoimovel_id = ti.id
    JOIN endereco e 
	ON i.fk_endereco_id = e.id
    JOIN bairro b
	ON e.fk_bairro_id = b.id
    JOIN cidade c 
	ON b.fk_cidade_id = c.id
    JOIN uf 
	ON c.fk_uf_id = uf.id
    JOIN tipoanuncio ta 
	ON i.fk_tipoanuncio_id = ta.id;


	select*from detalhesimovel;
	------------------------------------------------

	-----------------------------------
go


CREATE VIEW SomaValoresImoveisPorTipo AS
SELECT
    ti.nometipoimovel AS TipoImovel,
    SUM(i.valor_imovel) AS SomaValores
FROM
    tipoimovel ti
    LEFT JOIN imovel i ON ti.id = i.fk_tipoimovel_id
GROUP BY
    ti.nometipoimovel;

go

CREATE PROCEDURE DeletarImoveisPorCidade
    @NomeCidade varchar(120)
AS
BEGIN
    SET NOCOUNT ON;

    -- Deletar imóveis relacionados ao endereço na cidade específica
    DELETE FROM imovel
    WHERE fk_endereco_id IN (
        SELECT e.id
        FROM endereco e
        JOIN bairro b ON e.fk_bairro_id = b.id
        JOIN cidade c ON b.fk_cidade_id = c.id
        WHERE c.nome_cidade = @NomeCidade
    );

    -- Deletar endereços e bairros associados à cidade específica
    DELETE FROM endereco
    WHERE fk_bairro_id IN (
        SELECT b.id
        FROM bairro b
        JOIN cidade c ON b.fk_cidade_id = c.id
        WHERE c.nome_cidade = @NomeCidade
    );

    DELETE FROM bairro
    WHERE fk_cidade_id IN (
        SELECT id
        FROM cidade
        WHERE nome_cidade = @NomeCidade
    );
END;
