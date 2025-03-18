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


---

INSERT INTO tabela_alunos (
	id_aluno,
  	nome_aluno,
	data_nacimento_aluno,
  	genero_aluno,
  	endereco_aluno,
  	telefone_aluno,
  	email_aluno
)
VALUES (1, 'João Silva', '2005-03-15', 'Masculino', 'Rua das Flores - 123', 1198765432, 'joao@email.com'),
  (2, 'Maria Santos', '2006-06-20', 'Feminino', 'Avenida Principal - 456', 1187654321, 'maria@email.com'),
  (3, 'Pedro Soares', '2004-01-10', 'Masculino', 'Rua Central - 789', 1176543210, 'pedro@email.com'),
  (4, 'Ana Lima', '2005-04-02', 'Feminino', 'Rua da Escola - 56', 1187654321, 'ana@email.com'),
  (5, 'Mariana Fernandes', '2005-08-12', 'Feminino', 'Avenida da Paz - 789', 1156781234, 'mariana@email.com'),
  (6, 'Lucas Costa', '2003-11-25', 'Masculino', 'Rua Principal - 456', 1112345678, 'lucas@email.com'),
  (7, 'Isabela Santos', '2006-09-10', 'Feminino', 'Rua da Amizade - 789', 1198765432, 'isabela@email.com'),
  (8, 'Gustavo Pereira', '2004-05-15', 'Masculino', 'Avenida dos Sonhos - 123', 1176543210, 'gustavo@email.com'),
  (9, 'Carolina Oliveira', '2005-02-20', 'Feminino', 'Rua da Alegria - 456', 1187654321, 'carolina@email.com'),
  (10, 'Daniel Silva', '2003-10-05', 'Masculino', 'Avenida Central - 789', 1112345678, 'daniel@email.com'),
  (11, 'Larissa Souza', '2004-12-08', 'Feminino', 'Rua da Felicidade - 123', 1198765432, 'larissa@email.com'),
  (12, 'Bruno Costa', '2005-07-30', 'Masculino', 'Avenida Principal - 456', 1176543210, 'bruno@email.com'),
  (13, 'Camila Rodrigues', '2006-03-22', 'Feminino', 'Rua das Estrelas - 789', 1187654321, 'camila@email.com'),
  (14, 'Rafael Fernandes', '2004-11-18', 'Masculino', 'Avenida dos Sonhos - 123', 1112345678, 'rafael@email.com'),
  (15, 'Letícia Oliveira', '2005-01-05', 'Feminino', 'Rua da Alegria - 456', 1198765432, 'leticia@email.com'),
  (16, 'Fernanda Lima', '2004-02-12', 'Feminino', 'Rua da Esperança - 789', 1145678901, 'fernanda@email.com'),
  (17, 'Vinícius Santos', '2003-07-28', 'Masculino', 'Avenida da Amizade - 123', 1189012345, 'vinicius@email.com'),
  (18, 'Juliana Pereira', '2006-09-01', 'Feminino', 'Rua das Rosas - 789', 1134567890, 'juliana@email.com');


INSERT INTO tabela_professores (
	id_professor,
  	nome_professor,
	data_nacimento_professor,
  	genero_professor,
  	telefone_professor,
  	email_professor
)
VALUES (1, 'Ana Oliveira', '1980-05-25', 'Feminino', 1112345678, 'ana@email.com'),
  (2, 'Carlos Ferreira', '1975-09-12', 'Masculino', 1123456789, 'carlos@email.com'),
  (3, 'Mariana Santos', '1982-03-15', 'Feminino', 1134567890, 'mariana@email.com'),
  (4, 'Ricardo Silva', '1978-08-20', 'Masculino', 1178901234, 'ricardo@email.com'),
  (5, 'Fernanda Lima', '1985-01-30', 'Feminino', 1145678901, 'fernanda@email.com');


INSERT INTO tabela_disciplinas (
  id_disciplina,
  nome_disciplina,
  descricao,
  carga_horaria,
  id_professor
)
VALUES (1, 'Matemática', 'Estudo de conceitos matemáticos avançados', 60, 1),
	(2, 'História', 'História mundial e local', 45, 2),
	(3, 'Física', 'Princípios fundamentais da física', 60, 1),
	(4, 'Química', 'Estudo da química e suas aplicações', 45, 3),
	(5, 'Inglês', 'Aulas de inglês para iniciantes', 45, 4),
	(6, 'Artes', 'Exploração da criatividade artística', 30, 5);


