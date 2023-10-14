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

-- Ex. 03
-- A)
CREATE TABLE eventos (
   data_evento DATETIME
);

INSERT INTO eventos VALUES
('2006-05-30 09:17:30'),
('2007-02-22 17:12:50'),
('1981-10-16 20:23:32'),
('1980-09-30 05:23:45');

-- B)
INSERT INTO eventos (data_evento) VALUES
(now());

SELECT * FROM eventos;

-- C)
SELECT DATEDIFF ('2007-02-22' , '2006-05-30') AS dias_diferenca;

-- D)
SELECT DAYNAME('2007-02-22') AS dia_semana;

-- Ex. 04
-- A)
INSERT INTO produtos VALUES
('Rímel', '139.999', '0');

SELECT
    produto, preco, quantidade,
    IF(quantidade > 0, 'Em Estoque', 'Fora de Estoque') AS status_estoque
FROM produtos;

-- B)
SELECT
    produto, preco, quantidade,
    CASE
        WHEN preco < 50.00 THEN 'Barato'
        WHEN preco >= 50.00 AND preco < 100.00 THEN 'Médio'
        ELSE 'Caro'
    END AS categoria
FROM produtos
ORDER BY preco;

-- Ex. 05
-- A)
DELIMITER //
    
CREATE FUNCTION total_valor(preco DECIMAL(10, 2), qtd INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    
    SET total = preco * qtd;
   
    RETURN total;
END;
//
    
DELIMITER ;

SELECT ROUND(total_valor(23.200, 10), 2) AS valor_total;

-- B)
SELECT ROUND(total_valor(259.999, 100), 2) AS valor_total;
SELECT ROUND(total_valor (54.999, 80), 2) AS valor_total;
SELECT ROUND(total_valor (69.999, 200), 2) AS valor_total;
SELECT ROUND(total_valor (99.999, 50), 2) AS valor_total;

-- Ex. 06
-- A)
SELECT COUNT(produto) AS total_produtos FROM produtos;

-- B)
SELECT produto, preco
FROM produtos
WHERE preco = (SELECT MAX(preco) FROM produtos);

-- C)
SELECT produto, preco
FROM produtos
WHERE preco = (SELECT MIN(preco) FROM produtos);

-- D)
SELECT ROUND(SUM(IF(quantidade > 0, preco * quantidade, 0)), 2) AS soma_total
FROM produtos;
