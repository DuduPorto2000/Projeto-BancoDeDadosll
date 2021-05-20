/********************************************

    Projeto realizado na disciplina de Banco de dados II 
    Alunos: Willma Tayanne Costa da Silva Matricula: 20192370017
            Luciano de Carvalho Souza Filho Matricula: 20192370035
            Eduardo Fidelis Porto Matricula: 20192370027

    Projeto AkaiTech 

    Funcionalidade: Inserindo dados nas tabelas.

********************************************/

-- Endereço > Estabelecimento > Cliente > Vacina > Funcionario > Atendente > Enfermeiro > Agendamento

-- Inserindo Enderecos
-- id_endereco, cep, rua, numero
INSERT INTO Endereco VALUES (1, 58085530, 'Avenida Doutor Antonio Lins', 382);
INSERT INTO Endereco VALUES (2, 58085530, 'Avenida Ricardo Coitinho', 407);
INSERT INTO Endereco VALUES (3, 58085530, 'Rua das Almas penadas', 806);
INSERT INTO Endereco VALUES (4, 58085530, 'Avenida do seu Zé', 905);
INSERT INTO Endereco VALUES (5, 58083430, 'Rua das Almas do Além', 58);
INSERT INTO Endereco VALUES (6, 58183430, 'Rua Cafageste Ambulante', 60);
INSERT INTO Endereco VALUES (7, 58184490, 'Rua Até Amanhecer', 555);
INSERT INTO Endereco VALUES (8, 58184470, 'Rua Borgar Sabre', 90);
INSERT INTO Endereco VALUES (9, 58183420, 'Rua Neguin das Costas Oca', 100);
INSERT INTO Endereco VALUES (10, 58192410, 'Rua Ralou Ralei', 200);

-- Inserindo Estabelecimento
-- id_estabelecimento, nome, nome_diretor, telefone, endereco
INSERT INTO Estabelecimento VALUES (1001, 'Hospital Santa Izabel', 'Izabel Santiago', 83987777777, 1);
INSERT INTO Estabelecimento VALUES (1002, 'Hospital Unimed', 'Luiz Gonzaga', 83987777778, 2);
INSERT INTO Estabelecimento VALUES (1003, 'Hospital Hap Vida', 'Happy', 83987777779, 3);
INSERT INTO Estabelecimento VALUES (1004, 'Hospital São Vincete de Paula', 'Paula de São Vicente', 83987777710, 4);
INSERT INTO Estabelecimento VALUES (1005, 'Hospital Futuro Perdido', 'Severino das Coxas Grossas', 83985555711, 5);
INSERT INTO Estabelecimento VALUES (1006, 'Hospital Cangaço de Meio Ano', 'João da Pexeira', 83986575781, 6);
INSERT INTO Estabelecimento VALUES (1007, 'Hospital Vitiligo Do Amanhecer', 'Kaguya Himegoto', 83966575782, 7);
INSERT INTO Estabelecimento VALUES (1008, 'Hospital Alfinetada Em Jornalista', 'Bobby Mclaren', 83976675782, 8);
INSERT INTO Estabelecimento VALUES (1009, 'Hospital Run Forest Run', 'Forest Gump', 83976975780, 9);
INSERT INTO Estabelecimento VALUES (1010, 'Hospital Yabai Desu Ne', 'Pekorine', 83986775782, 10);

