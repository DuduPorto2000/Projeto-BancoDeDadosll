/********************************************

    Projeto realizado na disciplina de Banco de dados II 
    Alunos: Willma Tayanne Costa da Silva Matricula: 20192370017
            Luciano de Carvalho Souza Filho Matricula: 20192370035
            Eduardo Fidelis Porto Matricula: 20192370027

    Projeto AkaiTech 

    Funcionalidade: Prevílégios e seguranças 

********************************************/

-- • Criação de 02 usuários – um será o owner do BD; o outro irá ter acesso a alguns objetos | • Criação do BD e sua associação ao owner

create role AdminMaster login 
password 'melhorprojetoever'
superuser createDB createRole;

create user Funcionarios_1425 login 
password 'tests@147'
createRole

grant select on Agendamento, vacina, RelatorioMensalrotinas to Funcionarios_1425;
grant insert on Agendamento, vacina to Funcionarios_1425;
grant update on Agendamento, vacina to Funcionarios_1425;

