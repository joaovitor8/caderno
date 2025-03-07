CREATE TABLE tabelafuncionarios (
  Id INT PRIMARY KEY,
  Nome VARCHAR(100),
  Departamento VARCHAR(100),
  Salario DECIMAL(10,2)
);


INSERT INTO tabelafuncionarios (id, nome, departamento, salario)
  VALUES ( 1, 'Heitor Vieira', 'Financeiro', 4959.22),
    (2, 'Daniel Campos', 'Vendas', 3884.44),
	(3, 'Luiza Dias', 'TI', 8205.78),
	(4, 'Davi Lucas Moraes', 'Financeiro', 8437.02),
	(5, 'Pietro Cavalcanti', 'TI', 4946.88),
	(6, 'Evelyn da Mata', 'Vendas', 5278.88),
	(7, 'Isabella Rocha', 'Marketing', 4006.03),
	(8, 'Sra. Manuela Azevedo', 'Vendas', 6101.88),
	(9, 'Brenda Cardoso', 'TI', 8853.34),
	(10, 'Danilo Souza', 'TI', 8242.14);
    

SELECT * FROM tabelafuncionarios;


SELECT * FROM tabelafuncionarios WHERE departamento = 'Vendas';


SELECT * FROM tabelafuncionarios WHERE salario > 5000;


SELECT * FROM tabelafuncionarios WHERE departamento <> 'Vendas';


UPDATE tabelafuncionarios
SET salario = 7500
WHERE departamento = 'TI';


DELETE FROM tabelafuncionarios WHERE salario < 4000;


SELECT * FROM tabelafuncionarios WHERE departamento = 'Vendas' AND salario >= 6000;


CREATE TABLE tabelaprojetos (
  id INT PRIMARY KEY,
  nome_projeto VARCHAR(100),
  id_gerente INT,
  FOREIGN KEY (id_gerente) REFERENCES tabelafuncionarios(id)
);


INSERT INTO tabelaprojetos (id, nome_projeto)
  VALUES ( 1, 'projeto1'),
    (2, 'projeto2'),
	(3, 'projeto3');


SELECT * FROM tabelaprojetos;

DROP TABLE tabelaprojetos