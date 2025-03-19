/* Query 1: paises que falam espanhol */

SELECT p.nombre, i.idioma, i.porcentage
FROM paises AS p
JOIN idiomas AS i
	ON p.id = i.pais_id
WHERE i.idioma = "español"
ORDER BY i.porcentage DESC;


/* Query 2: contagem de cidades por pais */
/* Atención: el resultado esperado indicado por Coding Dojo NO corresponde al enunciado */

SELECT p.nombre, COUNT(DISTINCT c.nombre) as numero_ciudades
FROM paises AS p
JOIN ciudades as c
	ON p.id = c.pais_id
GROUP BY p.nombre
ORDER BY numero_ciudades DESC;


/* Query 3: cidades do Chile com mais de 200.000 habitantes */

SELECT c.nombre AS ciudade, c.poblacion
FROM paises AS p
JOIN ciudades as c
	ON p.id = c.pais_id
WHERE p.nombre = "Chile" AND c.poblacion >= 200000
ORDER BY c.poblacion DESC;


/* Query 4: idiomas de cada pais com mais de 89% fala */

SELECT p.nombre, i.idioma, i.porcentage
FROM paises AS p
JOIN idiomas AS i
	ON p.id = i.pais_id
WHERE i.porcentage > 89
ORDER BY i.porcentage DESC;


/* Query 5: paises com populacao maior que 100.000 e area menor que 501 */

SELECT nombre, area_superficie, poblacion
FROM paises 
WHERE area_superficie < 501 AND poblacion > 100000;


/* Query 6: paises que sao republica, capital maior que 2000 e expectativa de vida maior que 78 anos */

SELECT nombre, tipo_gobierno, capital, esperanza_vida
FROM paises
WHERE tipo_gobierno = "República" AND capital > 2000 AND esperanza_vida > 78;


/* Query 7: cidade da Colombia distrito de Valle */

SELECT p.nombre, c.nombre, c.distrito, c.poblacion
FROM paises AS p
JOIN ciudades as c
	ON p.id = c.pais_id
WHERE p.nombre = "Colombia" AND c.distrito = "Valle" AND c.poblacion > 200000
ORDER BY c.nombre;


/* Query 8: paises por regiao */

SELECT region, COUNT(DISTINCT nombre) as numero_paises
FROM paises
GROUP BY region
ORDER BY numero_paises DESC;
