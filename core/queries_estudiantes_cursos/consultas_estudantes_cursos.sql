INSERT INTO cursos (nome)
	VALUES ("Gastronomia Marciana"), ("Python para culinaria"), ("Dancas australianas");
    
SELECT *
	FROM cursos;
    
/* Safe update is on */

DELETE 
	FROM cursos
    WHERE id <> 0;
    
INSERT INTO cursos (nome)
	VALUES ("Magia & MySQL"), ("Poker intergalatico"), ("Leitura de maos");

SELECT *
	FROM cursos;

INSERT INTO estudantes (nome, sobrenome, idade, curso_id)
	VALUES ("Florindo", "Dias", 32, 4), ("Luis", "Pedreira", 42, 4), ("Larissa", "Corrientes", 28, 4);

INSERT INTO estudantes (nome, sobrenome, idade, curso_id)
	VALUES ("Alfredo", "Costa", 51, 5), ("Marcia", "Mili", 37, 5), ("Carmen", "Tranje", 39, 5);

INSERT INTO estudantes (nome, sobrenome, idade, curso_id)
	VALUES ("Amelia", "Dia", 22, 6), ("Lais", "Flores", 43, 6), ("Celio", "Puerta", 38, 6);
    
SELECT *
	FROM estudantes
    WHERE curso_id = 4;
    
SELECT *
	FROM estudantes
    WHERE curso_id = 5;
    
SELECT cursos.nome
	FROM estudantes
    JOIN cursos
    ON curso_id = cursos.id
    WHERE estudantes.id = 9;