INSERT INTO tabela_turmas (
  id_turma,
  nome_turma,
  ano_letivo,
  id_professor_orientador
)
VALUES (1, 'Turma A', '2023', 1),
  (2, 'Turma B', '2023', 2),
  (3, 'Turma C', '2023', 3),
  (4, 'Turma D', '2023', 4),
  (5, 'Turma E', '2023', 5);


INSERT INTO tabela_turma_disciplinas (
  id_turma,
  id_disciplinas
)
VALUES (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (1, 3),
  (2, 1),
  (3, 2);


INSERT INTO tabela_turma_alunos (
  id_turma,
  id_alunos
)
VALUES (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (1, 6),
  (2, 7),
  (3, 8),
  (4, 9),
  (5, 10);


INSERT INTO tabela_notas (
  id_nota,
  id_aluno,
  id_disciplina,
  valor_nota,
  data_avaliacao
)
VALUES (2, 1, 1, 6.19, '7/7/2023'),
  (3, 1, 2, 7.18, '7/7/2023'),
  (4, 1, 3, 7.47, '7/7/2023'),
  (5, 1, 4, 7.46, '7/7/2023'),
  (6, 1, 5, 4.35, '7/7/2023'),
  (7, 1, 6, 4.43, '7/7/2023'),
  (8, 1, 7, 0.76, '7/7/2023'),
  (9, 1, 8, 9.22, '7/7/2023'),
  (10, 1, 9, 9.04, '7/7/2023'),
  (11, 1, 10, 3.28, '7/7/2023'),
  (12, 2, 1, 1.34, '7/9/2023'),
  (13, 2, 2, 3.1, '7/9/2023'),
  (14, 2, 3, 1.66, '7/9/2023'),
  (15, 2, 4, 0.03, '7/9/2023'),
  (16, 2, 5, 4.34, '7/9/2023'),
  (17, 2, 6, 4.02, '7/9/2023'),
  (18, 2, 7, 8.79, '7/9/2023'),
  (19, 2, 8, 1.17, '7/9/2023'),
  (20, 2, 9, 8.26, '7/9/2023'),
  (21, 2, 10, 3.41, '7/9/2023'),
  (22, 3, 1, 6.82, '7/27/2023'),
  (23, 3, 2, 8.21, '7/27/2023'),
  (24, 3, 3, 1.3, '7/27/2023'),
  (25, 3, 4, 4.01, '7/27/2023'),
  (26, 3, 5, 0.25, '7/27/2023'),
  (27, 3, 6, 6.63, '7/27/2023'),
  (28, 3, 7, 9.74, '7/27/2023'),
  (29, 3, 8, 3.77, '7/27/2023'),
  (30, 3, 9, 0.58, '7/27/2023'),
  (31, 3, 10, 8.52, '7/27/2023'),
  (32, 4, 1, 8.37, '8/8/2023'),
  (33, 4, 2, 0.26, '8/8/2023'),
  (34, 4, 3, 5.95, '8/8/2023'),
  (35, 4, 4, 6.98, '8/8/2023'),
  (36, 4, 5, 6.18, '8/8/2023'),
  (37, 4, 6, 4.79, '8/8/2023'),
  (38, 4, 7, 7.96, '8/8/2023'),
  (39, 4, 8, 0.62, '8/8/2023'),
  (40, 4, 9, 7.77, '8/8/2023'),
  (41, 4, 10, 5.81, '8/8/2023'),
  (42, 5, 1, 2.25, '8/15/2023'),
  (43, 5, 2, 5.82, '8/15/2023'),
  (44, 5, 3, 4.11, '8/15/2023'),
  (45, 5, 4, 7.99, '8/15/2023'),
  (46, 5, 5, 3.23, '8/15/2023'),
  (47, 5, 6, 8.09, '8/15/2023'),
  (48, 5, 7, 8.24, '8/15/2023'),
  (49, 5, 8, 3.33, '8/15/2023'),
  (50, 5, 9, 4.24, '8/15/2023'),
  (51, 5, 10, 0.11, '8/15/2023');


---


SELECT * FROM tabela_alunos
SELECT * FROM tabela_professores
SELECT * FROM tabela_disciplinas
SELECT * FROM tabela_turmas
SELECT * FROM tabela_turma_disciplinas
SELECT * FROM tabela_turma_alunos
SELECT * FROM tabela_notas

SELECT * FROM tabela_alunos ORDER BY nome_aluno;

SELECT * FROM tabela_disciplinas WHERE carga_horaria > 40;

SELECT * FROM tabela_notas WHERE valor_nota > 6 AND valor_nota < 8;


----------


SELECT ROUND(AVG(valor_nota), 2) as Media_Notas_Historia FROM tabela_notas WHERE id_disciplina = 2;

SELECT * FROM tabela_alunos WHERE nome_aluno LIKE 'J%';

SELECT * FROM tabela_alunos WHERE data_nacimento_aluno LIKE '%-02-%';

SELECT nome_aluno AS Aluno, DATE(CURRENT_TIMESTAMP) - data_nacimento_aluno as Idade FROM tabela_alunos GROUP BY id_aluno;

SELECT
    id_aluno AS Aluno,
    id_disciplina AS Disciplina,
    valor_nota AS Nota,
    CASE
        WHEN valor_nota > 6 THEN 'Aprovado'
        ELSE 'Reprovado'
    END Resultado
FROM
    tabela_notas;


----------


SELECT 	nome_professor AS Professor, nome_turma AS Turma 
FROM tabela_professores 
JOIN tabela_turmas ON tabela_professores.id_professor = tabela_turmas.id_professor_orientador;

SELECT nome_aluno as Aluno, MAX(valor_nota) as Maior_Nota
FROM tabela_alunos
JOIN tabela_notas ON tabela_alunos.id_aluno = tabela_notas.id_aluno
JOIN tabela_disciplinas ON tabela_disciplinas.id_disciplina = tabela_notas.id_disciplina 
WHERE tabela_notas.id_disciplina = 1;

SELECT nome_turma as Turma, COUNT(tabela_turma_alunos.id_turma) Total_alunos_turma
FROM tabela_turmas
JOIN tabela_turma_alunos
ON tabela_turmas.id_turma = tabela_turma_alunos.id_turma
GROUP BY nome_turma;

SELECT tabela_alunos.nome_aluno as Aluno, tabela_disciplinas.nome_disciplina as Disciplina
from tabela_alunos
join tabela_turma_alunos on tabela_alunos.id_aluno = tabela_turma_alunos.id_alunos
join tabela_turma_disciplinas on tabela_turma_alunos.id_turma = tabela_turma_disciplinas.id_turma
join tabela_disciplinas ON tabela_disciplinas.id_disciplina = tabela_turma_disciplinas.id_disciplinas;

CREATE VIEW AlunosDisciplinaNota AS
SELECT nome_aluno, nome_disciplina, valor_nota 
FROM tabela_alunos
JOIN tabela_notas
ON tabela_alunos.ID_Aluno = tabela_notas.ID_Aluno
Join tabela_disciplinas
On tabela_notas.ID_Disciplina = tabela_disciplinas.ID_Disciplina;


----------


SELECT * FROM tabela_disciplinas

SELECT nome_aluno as Alunos, tabela_notas.valor_nota as Notas
from tabela_alunos 
JOIN tabela_notas ON tabela_notas.id_aluno = tabela_alunos.id_aluno
WHERE tabela_notas.id_disciplina = '1' AND tabela_notas.valor_nota >= '7.0';

SELECT  tabela_turmas.nome_turma as Turma, COUNT(tabela_turma_disciplinas.id_disciplinas) AS 'Total de Disciplinas'
FROM tabela_turma_disciplinas
JOIN tabela_turmas ON tabela_turmas.id_turma = tabela_turma_disciplinas.id_turma
GROUP BY id_disciplinas;

SELECT
(SELECT COUNT(*) FROM tabela_alunos) AS Total_Alunos,
(SELECT COUNT(*) FROM tabela_alunos JOIN tabela_notas ON tabela_notas.id_aluno = tabela_alunos.id_aluno WHERE tabela_notas.valor_nota >= 7.0) AS Alunos_Aprovados,
(SELECT COUNT(*) FROM tabela_notas) AS Total_Notas,
(ROUND(100.0 * (SELECT COUNT(*) FROM tabela_alunos JOIN tabela_notas ON tabela_notas.id_aluno = tabela_alunos.id_aluno WHERE tabela_notas.valor_nota >= 7.0) / (SELECT COUNT(*) 
FROM tabela_notas), 2) || '%') AS Porcentagem;


SELECT 
    tabela_disciplinas.nome_disciplina AS Disciplina,
    COUNT(*) AS Total_Alunos,
    SUM(CASE WHEN tabela_notas.valor_nota >= 7.0 THEN 1 ELSE 0 END) AS Alunos_Aprovados,
    ROUND (SUM(CASE WHEN tabela_notas.valor_nota >= 7.0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) || '%' AS Porcentagem_Aprovados
FROM 
    tabela_alunos
JOIN 
    tabela_notas ON tabela_notas.id_aluno = tabela_alunos.id_aluno
JOIN 
    tabela_disciplinas ON tabela_disciplinas.id_disciplina = tabela_notas.id_disciplina
GROUP BY 
    Disciplina;