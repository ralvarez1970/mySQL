INSERT INTO usuarios (nome, email, senha)
	VALUES ("Manuel", "man@gmail.com", "123$"), ("Lele", "lele@gmail.com", "sssd$"), ("Carlao", "cp@sin.com", "ooxx@"), ("Pedro", "drito@gmail.com", "croc$"), ("Ana", "ana_pinho@gmail.com", "senha$$");
    
SELECT * 
	FROM usuarios;

INSERT INTO artistas (nome)
	VALUES ("Rolling Stones"), ("The Police"), ("O Rappa"), ("Os Tribalistas"), ("Frank Sinatra");

SELECT * 
	FROM artistas;
        
INSERT INTO cancoes (titulo, artista_id)
	VALUES ("Start me up", 1), ("Bring on the night", 2), ("Satisfaction", 1), ("Pescador de ilusões", 3), ("Já sei namorar", 4), ("Strangers in the night", 5);
    
SELECT * 
	FROM cancoes;
    
UPDATE usuarios
	SET nome = "Miyagi"
    WHERE id = 3;

UPDATE cancoes
	SET titulo = "Macarena"
    WHERE id = 7;
    
INSERT INTO usuarios_has_cancoes (usuario_id, cancao_id)
	VALUES(1, 7), (1, 8), (1, 9);
    
INSERT INTO usuarios_has_cancoes (usuario_id, cancao_id)
	VALUES(2, 7), (2, 8);

INSERT INTO usuarios_has_cancoes (usuario_id, cancao_id)
	VALUES(3, 7), (3, 8), (3, 9), (3, 10);

INSERT INTO usuarios_has_cancoes (usuario_id, cancao_id)
	VALUES(4, 7), (4, 8), (4, 9), (4, 10), (4, 11), (4, 12);

INSERT INTO usuarios_has_cancoes (usuario_id, cancao_id)
	VALUES(5, 7);

SELECT * 
	FROM usuarios_has_cancoes;

SELECT *
	FROM usuarios 
	JOIN usuarios_has_cancoes
    ON usuarios.id = usuarios_has_cancoes.usuario_id
	WHERE cancao_id = 9;

SELECT titulo
	FROM usuarios 
	JOIN usuarios_has_cancoes
    ON usuarios.id = usuarios_has_cancoes.usuario_id
    JOIN cancoes
    ON cancoes.id = usuarios_has_cancoes.cancao_id
    WHERE usuario_id = 2;
