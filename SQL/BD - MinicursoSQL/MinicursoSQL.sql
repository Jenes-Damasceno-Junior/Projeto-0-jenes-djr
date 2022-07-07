
-- MINICURSO SQL

CREATE TABLE aluno (
matricula int IDENTITY(1,1) PRIMARY KEY,
nome_aluno varchar(895),
disciplina_id int,
disciplina varchar(100),
nota float default 0,
);

-- Criar uma chave estrangeira em uma tabela existente

ALTER TABLE aluno
ADD CONSTRAINT fk_disciplina_id FOREIGN KEY (disciplina_id) REFERENCES disciplina (disciplina_id);


CREATE TABLE disciplina (
disciplina_id int IDENTITY(1,1) PRIMARY KEY,
nome_disciplina varchar(100) not null,
professor varchar(895) not null
);


INSERT INTO aluno (nome_aluno,disciplina,nota) 
VALUES 
('Maria da Silva', 'História da Arte', 9.4),
('Daniel Lima', 'Matemática I', 7.8),
('Fernanda Rosa', 'Literatura', 9),
('João Souto', 'História da Arte', 5.9),
('Rosa Robeiro', 'Literatura', 10),
('Otávio Franco', 'Literatura', 7),
('Maria Albuquerque', 'História da Arte', 6.4),
('Vanessa Moreno', 'Literatura', 10),
('Saulo Porto', 'Matemática I', 0);


INSERT INTO disciplina (nome_disciplina, professor)
VALUES
('História da Arte', 'Maria Regina'),
('Matemática I', 'Luiz Augusto'),
('Literatura', 'Badaró Ferrari');


-- TOTAL DE ALUNOS POR DISCIPLINA

SELECT d.nome_disciplina, count(a.disciplina) Total_Alunos
FROM aluno a
INNER JOIN disciplina d ON d.nome_disciplina = a.disciplina
GROUP BY d.nome_disciplina

-- RELACIONANDO TABELAS

SELECT d.disciplina_id, a.disciplina
FROM disciplina d, aluno a
WHERE d.nome_disciplina = a.disciplina


-- UPDATE DO disciplina_id DA TABELA ALUNO

UPDATE a SET disciplina_id = d.disciplina_id 
FROM disciplina as d, aluno as a
WHERE d.nome_disciplina = a.disciplina 

SELECT * FROM aluno
SELECT * FROM disciplina

-- ################################################### --

-- TABELA PESSOAL

CREATE TABLE pessoal (
pessoal_id INT IDENTITY (1,1) PRIMARY KEY,
Nome varchar(895) not null,
Cargo varchar(100) not null,
Salario float default 0
);

INSERT INTO pessoal
(Nome, Cargo, Salario)
VALUES
('JOÃO PEDRO SILVA', 'INSPETOR', 4300),
('MARIA JOSÉ PRAS', 'GERENTE', 7500),
('FELIPE PEREIRA SILVA', 'VIGIA', 1800),
('CARLOS DA SILVA GOMES', 'GERENTE', 6000),
('RENATA PRAS PEREIRA GOES', 'INSPETOR', 3000),
('MARIANA DE SÁ', 'SECRETARIA', 2500),
('PAULO ROBERTO PRAS', 'GERENTE', 5000);


SELECT * FROM pessoal

SELECT Nome FROM pessoal WHERE Cargo = 'GERENTE' AND Nome LIKE '%PRAS%'