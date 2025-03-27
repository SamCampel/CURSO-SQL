use mysql;

SHOW tables;

SELECT
    *
FROM
    mysql.user

CREATE USER ana IDENTIFIED BY '1212';
CREATE USER joao@localhost IDENTIFIED BY '1212';
CREATE USER priscila@andreiacono.com IDENTIFIED BY '1212';

SELECT
    *
FROM
    mysql.user

DROP USER priscila@andreiacono.com;

--RECUPENANDO SENHA
SELECT
    *
FROM
    mysql.user

SET
password FOR joao@localhost = '4444';
SELECT
    *
FROM
    MYSQL.USER

-- PRIVILÉGIOS DO USUÁRIO
SELECT    * FROM    mysql.user;

GRANT
SELECT
,
    INSERT,
UPDATE,
DELETE ON sakila.* TO ana;

show grants FOR ana;

--ADICIONANDO ADMIN
SELECT 
    *
FROM
    mysql.user;


GRANT all ON sakila.* TO ana;

GRANT all ON *.* TO joao@localhost;

show grants for joao@localhost;
show grants FOR ana;

--REMOVENDO PRIVILÉGIOS

-- create user priscila IDENTIFIED BY '1212'; 

GRANT
SELECT,
INSERT,
UPDATE ON sakila.* TO priscila;

REVOKE
UPDATE ON sakila.*
FROM
    priscila;

show GRANTS FOR priscila;