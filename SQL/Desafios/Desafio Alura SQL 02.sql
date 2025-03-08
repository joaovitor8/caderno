CREATE TABLE tabela_alunos (
  id_aluno INT PRIMARY KEY,
  nome_aluno VARCHAR(250),
  data_nacimento_aluno DATE,
  genero_aluno CHAR,
  endereco_aluno VARCHAR(250),
  telefone_aluno INT,
  email_aluno VARCHAR(250)
);


CREATE TABLE tabela_professores (
  id_professor INT PRIMARY KEY,
  nome_professor VARCHAR(250),
  data_nacimento_professor DATE,
  genero_professor CHAR,
  telefone_professor INT,
  email_professor VARCHAR(250)
);


CREATE TABLE tabela_disciplinas (
  id_disciplina INT PRIMARY KEY,
  nome_disciplina VARCHAR(250),
  descricao TEXT,
  carga_horaria TIME,
  id_professor INT,
  FOREIGN KEY (id_professor) REFERENCES tabela_professores(id_professor)
);


CREATE TABLE tabela_turmas (
  id_turma INT PRIMARY KEY,
  nome_turma VARCHAR(250),
  ano_letivo DATE,
  id_professor_orientador INT,
  FOREIGN KEY (id_professor_orientador) REFERENCES tabela_professores(id_professor)
);


CREATE TABLE tabela_turma_disciplinas (
  id_turma INT,
  id_disciplinas INT,
  PRIMARY KEY (id_turma, id_disciplinas),
  FOREIGN KEY (id_turma) REFERENCES tabela_turmas(id_turma),
  FOREIGN KEY (id_disciplinas) REFERENCES tabela_disciplinas(id_disciplina)
);


CREATE TABLE tabela_turma_alunos (
  id_turma INT,
  id_alunos INT,
  PRIMARY KEY (id_turma, id_alunos)
  FOREIGN KEY (id_turma) REFERENCES tabela_turmas(id_turma),
  FOREIGN KEY (id_alunos) REFERENCES tabela_alunos(id_aluno)
);


CREATE TABLE tabela_notas (
  id_nota INT PRIMARY KEY,
  id_aluno INT,
  id_disciplina INT,
  valor_nota FLOAT,
  data_avaliacao DATE,
  FOREIGN KEY (id_aluno) REFERENCES tabela_alunos(id_aluno),
  FOREIGN KEY (id_disciplina) REFERENCES tabela_disciplinas(id_disciplina)
);

