
/********************************************

    Projeto realizado na disciplina de Banco de dados II 
    Alunos: Willma Tayanne Costa da Silva Matricula: 20192370017
            Luciano de Carvalho Souza Filho Matricula: 20192370035
            Eduardo Fidelis Porto Matricula: 20192370027

    Projeto AkaiTech 

    Funcionalidade: Reescrita de consultas.
    

***************************************************/

-- i Identificar 02 exemplos de consultas dentro do contexto da aplicação (questão 3.b) que possam e devam ser melhoradas. 
--Reescrevê-las. Justificar a reescrita.

-- IX Mostrar as vacinas que estão na tabela agendamento

SELECT v.id_vacina, v.nome
FROM vacina v
inner join agendamento a on v.id_vacina = a.id_vacina
group by v.id_vacina, v.nome


-- X Mostrar os clientes que estão agendados
SELECT c.cpf, c.nome 
FROM cliente c
Inner join agendamento a on a.cpf = c.cpf

