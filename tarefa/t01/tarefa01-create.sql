-- Criação da tabela funcionário
CREATE TABLE funcionario (
  codigo INTEGER PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  sexo CHAR(1),
  dt_nasc DATE,
  salario NUMERIC(10,2),
  cod_depto INTEGER REFERENCES departamento(codigo)
);

-- Criação da tabela departamento
CREATE TABLE departamento (
  codigo INTEGER PRIMARY KEY,
  descricao VARCHAR(100),
  cod_gerente INTEGER REFERENCES funcionario(codigo)
);

-- Criação da tabela projeto
CREATE TABLE projeto (
  codigo INTEGER PRIMARY KEY,
  nome VARCHAR(100),
  descricao TEXT,
  cod_depto INTEGER REFERENCES departamento(codigo),
  cod_responsavel INTEGER REFERENCES funcionario(codigo),
  data_inicio DATE,
  data_fim DATE
);

-- Criação da tabela atividade
CREATE TABLE atividade (
  codigo INTEGER PRIMARY KEY,
  nome VARCHAR(100),
  descricao TEXT,
  cod_responsavel INTEGER REFERENCES funcionario(codigo),
  data_inicio DATE,
  data_fim DATE
);

-- Criação da tabela atividade_projeto
CREATE TABLE atividade_projeto (
  cod_projeto INTEGER REFERENCES projeto(codigo),
  cod_atividade INTEGER REFERENCES atividade(codigo),
  cod_responsavel INTEGER REFERENCES funcionario(codigo),
  PRIMARY KEY (cod_projeto, cod_atividade)
);