-- Inserindos Cliente
-- cpf, nome, data_nasc, sexo, rg, sus, telefone, senha, endereco
INSERT INTO Cliente VALUES (11122233344, 'Willma Tayanne', '1994-11-04', 'F', 12345678, 1111222233334444, 5583986222323, '12senhasenhafoda', 1);
INSERT INTO Cliente VALUES (11122233345, 'Eduardo Porto', '1994-11-01', 'M', 1234568, 1111222233334445, 5583986220000, 'yametekudasai123', 2);
INSERT INTO Cliente VALUES (11122233346, 'Luciano Carvalho', '1994-11-02', 'M', 1234568, 1111222233334446, 5583986222312, '123456', 3);
INSERT INTO Cliente VALUES (11122233347, 'Alessa Kettney', '1994-11-03', 'F', 1234569, 1111222233334447, 5583986552323, '123456', 4);
INSERT INTO Cliente VALUES (11123344513, 'Ana Julia', '2000-03-29', 'F', 1243765, 1212123165467456, 55839964432, 'yahalloworudo', 5);
INSERT INTO Cliente VALUES (11124354523, 'Yuki Hino', '1999-04-04', 'M', 1254767, 2312224165467456, NULL, 'kakakikikukukoko', 3);
INSERT INTO Cliente VALUES (11124454523, 'Kiana Kaslana', '2000-02-025', 'F', 1254767, 2413425165467456, NULL, 'lx1xk4kakqhqkyvy', 4);
INSERT INTO Cliente VALUES (11223354533, 'Luna Higurashi', '2003-06-30', 'F', 1253765, 1212123165568456, NULL, 'y4h4ll0w0rud0', 5);
INSERT INTO Cliente VALUES (11822733446, 'Kokichi Matsumoto', '1945-5-09', 'M', 1234568, 1115722933031445, 5583986221800, 'y4m3t3kud4s4i123', 2);
INSERT INTO Cliente VALUES (10129233847, 'Luiz Gustavo', '1994-08-25', 'M', 13345668, 1120292238333441, NULL, '12s3nh4s3nh4f0d4', 1);

-- Inserindo Vacina
-- id_vacina, nome, validade, lote, quantidade, data_chegada, id_estabelecimento
INSERT INTO Vacina VALUES (1420, 'BCG', '15-06-2021', 2003, 10000, '2021-12-14', 1001);
INSERT INTO Vacina VALUES (1530, 'Hepatite A', '20-06-2021', 2014, 50000, '2021-03-01', 1002);
INSERT INTO Vacina VALUES (1640, 'Tríplice Viral', '25-06-2021', 2054, 70000,'2021-03-31', 1003);
INSERT INTO Vacina VALUES (1750, 'Influenza', '30-06-2021', 2045, 90000,'2021-02-28', 1004);
INSERT INTO Vacina VALUES (2866, 'Coronavac', '25-08-2021', 5078, 91000,'2021-03-27', 1005);
INSERT INTO Vacina VALUES (1866, 'Hepatite C', '11-05-2022', 1078, 101000,'2021-12-23', 1001);

--Inserindo Funcionario
-- id_funcionario, nome, sexo, data_admissao, data_demissao, data_nasc, cpf, rg, telefone, endereco, id_estabelecimento
INSERT INTO Funcionario VALUES (400302, 'Gabriel Henrique', 'M', '2019-05-12', NULL, '1980-01-10', 44477733365, 1122334, 5583988774455, 1, 1002);
INSERT INTO Funcionario VALUES (400303, 'Eduardo Porto', 'M', '2012-06-07', NULL, '2000-04-24', 44477733366, 1122335, 5583988774455, 2, 1001);
INSERT INTO Funcionario VALUES (400304, 'Wilma Tayanne', 'F', '2014-08-20', NULL, '1998-05-15', 44477733367, 1122336, 5583988774455, 3, 1002);
INSERT INTO Funcionario VALUES (400305, 'Luciano de Carvalho', 'M', '2017-04-01', NULL, '2000-10-29', 44477733368, 1122337, 5583988774455, 4, 1002);
INSERT INTO Funcionario VALUES (540126, 'Hina Mastsuri', 'F', '2015-05-10', NULL, '1997-05-15', 44357783378, 1222338, 5583918674456, 5, 1005);
INSERT INTO Funcionario VALUES (541127, 'Mana Higurashi', 'F', '2016-04-20', NULL, '1995-08-25', 44367783379, 1232337, NULL, 3, 1005);
INSERT INTO Funcionario VALUES (641226, 'Himeko Matsumoto', 'F', '2015-05-10', NULL, '1996-06-14', 44358783376, 1257348, NULL, 2, 1001);
-- Inserindo Atendentes
-- id_funcionario, senha
INSERT INTO Atendente VALUES (400302, 'maria@senha');
INSERT INTO Atendente VALUES (400303, 'wilma@senha');
INSERT INTO Atendente VALUES (400304, 'luciano@senha');
INSERT INTO Atendente VALUES (400305, 'dudu@senha');
INSERT INTO Atendente VALUES (540126, 'Hina@senha');
INSERT INTO Atendente VALUES (541127, 'Mana@senha');


