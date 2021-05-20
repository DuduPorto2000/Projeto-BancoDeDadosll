/********************************************

    Projeto realizado na disciplina de Banco de dados II 
        Alunos: Willma Tayanne Costa da Silva Matricula: 20192370017
                Luciano de Carvalho Souza Filho Matricula: 20192370035
                Eduardo Fidelis Porto Matricula: 20192370027

    Projeto AkaiTech 

    Funcionalidade: Script para criação de tabelas.

********************************************/

-- Endereço > Estabelecimento > Cliente > Vacina > Funcionario > Atendente > Enfermeiro > Agendamento

-- Tabela Endereco --
-- id_endereco, cep, rua, numero
CREATE TABLE Endereco (
    id_endereco INTEGER NOT NULL,
    cep NUMERIC(11,0) NOT NULL,
    rua VARCHAR(80) NOT NULL,
    numero INTEGER NOT NULL,

    CONSTRAINT pk_id PRIMARY KEY (id_endereco)
);

-- Tabela Estabelecimento --
-- id_estabelecimento, nome, nome_diretor, telefone, endereco
CREATE TABLE Estabelecimento (
    id_estabelecimento INTEGER NOT NULL UNIQUE,
    nome VARCHAR (100) NOT NULL,
    nome_diretor VARCHAR (60) NOT NULL,
    telefone NUMERIC(13, 0) NULL,
    endereco INTEGER NOT NULL,
    
    CONSTRAINT pk_estabelecimento PRIMARY KEY (id_estabelecimento),
    CONSTRAINT fk_endereco FOREIGN KEY (endereco) REFERENCES Endereco (id_endereco)
);

-- Tabela Cliente --
-- cpf, nome, data_nasc, sexo, rg, sus, telefone, senha, endereco
CREATE TABLE Cliente (
    cpf NUMERIC(11,0) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    data_nasc DATE NOT NULL,
    sexo CHAR CHECK ( sexo IN ('M','F') ) NOT NULL,
    rg NUMERIC(8,0) NOT NULL,
    sus NUMERIC(16,0) NOT NULL,
    telefone NUMERIC(13,0) NULL,
    senha VARCHAR(16) NOT NULL,
    endereco INTEGER NOT NULL,

    CONSTRAINT pk_cliente PRIMARY KEY (cpf),
    CONSTRAINT fk_endereco FOREIGN KEY (endereco) REFERENCES Endereco (id_endereco)
);

-- Tabela Vacina --
-- id_vacina, nome, validade, lote, quantidade, data_chegada, id_estabelecimento
CREATE TABLE Vacina (
    id_vacina INTEGER NOT NULL UNIQUE,
    nome VARCHAR (100) NOT NULL,
    validade DATE NOT NULL,
    lote VARCHAR(100) NOT NULL,
    quantidade INTEGER NOT NULL,
    data_chegada DATE NOT NULL,
    id_estabelecimento INTEGER NOT NULL,

    CONSTRAINT pk_vacina PRIMARY KEY (id_vacina),
    CONSTRAINT fk_estabelecimento FOREIGN KEY (id_estabelecimento) REFERENCES Estabelecimento (id_estabelecimento)
);

-- Tabela Funcionario --
-- id_funcionario, nome, sexo, data_admissao, data_demissao, data_nasc, cpf, rg, telefone, endereco, id_estabelecimento
CREATE TABLE Funcionario (
    id_funcionario INTEGER NOT NULL UNIQUE,
    nome VARCHAR (100) NOT NULL,
    sexo CHAR CHECK ( sexo IN ('M','F') ) NOT NULL,
    data_admissao TIMESTAMP NOT NULL DEFAULT NOW(),
    data_demissao TIMESTAMP NULL,
    data_nasc DATE NOT NULL,
    cpf NUMERIC(11,0) NOT NULL,
    rg NUMERIC(15,0) NOT NULL,
    telefone NUMERIC(13,0) NULL,
    endereco INTEGER NOT NULL,
    id_estabelecimento INTEGER NOT NULL,

    CONSTRAINT pk_funcionario PRIMARY KEY (id_funcionario),
    CONSTRAINT fk_estabelecimento FOREIGN KEY (id_estabelecimento) REFERENCES Estabelecimento (id_estabelecimento),
    CONSTRAINT fk_endereco FOREIGN KEY (endereco) REFERENCES Endereco (id_endereco)
);

-- Tabela Atendente --
-- id_funcionario, senha
CREATE TABLE Atendente (
    id_funcionario INTEGER NOT NULL UNIQUE,
    senha VARCHAR(16) NOT NULL,

    CONSTRAINT fk_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionario (id_funcionario)
);

-- Tabela Enfermeiro --
-- id_funcionario, cre
CREATE TABLE Enfermeiro (
    id_funcionario INTEGER NOT NULL UNIQUE,
    cre BIGINT NOT NULL UNIQUE,

    CONSTRAINT pk_cre PRIMARY KEY (cre),
    CONSTRAINT fk_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionario (id_funcionario)
);

-- Tabela Agendamento --
-- id_agendamento, cpf, datahora_criacao, datahora_inicio, datahora_fim, datahora_conclusao, situacao, id_estabelecimento, id_vacina, id_funcionario
CREATE TABLE Agendamento (
    id_agendamento INTEGER NOT NULL UNIQUE,
    cpf NUMERIC(11,0) NULL,
    datahora_criacao TIMESTAMP NOT NULL DEFAULT NOW(),
    datahora_inicio TIMESTAMP NOT NULL,
    datahora_fim TIMESTAMP NOT NULL,
    datahora_conclusao TIMESTAMP NULL,
    situacao VARCHAR(40) NOT NULL DEFAULT 'AGUARDANDO_ALOCACAO',
    id_estabelecimento INTEGER NOT NULL,
    id_vacina INTEGER NOT NULL,
    id_funcionario INTEGER NULL,
    
    CONSTRAINT pk_agendamento PRIMARY KEY (id_agendamento),
    CONSTRAINT fk_estabelecimento FOREIGN KEY (id_estabelecimento) REFERENCES Estabelecimento (id_estabelecimento),
    CONSTRAINT fk_vacina FOREIGN KEY (id_vacina) REFERENCES Vacina (id_vacina),
    CONSTRAINT fk_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionario (id_funcionario),
    CONSTRAINT fk_cliente FOREIGN KEY(cpf) REFERENCES Cliente(cpf)
);

