create database db_animeadventures;
use db_animeadventures;

create table personagens (
    id_personagem int primary key,
    nome varchar(100) null,
    danobase decimal(10,2)
);

insert into personagens (id_personagem, nome, danobase) values
(1, 'valentines', 45000),
(2, 'aizen', 75000),
(3, 'lancer', 12000),
(4, 'dazai', 34000),
(5, 'dio', 36000),
(6, 'dark mage', 49000),
(7, 'budha', 10000),
(8, 'switchblaade', 60000),
(9, 'sakamoto', 10500),
(10, 'oshi', null);


create table universos (
    id_universo int primary key,
    nome_anime varchar(100),
    categoria varchar(50)
);

insert into universos (id_universo,nome_anime,categoria) values
(1, 'zzz', 'acao'),
(2, 'bleach', 'luta'),
(3, 'fate', 'acao'),
(4, 'bungou stray dogs', 'acao'),
(5, 'jojo bizarre adventure', 'fantasia'),
(6, 'black clover', 'luta'),
(7, 'record of ragnarok', 'luta'),
(8, 'sakamoto days', 'luta'),
(9, 'sakamoto days', 'luta'),
(10, 'oshi no ko', 'açao');


create table batalhas (
    id_batalha int primary key,
    id_personagem int null,
    id_universo int null,
    data_batalha date,
    status varchar(30),
    foreign key (id_personagem)
        references personagens(id_personagem),
    foreign key (id_universo)
        references universos(id_universo)
);

insert into batalhas (id_batalha,id_personagem,id_universo,data_batalha,status) values
(1, 1, 1, '2026 01 10', 'vitoria'),
(2, 2, 1, '2026 01 11', 'vitoria'),
(3, 3, 2, '2026 01 12', 'derrota'),
(4, 4, 3, '2026 01 13', 'vitoria'),
(5, 5, 4, '2026 01 14', 'pendente'),
(6, 6, 5, '2026 01 15', 'vitoria'),
(7, 7, 6, '2026 01 16', 'derrota'),
(8, 8, 7, '2026 01 17', 'vitoria'),
(9, null, 8, '2026 01 18', 'pendente'),
(10, 9, null, '2026 01 19', 'derrota');


-- exercicio 1
select personagens.nome, universos.nome_anime
from personagens
inner join batalhas
on personagens.id_personagem = batalhas.id_personagem
inner join universos
on batalhas.id_universo = universos.id_universo;


-- exercicio 2
select personagens.nome, universos.*
from personagens
inner join batalhas
on personagens.id_personagem = batalhas.id_personagem
inner join universos
on batalhas.id_universo = universos.id_universo;


-- exercicio 3
select personagens.nome, universos.nome_anime,batalhas.status
from personagens
inner join batalhas
on personagens.id_personagem = batalhas.id_personagem
inner join universos
on batalhas.id_universo = universos.id_universo;


-- exercicio 4
select personagens.nome, personagens.danobase,universos.nome_anime
from personagens
inner join batalhas
on personagens.id_personagem = batalhas.id_personagem
inner join universos
on batalhas.id_universo = universos.id_universo;


-- exercicio 5
select personagens.nome, universos.nome_anime,batalhas.data_batalha
from personagens
inner join batalhas
on personagens.id_personagem = batalhas.id_personagem
inner join universos
on batalhas.id_universo = universos.id_universo;


-- exercicio 6
select personagens.nome, universos.nome_anime,batalhas.status
from personagens
inner join batalhas
on personagens.id_personagem = batalhas.id_personagem
inner join universos
on batalhas.id_universo = universos.id_universo
where batalhas.status = 'vitoria';


-- exercicio 7
select personagens.nome, universos.nome_anime
from personagens
left join batalhas
on personagens.id_personagem = batalhas.id_personagem
left join universos
on batalhas.id_universo = universos.id_universo;


-- exercicio 8
select personagens.nome, personagens.danobase,universos.nome_anime
from personagens
left join batalhas
on personagens.id_personagem = batalhas.id_personagem
left join universos
on batalhas.id_universo = universos.id_universo;


-- exercicio 9
select universos.nome_anime, personagens.nome
from batalhas
right join universos
on batalhas.id_universo = universos.id_universo
left join personagens
on batalhas.id_personagem = personagens.id_personagem;


-- exercicio 10
select personagens.nome, universos.nome_anime,batalhas.status
from personagens
left join batalhas
on personagens.id_personagem = batalhas.id_personagem
left join universos
on batalhas.id_universo = universos.id_universo;


-- exercicio 11
select personagens.nome
from personagens
left join batalhas
on personagens.id_personagem = batalhas.id_personagem
where batalhas.id_batalha is null;


-- exercicio 12
select universos.*, batalhas.data_batalha,batalhas.status, personagens.nome
from universos
left join batalhas
on universos.id_universo = batalhas.id_universo
left join personagens
on batalhas.id_personagem = personagens.id_personagem;


-- exercicio 13
select universos.nome_anime, personagens.nome
from batalhas
right join universos
on batalhas.id_universo = universos.id_universo
left join personagens
on batalhas.id_personagem = personagens.id_personagem;


-- exercicio 14
select universos.nome_anime, universos.categoria,batalhas.status
from batalhas
right join universos
on batalhas.id_universo = universos.id_universo;


-- exercicio 15
select batalhas.id_batalha, personagens.nome,universos.nome_anime, batalhas.status
from personagens
right join batalhas
on personagens.id_personagem = batalhas.id_personagem
left join universos
on batalhas.id_universo = universos.id_universo;


-- exercicio 16
select universos.nome_anime
from batalhas
right join universos
on batalhas.id_universo = universos.id_universo
where batalhas.id_batalha is null;


-- exercicio 17
select personagens.nome, personagens.danobase,universos.nome_anime, batalhas.status
from personagens
inner join batalhas
on personagens.id_personagem = batalhas.id_personagem
inner join universos
on batalhas.id_universo = universos.id_universo
where batalhas.status = 'vitoria'
and personagens.danobase > 30000;


-- exercicio 18
select personagens.nome, personagens.danobase
from personagens
left join batalhas
on personagens.id_personagem = batalhas.id_personagem;


-- exercicio 19
select universos.nome_anime, universos.categoria,personagens.nome, personagens.danobase
from batalhas
right join universos
on batalhas.id_universo = universos.id_universo
left join personagens
on batalhas.id_personagem = personagens.id_personagem;


-- exercicio 20
select 
 personagens.nome as personagem,
 personagens.danobase,
 universos.nome_anime as anime,
 universos.categoria,
 batalhas.data_batalha,
 batalhas.status
from personagens
left join batalhas
on personagens.id_personagem = batalhas.id_personagem
left join universos
on batalhas.id_universo = universos.id_universo;
`
