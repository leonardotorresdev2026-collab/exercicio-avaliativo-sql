CREATE DATABASE db_animeadventures;
USE db_animeadventures;

CREATE TABLE personagens (
    id_personagem INT PRIMARY KEY,
    nome VARCHAR(100) NULL,
    danobase DECIMAL(10,2)
);

INSERT INTO personagens (id_personagem, nome, danobase) VALUES
(1, 'valentines', 45000),
(2, 'aizen', 75000),
(3, 'lancer', 12000),
(4, 'dazai', 34000),
(5, 'dio', 36000),
(6, 'dark mage', 49000),
(7, 'budha', 10000),
(8, 'switchblaade', 60000),
(9, 'sakamoto', 10500),
(10, 'oshi', NULL);


CREATE TABLE universos (
    id_universo INT PRIMARY KEY,
    nome_anime VARCHAR(100),
    categoria VARCHAR(50)
);

INSERT INTO universos (id_universo,nome_anime,categoria) VALUES
(1, 'zzz', 'Acao'),
(2, 'bleach', 'luta'),
(3, 'fate', 'Acao'),
(4, 'bungou stray dogs', 'Acao'),
(5, 'jojo bizarre adventure', 'Fantasia'),
(6, 'black clover', 'luta'),
(7, 'record of ragnarok', 'luta'),
(8, 'sakamoto days', 'luta'),
(9, 'sakamoto days', 'luta'),
(10, 'oshi no ko', 'açao');


CREATE TABLE batalhas (
    id_batalha INT PRIMARY KEY,
    id_personagem INT NULL,
    id_universo INT NULL,
    data_batalha DATE,
    status VARCHAR(30),
    FOREIGN KEY (id_personagem)
        REFERENCES personagens(id_personagem),
    FOREIGN KEY (id_universo)
        REFERENCES universos(id_universo)
);

INSERT INTO batalhas (id_batalha,id_personagem,id_universo,data_batalha,status)VALUES
(1, 1, 1, '2026 01 10', 'vitoria'),
(2, 2, 1, '2026 01 11', 'vitoria'),
(3, 3, 2, '2026 01 12', 'derrota'),
(4, 4, 3, '2026 01 13', 'vitoria'),
(5, 5, 4, '2026 01 14', 'pendente'),
(6, 6, 5, '2026 01 15', 'vitoria'),
(7, 7, 6, '2026 01 16', 'derrota'),
(8, 8, 7, '2026 01 17', 'vitoria'),
(9, NULL, 8, '2026 01 18', 'pendente'),
(10, 9, NULL, '2026 01 19', 'derrota');


-- exercicio 1

SELECT personagens.nome, universos.nome_anime
FROM personagens
INNER JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
INNER JOIN universos
ON batalhas.id_universo = universos.id_universo;


-- exercicio 2

SELECT personagens.nome, universos.*
FROM personagens
INNER JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
INNER JOIN universos
ON batalhas.id_universo = universos.id_universo;


-- exercicio 3
SELECT personagens.nome, universos.nome_anime,batalhas.status
FROM personagens
INNER JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
INNER JOIN universos
ON batalhas.id_universo = universos.id_universo;


-- exercicio 4
SELECT personagens.nome, personagens.danobase,universos.nome_anime
FROM personagens
INNER JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
INNER JOIN universos
ON batalhas.id_universo = universos.id_universo;

-- exercicio 5
SELECT personagens.nome, universos.nome_anime,batalhas.data_batalha
FROM personagens
INNER JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
INNER JOIN universos
ON batalhas.id_universo = universos.id_universo;

-- exercicio 6
SELECT personagens.nome, universos.nome_anime,batalhas.status
FROM personagens
INNER JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
INNER JOIN universos
ON batalhas.id_universo = universos.id_universo
WHERE batalhas.status = 'vitoria';

-- exercicio 7
SELECT personagens.nome, universos.nome_anime
FROM personagens
LEFT JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
LEFT JOIN universos
ON batalhas.id_universo = universos.id_universo;

-- exercicio 8
SELECT personagens.nome, personagens.danobase,universos.nome_anime
FROM personagens
LEFT JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
LEFT JOIN universos
ON batalhas.id_universo = universos.id_universo;

-- exercicio 9
SELECT universos.nome_anime, personagens.nome
FROM batalhas
RIGHT JOIN universos
ON batalhas.id_universo = universos.id_universo
LEFT JOIN personagens
ON batalhas.id_personagem = personagens.id_personagem;

-- exercicio 10 
SELECT personagens.nome, universos.nome_anime,batalhas.status
FROM personagens
LEFT JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
LEFT JOIN universos
ON batalhas.id_universo = universos.id_universo;

-- exercicio 11
SELECT personagens.nome
FROM personagens
LEFT JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
WHERE batalhas.id_batalha IS NULL;

-- exercicio 12
SELECT universos.*, batalhas.data_batalha,batalhas.status, personagens.nome
FROM universos
LEFT JOIN batalhas
ON universos.id_universo = batalhas.id_universo
LEFT JOIN personagens
ON batalhas.id_personagem = personagens.id_personagem;

-- exercicio 13
SELECT universos.nome_anime, personagens.nome
FROM batalhas
RIGHT JOIN universos
ON batalhas.id_universo = universos.id_universo
LEFT JOIN personagens
ON batalhas.id_personagem = personagens.id_personagem;

-- exercicio 14
SELECT universos.nome_anime, universos.categoria,batalhas.status
FROM batalhas
RIGHT JOIN universos
ON batalhas.id_universo = universos.id_universo;

-- exercicio 15
SELECT batalhas.id_batalha, personagens.nome,universos.nome_anime, batalhas.status
FROM personagens
RIGHT JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
LEFT JOIN universos
ON batalhas.id_universo = universos.id_universo;

-- exercicio 16
SELECT universos.nome_anime
FROM batalhas
RIGHT JOIN universos
ON batalhas.id_universo = universos.id_universo
WHERE batalhas.id_batalha IS NULL;

-- exercicio 17
SELECT personagens.nome, personagens.danobase,universos.nome_anime, batalhas.status
FROM personagens
INNER JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
INNER JOIN universos
ON batalhas.id_universo = universos.id_universo
WHERE batalhas.status = 'vitoria'
AND personagens.danobase > 30000;

-- exercicio 18
SELECT personagens.nome, personagens.danobase
FROM personagens
LEFT JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem;

-- exercicio 19
SELECT universos.nome_anime, universos.categoria,personagens.nome, personagens.danobase
FROM batalhas
RIGHT JOIN universos
ON batalhas.id_universo = universos.id_universo
LEFT JOIN personagens
ON batalhas.id_personagem = personagens.id_personagem;

-- exercicio 20
SELECT 
 personagens.nome as personagem,
 personagens.danobase,
 universos.nome_anime as anime,
 universos.categoria,
 batalhas.data_batalha,
 batalhas.status
FROM personagens
LEFT JOIN batalhas
ON personagens.id_personagem = batalhas.id_personagem
LEFT JOIN universos
ON batalhas.id_universo = universos.id_universo;