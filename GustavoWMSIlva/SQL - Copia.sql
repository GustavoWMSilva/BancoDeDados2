DROP TABLE OBRA CASCADE CONSTRAINTS;
DROP TABLE Tipo_de_Obra CASCADE CONSTRAINTS;
DROP TABLE Pessoa CASCADE CONSTRAINTS;
DROP TABLE Autor CASCADE CONSTRAINTS;
DROP TABLE Emprestimo CASCADE CONSTRAINTS;
DROP TABLE Professor CASCADE CONSTRAINTS;
DROP TABLE Aluno CASCADE CONSTRAINTS;

CREATE TABLE Tipo_de_Obra (
    codigo CHAR(8) ,
    descricao VARCHAR(30)check(descricao IN ('livro', 'revista', 'artigo','material especial'))  NOT NULL,
	CONSTRAINT pk_Tipo_de_Obra_cod PRIMARY KEY (codigo)
	
	
);

CREATE TABLE Autor (
    autor varchar(50) ,
	CONSTRAINT pk_autor_PK PRIMARY KEY (autor)
);

CREATE TABLE Obra (
    codigo CHAR(8),
    titulo VARCHAR(62) NOT NULL,
    fk_autor_PK VARCHAR(50),
    nro_de_paginas NUMERIC(10, 0) NOT NULL,
    fk_Tipo_de_Obra_codigo CHAR(8),
	CONSTRAINT pk_obra_cod PRIMARY KEY (codigo)
);


CREATE TABLE Pessoa (
    cpf CHAR(11) ,
    nome VARCHAR(70) NOT NULL,
    email VARCHAR(62) NOT NULL,
    telefone CHAR(13) NULL,
    genero CHAR(1) check(genero IN ('M', 'F', 'I')) NOT NULL,
	
	CONSTRAINT ak_email UNIQUE (email),
	
	CONSTRAINT pk_Pessoa_cpf PRIMARY KEY (cpf)
);



CREATE TABLE Emprestimo (
    data_do_emprestimo DATE NOT NULL,
    data_da_devolucao DATE NOT NULL,
    fk_Pessoa_cpf CHAR(11),
    fk_Obra_codigo CHAR(8)
);


CREATE TABLE Professor (
    data_contratacao DATE NOT NULL,
    fk_Pessoa_cpf CHAR(11)
);

CREATE TABLE Aluno (
    nro_matricula CHAR(10) NOT NULL,
    nro_creditos_concluidos NUMERIC(3, 0),
    fk_Pessoa_cpf CHAR(11)
);
 
ALTER TABLE Obra ADD CONSTRAINT fk_Obra_1
    FOREIGN KEY (fk_autor_PK)
    REFERENCES Autor (autor);
 
ALTER TABLE Obra ADD CONSTRAINT fk_Obra_2
    FOREIGN KEY (fk_Tipo_de_Obra_codigo)
    REFERENCES Tipo_de_Obra (codigo);
 
ALTER TABLE Emprestimo ADD CONSTRAINT fk_Emprestimo_1
    FOREIGN KEY (fk_Pessoa_cpf)
    REFERENCES Pessoa (cpf);
 
ALTER TABLE Emprestimo ADD CONSTRAINT fk_Emprestimo_2
    FOREIGN KEY (fk_Obra_codigo)
    REFERENCES Obra (codigo);
 
ALTER TABLE Professor ADD CONSTRAINT fk_Professor_1
    FOREIGN KEY (fk_Pessoa_cpf)
    REFERENCES Pessoa (cpf);
 
ALTER TABLE Aluno ADD CONSTRAINT fk_Aluno_1
    FOREIGN KEY (fk_Pessoa_cpf)
    REFERENCES Pessoa (cpf);



--------------------Insert 3 Obras----------------------

INSERT INTO Tipo_de_Obra (codigo, descricao)
VALUES ('TO219390', 'livro');

INSERT INTO Tipo_de_Obra (codigo, descricao)
VALUES ('TO234123', 'revista');

INSERT INTO Tipo_de_Obra (codigo, descricao)
VALUES ('TO221233', 'artigo');

INSERT INTO Tipo_de_Obra (codigo, descricao)
VALUES ('TO251535', 'material especial');



INSERT INTO Autor (autor)
VALUES ('Baitaca');

INSERT INTO Autor (autor)
VALUES ('Radiohead');

INSERT INTO Autor (autor)
VALUES ('Israel Rodolfo');



INSERT INTO Obra (codigo, titulo, fk_autor_PK, nro_de_paginas, fk_Tipo_de_Obra_codigo)
VALUES ('2023RS32', 'Fui Criado na Campanha', 'Baitaca', 200, 'TO219390');

INSERT INTO Obra (codigo, titulo, fk_autor_PK, nro_de_paginas, fk_Tipo_de_Obra_codigo)
VALUES ('2010RS32', 'De Chao Batido', 'Baitaca', 90, 'TO251535');