-- Inserindo Enfermeiro
-- funcionario_id, cre
INSERT INTO Enfermeiro VALUES (400302, 23423424324);
INSERT INTO Enfermeiro VALUES (400303, 34344334543);
INSERT INTO Enfermeiro VALUES (400304, 57567567567);
INSERT INTO Enfermeiro VALUES (400305, 60896874565);
INSERT INTO Enfermeiro VALUES (540126, 68069785456);
INSERT INTO Enfermeiro VALUES (641226, 67089705152);

-- Inserindo Agendamento
-- id_agendamento, cpf, datahora_criacao, datahora_inicio, datahora_fim, datahora_conclusao, situacao, id_estabelecimento, id_vacina, id_funcionario
INSERT INTO Agendamento VALUES (303001, 11122233344, NOW(), '2021-04-02 10:30:00', '2021-05-12 10:45:00', NULL, 'AGUARDANDO_ALOCACAO', 1001, 1420, 400302);
INSERT INTO Agendamento VALUES (303002, 11122233347, NOW(), '2021-05-13 16:05:00', '2021-06-10 11:37:00', NULL, 'AGUARDANDO_ALOCACAO', 1002, 1530, 400303);
INSERT INTO Agendamento VALUES (303003, 11124454523, NOW(), '2021-03-17 15:36:00', '2021-03-02 08:25:00', NULL, 'AGUARDANDO_ALOCACAO', 1003, 1640, 400304);
INSERT INTO Agendamento VALUES (303004, 11223354533, NOW(), '2021-01-27 13:59:00', '2021-04-07 13:17:00', NULL, 'AGUARDANDO_ALOCACAO', 1004, 1750, 400305);
INSERT INTO Agendamento VALUES (323145, 11822733446, NOW(), '2021-02-26 14:25:00', '2021-03-10 15:30:00', NULL, 'AGUARDANDO_ALOCACAO', 1005, 2866, 540126);
-- id_agendamento, cpf, datahora_criacao, datahora_inicio, datahora_fim, datahora_conclusao, situacao, id_estabelecimento, id_vacina, id_funcionario

INSERT INTO Agendamento VALUES (434156, NULL, NOW(), '2021-02-29 11:26:00', '2021-03-10 10:35:00', NULL, 'AGUARDANDO_ALOCACAO', 1005, 2866, 400304);
INSERT INTO Agendamento VALUES (413573, NULL, NOW(), '2021-02-29 12:26:00', '2021-03-10 10:45:00', NULL, 'AGUARDANDO_ALOCACAO', 1005, 1750, 400304);
INSERT INTO Agendamento VALUES (314455, NULL, NOW(), '2021-03-12 11:34:00', '2021-04-02 13:25:00', NULL, 'AGUARDANDO_ALOCACAO', 1004, 1640, 540126);
INSERT INTO Agendamento VALUES (725465, NULL, NOW(), '2021-03-12 13:34:00', '2021-04-02 11:25:00', NULL, 'AGUARDANDO_ALOCACAO', 1003, 1530, 400303);
INSERT INTO Agendamento VALUES (404052, NULL, NOW(), '2021-03-02 10:30:00', '2021-03-16 10:45:00', NULL, 'AGUARDANDO_ALOCACAO', 1001, 1750, 400305);
INSERT INTO Agendamento VALUES (835965, NULL, NOW(), '2021-03-15 14:34:00', '2021-03-16 14:25:00', NULL, 'AGUARDANDO_ALOCACAO', 1002, 1640, 400303);
INSERT INTO Agendamento VALUES (314971, NULL, NOW(), '2021-04-02 10:30:00', '2022-05-12 10:45:00', NULL, 'AGUARDANDO_ALOCACAO', 1003, 1420, 400302);
INSERT INTO Agendamento VALUES (941465, NULL, NOW(), '2021-04-22 12:34:00', '2021-05-12 11:25:00', NULL, 'AGUARDANDO_ALOCACAO', 1001, 2866, 400305);
INSERT INTO Agendamento VALUES (143466, NULL, NOW(), '2021-04-22 13:34:00', '2021-05-25 08:25:00', NULL, 'AGUARDANDO_ALOCACAO', 1002, 1420, 400302);
INSERT INTO Agendamento VALUES (143466, NULL, NOW(), '2021-04-22 14:34:00', '2021-05-27 09:45:00', NULL, 'AGUARDANDO_ALOCACAO', 1004, 1640, 540126);