
-- PRINCIPAIS FUNÇÕES SQL

-- SELECT todas as colunas de uma tabela

SELECT *
FROM person.Person;

-- SELECT colunas específicas

SELECT FirstName, LastName
FROM person.person;

-- SELECT DISTINCT não retorna dados duplicados

--- SELECT FirstName retorna mais de 19k linhas, já com DISTINCT retorna perto de 1k

SELECT DISTINCT FirstName
FROM Person.Person

SELECT DISTINCT LastName
FROM Person.Person;

-- WHERE - CONDIÇÕES

/* 
OPERADORES LÓGICOS 
=     IGUAL
>     MAIOR
<     MENOR
>=    MAIOR IGUAL
<=    MENOR IGUAL
<>    DIFERENTE DE
AND   E
OR    OU
*/

SELECT *
FROM person.Person
WHERE LastName = 'miller' and FirstName = 'anna'

SELECT *
FROM Production.Product
WHERE color = 'black' or color = 'blue'

SELECT *
FROM Production.Product
WHERE ListPrice > 1500

SELECT *
FROM Production.Product
WHERE ListPrice > 1500 and ListPrice < 50000

SELECT *
FROM Production.Product
WHERE color <> 'red'

SELECT Name, ProductNumber, weight
FROM Production.Product
WHERE Weight > 500 and Weight <= 700

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' and SalariedFlag = 1

SELECT * 
FROM Person.Person
WHERE FirstName = 'PETER' AND LastName = 'Krebs'

SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityID = 26

select* from Person.Person where Title <> ''

select * FROM Person.Person WHERE FirstName = 'PETER' AND LastName = 'Krebs'

-- DELETAR DADOS DE UMA TABELA
-- DELETE FROM aluno WHERE matricula >= 4;
-- ATUALIZAR DADOS DE UMA TABELA
-- UPDATE aluno SET nota = 9.1 WHERE matricula = 3;

/* DESAFIO 1
Quantos produtos temos cadastrados em nossa tabela de produtos (production.product).
RESPOSTA = 504

DESAFIO 2
Quantos tamanhos de produtos temos cadastrados na tabela (production.product).
RESPOSTA = 211

*/

SELECT * FROM Production.Product

SELECT count(*) 
FROM Production.Product

SELECT count(size)
FROM Production.Product


-- RETORNAR UMA QUANTIDADE ESPECIFICA DE LINHAS DE UMA TABELA

SELECT TOP 5 *
FROM Production.Product

-- ORDER BY - ORDENAR RESULTADOS POR ALGUMA COLUNA EM ORDEM CRESCENTE (ASC) OU DECRESCENTE (DESC)

SELECT FirstName, MiddleName, LastName
FROM Person.Person
ORDER BY FirstName ASC, MiddleName ASC, LastName ASC

/* DESAFIO 1
Obter o ProductID dos 10 produtos mais caros cadastrados no sistema, listando do
mais caro para o mais barato
*/

SELECT TOP 10 ProductID, Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC

/* DESAFIO 2
Obter o nome e numero do produto dos produtos que tem o productID entre 4~1
*/

SELECT ProductID, Name, ProductNumber
FROM Production.Product
WHERE ProductID >= 1 and ProductID <= 4
ORDER BY ProductID DESC


-- BETWEEN - ENCONTRAR VALORES ENTRE VALORES MINIMOS E MAXIMOS

SELECT ProductID, Name, ProductNumber
FROM Production.Product
WHERE ProductID BETWEEN 1 AND 4

SELECT * FROM Production.Product WHERE ListPrice NOT BETWEEN 0 AND 1500
ORDER BY ListPrice ASC

SELECT * FROM HumanResources.Employee WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01' ORDER BY HireDate

-- CRIANDO NOVA TABELA A PARTIR DA CONSULTA 

SELECT * INTO HumanResources.Hire_09_10
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01'
ORDER BY HireDate

SELECT * FROM HumanResources.Hire_09_10
ORDER BY BirthDate DESC


/* IN
É USADO JUNTO AO WHERE PARA VERIFICAR SE UM VALOR CORRESPONDE COM QUALQUER
VALOR PASSADO NA LISTA DE VALORES - PODE USAR O NOT TMB.
*/

SELECT * FROM Person.Person -- COMANDO GRANDE DEMAIS
WHERE BusinessEntityID = 2
OR BusinessEntityID = 7
OR BusinessEntityID = 13

SELECT * FROM Person.Person WHERE BusinessEntityID IN (2,7,13) -- FACILIDADE DO COMANDO

/* LIKE
É usado quando não se tem certeza referente aos caracteres buscados
'xyz%' - o sinal % diz que não importa o que vem DEPOIS, COMEÇA com xyz.
'%xyz' - o sinal de % diz que não importa o que vem ANTES, TERMINA com xyz
'%xyz%' - procura valores contidos em um conjunto de caracteres
'%xyz_' - se limita a buscar apenas um caractere apos xyz
*/

SELECT *
FROM Person.Person
WHERE FirstName LIKE '%a' AND Title = 'Mr.' -- HOMENS QUE TEM NOME TERMINANDO COM A LETRA "A".

SELECT *
FROM Person.Person
WHERE FirstName LIKE 'Jen%' -- NOMES QUE COMEÇAM COM 'JEN'.

SELECT *
FROM Person.Person
WHERE LastName LIKE '%sc%' -- SOBRENOMES COM 'SC'.

SELECT *
FROM Person.Person
WHERE FirstName LIKE '%ro_' -- NOMES COM APENAS UM CARACTER DEPOIS DE 'RO'.

-- https://youtu.be/rX2I7OjLqWE?list=RDCMUCm63tB8wsKOVvxoU4iMpS2A&t=3624 --





