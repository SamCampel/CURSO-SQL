--CONSULTAS DO CURSO----------------------------------------------------------------

-- Uso do SELECT, ORDER BY e WHERE

use sakila;

--SELECT 
    --actor_id,
SELECT * FROM
    actor_id,
    first_name,
    last_name
FROM
    actor
--ORDER BY
    --last_name;
WHERE
    actor_id <= 10
    -- ORDER BY last_name 
    -- LIMIT  5
;

-- outra consulta em select
SELECT
    customer_id,
    amount,
    (amount * 0.9) AS '10% discount'
FROM
    payment
WHERE
    customer_id = 1
;

-- outras consultas com where
SELECT
    *
FROM
    payment
WHERE
    amount != 0.99
    -- ORDER BY amount DESC
;

SELECT
    *
FROM
    address
WHERE
    district = 'California'
;


--OPERADORES----------------------------------------------------------------------

-- AND, OR e NOT
SELECT
    *
FROM
    payment
WHERE
    NOT staff_id = 1
    AND amount != 0.99
    AND CUSTOMER_ID < 10
;

-- IN
use sakila;

SELECT
    *
FROM
    address
WHERE
    district IN ('Alberta', 'Texas', 'California');

-- BEETWEEN
use sakila;

SELECT
    *
FROM
    payment
WHERE
    amount BETWEEN 1.99 AND 3.99
ORDER BY
    AMOUNT

-- LIKE
use sakila;

SELECT
    *
FROM
    actor
WHERE
    first_name LIKE 'AL%';

-- IS NULL
use sakila;

SELECT
    *
FROM
    address
WHERE
    address2 IS NULL

-- LIMIT
use sakila;

SELECT
    *
FROM
    actor
LIMIT
    99, 10
;

-- REGE XP
use sakila;

SELECT
     *
FROM
     actor
WHERE
     first_name REGEXP '^[gcr]a'
     -- where first_name REGEXP '^a|^d|^r'
;

-- INNER JOIN
use sakila;

SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    payment.rental_id,
    payment.amount
FROM
    customer
    JOIN payment ON customer.customer_id = payment.payment_id;

-- ALIAS
use sakila;

SELECT
    cus.customer_id,
    cus.first_name,
    cus.last_name,
    pay.rental_id,
    pay.amount
FROM
    customer AS cus
    JOIN payment AS pay ON cus.customer_id = pay.payment_id;

--TABELAS------------------------------------------------------------------------------
use sakila;

SELECT 
    cus.customer_id,
    cus.first_name,
    cus.last_name,
    pay.rental_id,
    pay.amount,
    adr.address
FROM
    customer AS cus
    JOIN payment AS pay ON cus.customer_id = pay.customer_id
    JOIN address AS adr ON cus.address_id = adr.address_id;

INSERT INTO
    LANGUAGE
VALUES
    (DEFAULT, 'Portugues', '2008-02-15 05:02:19'),
    (DEFAULT, 'Polish', '2006-02-15 05:02:19'),
    (DEFAULT, 'Spanish', '2002-02-15 05:02:19');

CREATE TABLE
    payment_backup AS
SELECT
    *
FROM
    payment;

UPDATE PAYMENT
SET
    amount = 15.99
WHERE
    payment_id = 1;

DELETE FROM PAYMENT
WHERE
    payment_id = 1001;

--FUNÇÕES--------------------------------------------------------------------------------
--MAX, MIN, AVG, SUM E COUNT
use sakila;

SELECT
    MAX(amount) AS MAIOR,
    MIN(amount) AS MENOR,
    AVG(amount) AS 'Média de Valores',
    SUM(amount) AS 'Total de Vendas',
    COUNT(amount) AS 'Números de Vendas'
FROM
    payment;

--AGRUPANDO CLIENTES COM GROUPY BY
SELECT
    customer_id,
    SUM(amount) AS Total
FROM
    payment
GROUP BY
    customer_id
ORDER BY
    Total DESC

-- ORDENANDO

SELECT
    cus.customer_id AS ID,
    cus.first_name AS Nome,
    cus.last_name AS Sobrenome,
    MAX(pay.amount) AS Total
FROM
    payment AS pay
    JOIN customer AS cus USING (customer_id)
GROUP BY
    customer_id
ORDER BY
    Total DESC

-- FILTRANDO OS VALORES USANDO O HAVING
SELECT
    cus.customer_id AS ID,
    cus.first_name AS Nome,
    cus.last_name AS Sobrenome,
    SUM(pay.amount) AS Total,
    COUNT(pay.amount) AS Compras
FROM
    payment AS pay
    JOIN customer AS cus USING (customer_id)
GROUP BY
    customer_id
HAVING
    Total >= 150
    AND compras >= 35
ORDER BY
    Total DESC;

-- DROP
DROP DATABASE `sakila`;

-- SUB QUERY
use sakila;

SELECT
    *
FROM
    payment
WHERE
    AMOUNT > (
        SELECT
            AVG(AMOUNT)
        FROM
            PAYMENT
    );

--MAX
SELECT
    *
FROM
    PAYMENT
WHERE
    amount = (
        SELECT
            MAX(AMOUNT)
        FROM
            payment
        WHERE
            customer_id = 1
    );

--IN
SELECT
    *
FROM
    customer
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            PAYMENT
        GROUP BY
            customer_id
        HAVING
            COUNT(*) > 35
    )

--ANY
SELECT
    *
FROM
    customer
WHERE
    customer_id = ANY (
        SELECT
            customer_id
        FROM
            PAYMENT
        GROUP BY
            customer_id
        HAVING
            COUNT(*) > 35
    )

--CRIANDO VIEWS

DROP VIEW vendas_por_cliente;


CREATE VIEW
    vendas_por_cliente AS
SELECT
    cus.customer_id,
    cus.first_name,
    cus.last_name,
    pay.amount
FROM
    customer AS cus
    JOIN payment AS pay ON cus.customer_id = pay.customer_id;

--REPLACE VIEW
SELECT
    *
FROM
    sakila.vendas_por_cliente
WHERE
    amount >= 9.99;

CREATE
OR REPLACE VIEW vendas_por_cliente AS
SELECT
    cus.customer_id,
    cus.first_name,
    cus.last_name,
    pay.payment_id,
    pay.amount
FROM
    customer AS cus
    JOIN payment AS pay ON cus.customer_id = pay.customer_id
ORDER BY
    pay.amount ASC;


SELECT
    *
FROM
    sakila.vendas_por_cliente;