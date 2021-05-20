/********************************************

    Projeto realizado na disciplina de Banco de dados II 
    Alunos: Willma Tayanne Costa da Silva Matricula: 20192370017
            Luciano de Carvalho Souza Filho Matricula: 20192370035
            Eduardo Fidelis Porto Matricula: 20192370027

    Projeto AkaiTech 

    Funcionalidade: Triggers 

*********************************************/

-- • 03 diferentes triggers com justificativa semântica, de acordo com os requisitos da aplicação.

-- I Trigger - guardando log's das vacinas


--Criando tabela pra guardar os logs
create table vacina_log (
        usuario varchar(20),
        operacao char (1),
        dataHora timestamp

);

-- função 

create or replace function Insere_Vacina_log ()
returns trigger as $$
begin
    insert into vacina_log (usuario,operacao,dataHora)
        values ('PostgresSQL',SUBSTR(tg_op,1,1),current_timestamp);
        return new;
end;
$$ language plpgsql;  

drop function Insere_Vacina_log

-- criando trigger 

create trigger Dispara_Insere_Vacina_log after insert or update or delete 
    on vacina for each row
    execute procedure Insere_Vacina_log();



-- II Trigger - Validando se a situação é: 'AGUARDANDO_ALOCACAO', 'AGUARDANDO_REALIZACAO' , 'CONCLUIDO', 'CANCELADO' se não, impedir alteração.

CREATE OR REPLACE function Valida_situacao() returns trigger
as $$
Begin
	If new.situacao not in ('AGUARDANDO_ALOCACAO', 'AGUARDANDO_REALIZACAO' , 'CONCLUIDO', 'CANCELADO') then 
    	raise exception 'Situação Invalida tente novamente ';
	end if;
	return new;
 end;
$$ LANGUAGE plpgsql; 
 
create trigger Dispare_Valida_situacao 
 	BEFORE INSERT OR UPDATE OF situacao ON agendamento
 FOR EACH ROW
 Execute procedure Valida_situacao();
 
update agendamento
set situacao = 'CONCLUIDO'
where id_agendamento = 303007;
select situacao;
 
-- III Trigger - Não inserir/atualizar agendamento depois das 16:00 pois é encerramento do expediente [funcionalidade pros atendentes]

CREATE OR REPLACE FUNCTION impedeAgendamento() RETURNS TRIGGER AS $$
BEGIN
	IF CURRENT_TIME >= '16:00' THEN
    	RAISE EXCEPTION 'Alteraçãoes invalidas neste Horário';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER Dispara_impedeAgendamento
  BEFORE INSERT OR UPDATE on agendamento 
    FOR EACH ROW EXECUTE PROCEDURE impedeAgendamento();

