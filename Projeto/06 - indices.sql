/********************************************

    Projeto realizado na disciplina de Banco de dados II 
    Alunos: Willma Tayanne Costa da Silva Matricula: 20192370017
            Luciano de Carvalho Souza Filho Matricula: 20192370035
            Eduardo Fidelis Porto Matricula: 20192370027

    Projeto AkaiTech 

    Funcionalidade: Criação Index

********************************************/

-- 1º Index 

-- index na tabela Vacina, na coluna datachegada.

CREATE INDEX VacinaIndex ON Vacina(data_chegada);

-- 2º Index 

--Index na tabela agendamento na coluna DataHoraInicio 

create index AgendamentoIndex on agendamento(datahora_inicio, datahora_fim)

-- 3º Index

create index funcionarioIndex on funcionario(data_admissao, data_demissao)
