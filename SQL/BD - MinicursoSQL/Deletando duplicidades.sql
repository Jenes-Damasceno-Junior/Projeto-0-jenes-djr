-- MINICURSO SQL

CREATE TABLE aluno (
matricula int IDENTITY(1,1) PRIMARY KEY,
nome_aluno varchar(895) not null,
disciplina varchar(100),
nota float default 0,
);


CREATE TABLE disciplina (
disciplina_id int IDENTITY(100,1) PRIMARY KEY,
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


-- DELETANDO DUPLICIDADES (CRIAR NOVAS DUPLICIDADES PARA TESTAR O CODIGO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)

-- CIANDO UMA TABELA AUXILIAR COM OS DADOS DA TABELA ONDE ESTÃO AS DUPLICIDADES

SELECT * INTO disciplina_aux FROM disciplina

-- SELECIONANDO OS DADOS DUPLICADOS (CONTADOR DE DUPLICIDADES)

SELECT
[nome_disciplina], [professor], COUNT(1) qnt_duplicados
FROM disciplina_aux
GROUP BY [nome_disciplina], [professor]
HAVING COUNT(1) > 1
ORDER BY [nome_disciplina] ASC

-- ROWNUMBER

SELECT [disciplina_id], [nome_disciplina], [professor],
ROW_NUMBER() OVER (PARTITION BY [nome_disciplina], [professor] ORDER BY [disciplina_id] ASC) AS Cont_linhas
FROM disciplina_aux

-- CRIANDO UMA TABELA TEMPORARIA COM O ARGUMENTO #

SELECT [disciplina_id], [nome_disciplina], [professor],
ROW_NUMBER() OVER (PARTITION BY [nome_disciplina], [professor] ORDER BY [disciplina_id] ASC) AS Cont_linhas
INTO #tb_deletar
FROM disciplina_aux

SELECT * FROM #tb_deletar -- existe apenas nesta consulta

-- DELETANDO REGISTROS DUPLICADOS

DELETE FROM disciplina_aux WHERE [disciplina_id] IN (SELECT [disciplina_id] FROM #tb_deletar WHERE Cont_linhas>1)

-- DEPOIS DE VERIFICAR O EXITO DOS COMANDOS, PODEMOS DELETAR A TABELA ORIGINAL E RENOMEAR A AUXILIAR COM O NOME DA ORGINAL.

SELECT * FROM disciplina