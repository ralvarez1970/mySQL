INSERT INTO usuarios (nome, sobrenome, email)
VALUES 
    ("Maria", "Silva", "maria.silva@gmail.com"),
    ("Carlos", "Oliveira", "carlos.oliveira@gmail.com"),
    ("Ana", "Santos", "ana.santos@gmail.com"),
    ("Pedro", "Almeida", "pedro.almeida@gmail.com"),
    ("Fernanda", "Costa", "fernanda.costa@gmail.com");
    
    
INSERT INTO usuarios (nome, sobrenome, email)
	VALUES ("João", "Pedrosa", "jp@gmail.com");
  
  
SELECT * 
	FROM usuarios;

SELECT * 
	FROM seguidores;    
    
INSERT INTO seguidores (usuario_id, usuario_id1)
	VALUES (1, 3), (1,4), (1,5), (2, 1), (2, 3), (2, 6), (3, 2), (3, 6), (4, 2), (5, 3), (5, 6), (6, 1);


/* Tabela geral */

SELECT *
	FROM usuarios
	JOIN seguidores 
		ON usuarios.id = seguidores.usuario_id
    JOIN usuarios AS usuarios2
		ON seguidores.usuario_id1 = usuarios2.id;


/* Usuarios e seguidores */

SELECT CONCAT (usuarios.nome, " ", usuarios.sobrenome) as usuario, CONCAT (usuarios2.nome, " ", usuarios2.sobrenome) as seguidor
	FROM usuarios
	JOIN seguidores 
		ON usuarios.id = seguidores.usuario_id
    JOIN usuarios AS usuarios2
		ON seguidores.usuario_id1 = usuarios2.id;


/* Todos os usuários que seguem usuário 1 */

SELECT CONCAT (usuarios2.nome, " ", usuarios2.sobrenome) as seguidor_usuario_1
	FROM usuarios
	JOIN seguidores 
		ON usuarios.id = seguidores.usuario_id
    JOIN usuarios AS usuarios2
		ON seguidores.usuario_id1 = usuarios2.id
    WHERE seguidores.usuario_id = 1;
    
/* Quantidade de seguidores de cada usuario */

SELECT CONCAT(usuarios.nome, " ", usuarios.sobrenome) AS usuario, 
       COUNT(seguidores.usuario_id) AS numero_seguidores
	FROM usuarios
	LEFT JOIN seguidores 
	ON usuarios.id = seguidores.usuario_id
	GROUP BY usuarios.id;

/* Seguidores do usuario 3 */

SELECT CONCAT(usuarios2.nome, " ", usuarios2.sobrenome) AS "seguidores usuario 3"
	FROM usuarios
	LEFT JOIN seguidores 
		ON usuarios.id = seguidores.usuario_id
	JOIN usuarios AS usuarios2
		ON seguidores.usuario_id1 = usuarios2.id
	WHERE usuarios.id = 3
	ORDER BY usuarios2.nome;