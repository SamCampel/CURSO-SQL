-- CRIANDO UM BANCO DE DADOS

use Carros;

CREATE TABLE
    marcas (
        marcas_id INT NOT NULL AUTO_INCREMENT,
        nome_marca VARCHAR(255) NOT NULL,
        PRIMARY KEY (marcas_id)
    );

ALTER TABLE marcas add origem VARCHAR(255);

CREATE TABLE
    inventario (
        inventario_id INT NOT NULL AUTO_INCREMENT,
        modelo VARCHAR(255) NOT NULL,
        marcas_id INT NOT NULL,
        transmissao VARCHAR(255) NOT NULL,
        motor VARCHAR(255) NOT NULL,
        combustivel VARCHAR(255) NOT NULL,
        PRIMARY KEY (inventario_id),
        FOREIGN KEY (marcas_id) REFERENCES marcas (marcas_id)
    );

CREATE TABLE
    clientes (
        cliente_id INT NOT NULL AUTO_INCREMENT,
        nome VARCHAR(255) NOT NULL,
        sobrenome VARCHAR(255) NOT NULL,
        endereco VARCHAR(255) NOT NULL,
        PRIMARY KEY (cliente_id)
    );

INSERT INTO
    clientes (nome, sobrenome, endereco)
VALUES
    ('Emanuel', 'Costa', 'Rua 1');

INSERT INTO
    inventario (
        modelo,
        marcas_id,
        transmissao,
        motor,
        combustivel
    )
VALUES
    ('BMW 218', 1, 'Automática', '2.0', 'Gasolina'),
    ('XE 2.0D', 5, 'Manual', '2.0', 'Diesel');
