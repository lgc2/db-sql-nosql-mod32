-- Exercício 1.a:
-- - Faça uma consulta que retorne a lista de filmes e suas categorias correspondentes

SELECT f.title, c.name
from film f
    inner join film_category fc on f.film_id = fc.film_id
    inner join category c on fc.category_id = c.category_id
order by f.title;

-- Exercício 2.a:
-- Crie uma consulta para cada consulta do exercício anterior que retorne o numero de registros encontrados pela busca

SELECT COUNT(*) as exercicio_1_a
from film f
    inner join film_category fc on f.film_id = fc.film_id
    inner join category c on fc.category_id = c.category_id;



-- Exercício 1.b:
-- - Faça uma consulta que retorne a lista de todos os atores com o número filmes que cada ator participou. Ordene a lista pelo numero de filmes, iniciando pelos atores que mais atuaram

SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) as number_of_films
from actor a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name
ORDER BY number_of_films DESC;

-- Exercício 2.b:
-- Crie uma consulta para cada consulta do exercício anterior que retorne o numero de registros encontrados pela busca

SELECT COUNT(number_of_films)
FROM (
        SELECT
            a.actor_id,
            a.first_name,
            a.last_name,
            COUNT(fa.film_id) as number_of_films
        from actor a
            INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
        GROUP BY
            a.actor_id,
            a.first_name,
            a.last_name
    ) subconsulta;



-- Exercício 1.c:
-- - Faça uma consulta que retorne a lista de atores que atuaram em filmes com mais de duas horas de duração (120min). Ordene a lista pelo numero de filmes que cada ator participou

SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    f.`length`,
    COUNT(fa.film_id) as number_of_films
from actor a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    INNER JOIN film f ON fa.film_id = f.film_id
WHERE f.`length` > 120
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name,
    f.`length`
ORDER BY
    number_of_films DESC,
    a.actor_id,
    f.`length` DESC;

-- Exercício 2.c:
-- Crie uma consulta para cada consulta do exercício anterior que retorne o numero de registros encontrados pela busca (2283)

SELECT COUNT(*)
FROM (
        SELECT
            a.actor_id,
            a.first_name,
            a.last_name,
            f.`length`,
            COUNT(fa.film_id) as number_of_films
        from actor a
            INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
            INNER JOIN film f ON fa.film_id = f.film_id
        WHERE f.`length` > 120
        GROUP BY
            a.actor_id,
            a.first_name,
            a.last_name,
            f.`length`
    ) subconsulta;
