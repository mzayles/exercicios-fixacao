-- Ex. 01
-- A)
CREATE TABLE nomes (
nome VARCHAR(100)
);

INSERT INTO nomes (nome) VALUES
('Roberta'),
('Roberto'),
('Maria Clara'),
('João');

-- B)
SELECT UPPER(nome) AS nomes FROM nomes;

-- C)
SELECT LENGTH(nome) AS tamanho FROM nomes;

-- D)
SELECT CONCAT('Sr. ', nome) AS nome
FROM nomes
WHERE nome LIKE '%O'
UNION
SELECT CONCAT('Sra. ', nome) AS nome
FROM nomes
WHERE nome LIKE '%A';

-- Ex. 02
-- A)

DROP TABLE produtos;
CREATE TABLE produtos (
produto VARCHAR(100),
    preco DECIMAL(10, 2),
    quantidade INT
);

INSERT INTO produtos VALUES
('Base', '259.999', '100'),
('Batom', '54.999', '80'),
('Gloss', '69.999', '200'),
('Blush', '99.999', '50');

-- B)
SELECT ROUND(preco, 2) AS preço_arredondado
FROM produtos;

-- C)
SELECT ROUND(AVG(preco), 2) AS media_produto FROM produtos;
