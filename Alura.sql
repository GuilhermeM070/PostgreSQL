INSERT INTO aluno(
	nome,
	cpf,
	observacao,
	idade,
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em) 
VALUES (
	'Diogo',
	'12345678901',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras finibus mollis justo in congue. Curabitur eget malesuada lorem, posuere varius ante. Mauris in est orci. Sed semper pretium velit vitae egestas. Donec finibus semper eleifend. Ut id velit ultricies, pellentesque purus nec, maximus risus. Nulla tristique tellus nec quam condimentum, sit amet convallis erat fermentum. Mauris in dictum dui. In et ante quam. Suspendisse tempor leo nec elementum mattis. Vestibulum rutrum quam risus, eu aliquam sem rhoncus eu.Vestibulum facilisis nunc at viverra luctus. Vestibulum quis tortor lacus. Sed at euismod mauris. Praesent sed neque risus. Donec sed cursus ligula. Nam cursus porttitor purus auctor consequat. In vitae turpis aliquet, euismod quam eu, finibus lacus. Curabitur volutpat tellus et pretium volutpat.',
	35,
	100.50,
	1.81,
	TRUE,
	'1984-08-27',
	'17:30:00',
	'2020-02-08 12:32:45'
);

SELECT * 
   FROM aluno;

   SELECT nome 
  FROM aluno;
  
 SELECT nome,
 		idade
  FROM aluno;
   
 SELECT nome,
 		idade,
		matriculado_em
  FROM aluno;
  
 SELECT nome,
 		idade,
		matriculado_em as quando_se_matriculou
  FROM aluno;
  
 SELECT nome as "Nome do Aluno",
 		idade,
		matriculado_em as quando_se_matriculou
  FROM aluno;  
  
 SELECT nome as Nome do Aluno,
 		idade,
		matriculado_em as quando_se_matriculou
  FROM aluno;
  
 SELECT nome as "Nome do Aluno",
 		idade,
		matriculado_em as quando_se_matriculou
  FROM aluno; 
  
  INSERT INTO aluno (nome) VALUES('Vinicius Dias');
INSERT INTO aluno (nome) VALUES('Nico Steppat');
INSERT INTO aluno (nome) VALUES('João Roberto');
INSERT INTO aluno (nome) VALUES('Diego');

SELECT *
  FROM aluno; 
  
SELECT *
  FROM aluno
 WHERE nome= 'Diogo';
 
SELECT *
  FROM aluno
 WHERE nome <> 'Diogo';
 
SELECT *
  FROM aluno
 WHERE nome != 'Diogo';
 
SELECT *
  FROM aluno
 WHERE nome LIKE '_iogo';
 
SELECT *
  FROM aluno
 WHERE nome LIKE 'Di_go';
 
SELECT *
  FROM aluno
 WHERE nome NOT LIKE 'Di_go';
 
SELECT *
  FROM aluno
 WHERE nome LIKE 'D%';
 
SELECT *
  FROM aluno
 WHERE nome LIKE '%s';
 
 SELECT *
  FROM aluno
 WHERE nome LIKE '% %';
 
SELECT *
  FROM aluno
 WHERE nome LIKE '%i%a%';
 
 SELECT *
  FROM aluno
 WHERE cpf IS NULL;
 
SELECT *
  FROM aluno
 WHERE cpf IS NOT NULL;

  SELECT *
  FROM aluno
 WHERE idade = 35;
 
 SELECT *
  FROM aluno
 WHERE idade <> 36;
 
 SELECT *
  FROM aluno
 WHERE idade >= 35;
 
  SELECT *
  FROM aluno
 WHERE idade <= 35;
 
 SELECT *
  FROM aluno
 WHERE idade > 35;
 
 SELECT *
  FROM aluno
 WHERE idade < 100;
 
 SELECT *
  FROM aluno
 WHERE idade BETWEEN 10 AND 40;
 
 SELECT * FROM aluno WHERE ativo = true;
 SELECT * FROM aluno WHERE ativo = false; 
 SELECT * FROM aluno WHERE ativo IS NULL;
 
 SELECT *
  FROM aluno
 WHERE nome LIKE 'D%'
   AND cpf IS NOT NULL;
   
SELECT *
  FROM aluno
 WHERE nome LIKE 'Diogo'
   OR nome LIKE 'Rodrigo';
   
SELECT *
  FROM aluno
 WHERE nome LIKE 'Diogo'
    OR nome LIKE 'Rodrigo'
	OR nome LIKE 'Nico%';
	
SELECT *
  FROM aluno
 WHERE nome LIKE '%Steppat'
	AND nome LIKE 'Nico%';
	
SELECT *
  FROM aluno
 WHERE nome LIKE 'Diogo'
	OR nome LIKE 'Nico%';
	
/*Criando chaves primárias, caracteristicas da chave primária (Não pode ser NULL e tem que ser único)*/
DROP TABLE curso;
CREATE TABLE  curso(
	id INTEGER PRIMARY KEY,
	nome VARCHAR (255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (NULL, NULL);
INSERT INTO curso (id, nome) VALUES (1, NULL);
INSERT INTO curso (id, nome) VALUES (NULL, 'HTML');

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

SELECT * FROM curso;

DROP TABLE aluno;

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO aluno (nome) VALUES ('Diogo');
INSERT INTO aluno (nome) VALUES ('Vinícius');

SELECT * FROM aluno;

DROP TABLE aluno_curso;
CREATE TABLE aluno_curso (
    aluno_id INTEGER,
    curso_id INTEGER,
    PRIMARY KEY (aluno_id, curso_id),
/*Chave estrangeira*/
	FOREIGN KEY (aluno_id)
	REFERENCES aluno (id),
	
	FOREIGN KEY (curso_id)
	REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);

SELECT * FROM aluno_curso;

SELECT * FROM aluno WHERE id = 1;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM aluno WHERE id = 2;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM aluno WHERE id = 3;
SELECT * FROM curso WHERE id = 1;

/*Consultas com relacionamentos*/
SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id

