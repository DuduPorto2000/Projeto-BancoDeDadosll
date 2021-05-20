/********************************************

    Projeto realizado na disciplina de Banco de dados II 
    Alunos: Willma Tayanne Costa da Silva Matricula: 20192370017
            Luciano de Carvalho Souza Filho Matricula: 20192370035
            Eduardo Fidelis Porto Matricula: 20192370027

    Projeto AkaiTech 

    Funcionalidade: Visões 

********************************************/

-- • 01 visão que permita inserção

-- I - Mostrar / Inserir atendentes ativos.

CREATE OR REPLACE VIEW AtendentesAtivos
(id_funcionario, nome, cpf, senha, sexo, data_admissao,
data_nasc, rg, telefone, id_estabelecimento, rua, cep, numero) AS
SELECT
	f.id_funcionario, f.nome, f.cpf, a.senha, f.sexo, f.data_admissao,
    f.data_nasc, f.rg, f.telefone, f.id_estabelecimento, e.rua, e.cep, e.numero
FROM Funcionario f INNER JOIN Atendente a ON f.id_funcionario = a.id_funcionario
INNER JOIN Endereco e ON e.id_endereco = f.endereco where f.data_demissao is null;

-- • 02 visões robustas (e.g., com vários joins) com justificativa semântica, de acordo com os requisitos da aplicação.

-- II Cartão de Vacina

create or replace view CartaoDeVacina
(CPF_Paciente, Nome_Paciente, Dia_da_Conclusão, id_vacina, Nome_da_Vacina, Nome_Local)
as select c.cpf,c.nome,a.datahora_conclusao,v.id_vacina,v.nome, e.nome
from Cliente c
inner join Agendamento a on a.cpf = c.cpf
inner join Vacina v on a.id_vacina = v.id_vacina
inner join estabelecimento e on e.id_estabelecimento = a.id_estabelecimento

select * from CartaoDeVacina


-- III Relatorio Mensal

create or replace view RelatorioMensalrotinas
(CPF_Cliente, Nome_do_Cliente, Id_Vacina, Nome_da_Vacina, Id_Estabalecimento, Nome_do_Estabelecimento, Cre, Nome_Profissional)
as select c.cpf, c.nome, v.id_vacina, v.nome, e.id_estabelecimento, f.nome, ef.cre, f.nome 
from Agendamento a
inner join Vacina v on v.id_vacina = a.id_vacina
inner join Cliente c on c.cpf = a.cpf
inner join Estabelecimento e on e.id_estabelecimento = a.id_estabelecimento
inner join Enfermeiro ef on ef.id_funcionario = a.id_funcionario
inner join funcionario f on f.id_funcionario = ef.id_funcionario

select * from RelatorioMensalrotinas