INSERT INTO Obra (codigo, titulo, fk_autor_PK, nro_de_paginas, fk_Tipo_de_Obra_codigo)
VALUES ('2022BR21', 'Creep', 'Radiohead', 350, 'TO234123');

INSERT INTO Obra (codigo, titulo, fk_autor_PK, nro_de_paginas, fk_Tipo_de_Obra_codigo)
VALUES ('3123PO32', 'Batom de Cereja', 'Israel Rodolfo', 150, 'TO221233');



----------------Insert 5 Pessoas ------------------------------

INSERT INTO Pessoa (cpf, nome, email, telefone, genero)
VALUES ('60058422005', 'Gustavo WIllian Martins da Silva', 'willian.gustavo@edu.pucrs.br', '5551997378210', 'M');

INSERT INTO Pessoa (cpf, nome, email, telefone, genero)
VALUES ('59202723488', 'Arlandi da Silva Soarez ', 'Arlan.Sz@gmail.com', '5548997378210', 'I');

INSERT INTO Pessoa (cpf, nome, email, telefone, genero)
VALUES ('12732234095', 'Daniel Antonio Callegari', 'daniel.callegari@pucrs.br', '5551985038396', 'M');

INSERT INTO Pessoa (cpf, nome, email, telefone, genero)
VALUES ('44952232705', 'Tiago Coelho Ferreto', 'tiago.ferreto@pucrs.br', '5551985038396', 'M');

INSERT INTO Pessoa (cpf, nome, email, telefone, genero)
VALUES ('62229012306', 'Lucia Maria Martins Giraffa', 'giraffa@pucrs.br', '5551984802209', 'F');



--------------Professor----------------

INSERT INTO Professor (data_contratacao, fk_Pessoa_cpf)
VALUES (to_date('04/10/2016', 'dd/mm/yyyy'), '12732234095');

INSERT INTO Professor (data_contratacao, fk_Pessoa_cpf)
VALUES (to_date('01/04/2010', 'dd/mm/yyyy'), '44952232705');

INSERT INTO Professor (data_contratacao, fk_Pessoa_cpf)
VALUES (to_date('05/01/2008', 'dd/mm/yyyy'), '62229012306');


--------------Aluno----------------

INSERT INTO Aluno (nro_matricula, nro_creditos_concluidos, fk_Pessoa_cpf)
VALUES ('2211125207', 90,'60058422005' );

INSERT INTO Aluno (nro_matricula, nro_creditos_concluidos, fk_Pessoa_cpf)
VALUES ('2211121201', 120, '59202723488');


------------Emprestimo--------------

INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/03/2023', 'dd/mm/yyyy'),'60058422005' , '2023RS32');

INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/03/2023', 'dd/mm/yyyy'),'60058422005' , '3123PO32');

INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('05/01/2023', 'dd/mm/yyyy'), to_date('06/03/2023', 'dd/mm/yyyy'),'60058422005' , '2010RS32');


INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('20/11/2022', 'dd/mm/yyyy'), to_date('23/12/2022', 'dd/mm/yyyy'),'12732234095' , '2023RS32');

INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('19/03/2023', 'dd/mm/yyyy'), to_date('12/05/2023', 'dd/mm/yyyy'),'12732234095' , '3123PO32');

INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('20/11/2022', 'dd/mm/yyyy'), to_date('23/12/2022', 'dd/mm/yyyy'),'12732234095' , '2022BR21');


INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('12/03/2023', 'dd/mm/yyyy'), to_date('23/03/2023', 'dd/mm/yyyy'),'59202723488' , '2022BR21');

INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('12/03/2023', 'dd/mm/yyyy'), to_date('23/03/2023', 'dd/mm/yyyy'),'59202723488' , '3123PO32');


INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('15/11/2022', 'dd/mm/yyyy'), to_date('29/01/2023', 'dd/mm/yyyy'),'44952232705' , '2023RS32');

INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('15/11/2022', 'dd/mm/yyyy'), to_date('29/01/2023', 'dd/mm/yyyy'),'44952232705' , '2022BR21');


INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('28/02/2023', 'dd/mm/yyyy'), to_date('18/05/2023', 'dd/mm/yyyy'),'62229012306' , '2022BR21');

INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('28/02/2023', 'dd/mm/yyyy'), to_date('18/05/2023', 'dd/mm/yyyy'),'62229012306' , '2023RS32');

INSERT INTO Emprestimo (data_do_emprestimo, data_da_devolucao, fk_Pessoa_cpf, fk_Obra_codigo)
VALUES (to_date('28/02/2023', 'dd/mm/yyyy'), to_date('18/05/2023', 'dd/mm/yyyy'),'62229012306' , '2010RS32');


