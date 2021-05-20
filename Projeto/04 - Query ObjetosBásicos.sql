
/********************************************

    Projeto realizado na disciplina de Banco de dados II 
    Alunos: Willma Tayanne Costa da Silva Matricula: 20192370017
            Luciano de Carvalho Souza Filho Matricula: 20192370035
            Eduardo Fidelis Porto Matricula: 20192370027

    Projeto AkaiTech 

    Funcionalidade: Query Objetos Basicos 


***************************************************/

--  01 consulta com uma tabela usando operadores básicos de filtro (e.g., IN, between, IS NULL, etc). 

-- I - Encontrar clientes que não tem o celular cadastrado.
SELECT * FROM cliente WHERE telefone IS NULL;

--  3 consultas com INNER JOIN na cláusula FROM (pode ser self JOIN, caso o domínio indique esse uso).

-- II - Qual estabelecimento tem a vacina x

SELECT v.id_vacina, v.nome, v.quantidade, e.id_estabelecimento, e.nome
FROM vacina v
INNER JOIN estabelecimento e ON e.id_estabelecimento = v.id_estabelecimento
where v.id_vacina = 1420

-- III - Qual Enfermeiro trabalha em qual estabelecimento ? 

SELECT ef.cre, f.nome, e.id_estabelecimento, e.nome
FROM funcionario f
INNER JOIN estabelecimento e ON e.id_estabelecimento = f.id_estabelecimento 
inner join enfermeiro ef on ef.id_funcionario = f.id_funcionario
where f.id_funcionario = 400302

-- IV - Cliente x vai tomar determinada vacina x no dia x 

SELECT v.id_vacina, v.nome, c.cpf, c.nome, a.datahora_inicio
FROM cliente c
INNER JOIN agendamento a on a.cpf = c.cpf 
INNER JOIN vacina v ON v.id_vacina = a.id_vacina 
where a.cpf = 11122233344

--  - 01 consulta com left/right/full outer JOIN na cláusula FROM

-- V - Mostre os estabelecimento que tem ou não agendamento

select e.id_estabelecimento, e.nome, a.id_agendamento
from Estabelecimento e 
full JOIN agendamento a on e.id_estabelecimento = a.id_estabelecimento


--  -  02 consultas usando Group By (e possivelmente o having)

-- Organizando por quantidade

-- VI - Lista os agendamento que ocorreram no mesmo estabelecimento com mesma
--datahora_inicio e datahora_fim, exibindo tambem sua quantidade 

SELECT id_estabelecimento, datahora_inicio, datahora_fim, COUNT(*) AS quantidade
FROM agendamento GROUP BY id_estabelecimento, datahora_inicio, datahora_fim;

-- VII - Mostrar a quantidade de vacinas e agrupar por id_vacina 
SELECT id_vacina, nome, quantidade 
FROM vacina
GROUP BY id_vacina order by nome

--  01 consulta usando alguma operação de conjunto (union, except ou intersect)

-- VIII - Mostrar se tem alguma vacina que não esta vinculada a um agendamento

select v.id_vacina
from vacina v
  EXCEPT
select a.id_vacina
from agendamento a
 
--• 02 consultas que usem subqueries. 

-- IX Mostrar as vacinas que estão na tabela agendamento

SELECT v.id_vacina, v.nome
FROM vacina v
WHERE v.id_vacina in (SELECT a.id_vacina
                        FROM agendamento a
                        WHERE v.id_vacina = a.id_vacina)

 
-- X Mostrar os clientes que estão agendados

SELECT c.cpf, c.nome
FROM cliente c
WHERE c.cpf in (SELECT a.cpf
                FROM agendamento a 
                WHERE c.cpf = a.cpf)










