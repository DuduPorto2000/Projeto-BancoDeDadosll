/********************************************

    Projeto realizado na disciplina de Banco de dados II 
    Alunos: Willma Tayanne Costa da Silva Matricula: 20192370017
            Luciano de Carvalho Souza Filho Matricula: 20192370035
            Eduardo Fidelis Porto Matricula: 20192370027

    Projeto AkaiTech 

    Funcionalidade: Criando as funções

*********************************************/

-- • 01 função que use SUM, MAX, MIN, AVG ou COUNT

-- I Função que mostras quantas pessoas tem pro dia xx 
CREATE OR REPLACE FUNCTION QuantPessoaspDias (dia DATE) RETURNS TABLE (quant INTEGER) AS $$
	BEGIN
    	RETURN QUERY
        SELECT COUNT(*)::INTEGER FROM agendamento WHERE datahora_inicio::DATE = dia;
	END;
$$ LANGUAGE plpgsql;

select QuantPessoaspDias ('2021-01-21')

drop function QuantPessoaspDias

-- • Mais 03 funções ou procedures com justificativa semântica, conforme os requisitos da aplicação

-- IIª Função - Função com objetivo de mostrar os aniversarios de determinado mês. 

create or replace function Aniversariantesdomes (MesInicial date,MesFinal date) returns table (nome varchar, data_nasc date) AS $$
begin 
    return query 
    select f.nome::varchar, f.data_nasc::date from funcionario as f where f.data_nasc::DATE > MesInicial and f.data_nasc::DATE < MesFinal;
end
$$ language plpgsql; 

drop function Aniversariantesdomes

select Aniversariantesdomes('1997-11-01','1997-11-30');


-- IIIª Função  - Mostrar quando a vacina estiver proximo da validade. 


CREATE OR REPLACE FUNCTION ValidadeVacina (idcheck INT) RETURNS VARCHAR AS $$
DECLARE
	validade INT;
    msg VARCHAR(100);
BEGIN
    SELECT
    	v.validade::DATE - CURRENT_DATE INTO STRICT validade
	FROM vacina v WHERE v.id_vacina = idcheck;
    
    IF validade > 2 THEN
    	RETURN CONCAT('Vacina esta em dia, ainda faltam ', validade);
    ELSIF validade < 0 THEN
		RETURN CONCAT('Vacina esta vencida faz ', validade*(-1), ' dias');
	ELSIF validade = 0 THEN
        RETURN 'Vacina irá vencer hoje';
	ELSE
        RETURN CONCAT('Vacina está proximo do vencimento, faltam apenas ', validade,' dias');
    END IF;
    
    EXCEPTION
    	WHEN NO_DATA_FOUND THEN
        	RETURN 'Id invalido';
        WHEN OTHERS THEN
    		RETURN 'Erro Desconhecido';
END
$$ LANGUAGE plpgsql;



-- IVº Função - Validar o usuario do cliente. 

CREATE OR REPLACE FUNCTION Login (usuario BIGINT, chave VARCHAR) RETURNS VARCHAR AS $$
DECLARE
	validade BIGINT;
BEGIN

	SELECT c.cpf::BIGINT INTO STRICT validade FROM cliente c WHERE c.cpf = usuario AND c.senha = chave;
    
    RETURN 'Acesso Liberado';
    
    EXCEPTION
    	WHEN NO_DATA_FOUND THEN
        	RETURN 'Senha invalida ou inexistente';
        WHEN OTHERS THEN
    		RETURN 'Erro Desconhecido';
END
$$ LANGUAGE plpgsql;




