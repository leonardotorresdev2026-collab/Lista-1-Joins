CREATE DATABASE IF NOT EXISTS DB_ESCOLA_JOIN;
USE DB_ESCOLA_JOIN;

DROP TABLE IF EXISTS Matriculas;
DROP TABLE IF EXISTS Alunos;

CREATE TABLE Alunos (
    cod INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

INSERT INTO Alunos (cod, nome, cidade) VALUES
(1, 'Carlos', 'Sorocaba'),
(2, 'Beatriz', 'Itu'),
(3, 'Lucas', 'Votorantim'),
(4, 'Yan', 'Campinas'),
(5, 'Thomas', 'Campo Grande'),
(6, 'Luca', 'Itapetininga'),
(7, 'Robinho', 'Tatuí'),
(8, 'Mariana', 'Sorocaba'),
(9, 'Yago', 'Itapetininga'),
(10, 'Amanda', 'Tatuí');

-- Criando a tabela Matriculas
CREATE TABLE Matriculas (
    cod INT PRIMARY KEY,
    valor DECIMAL(10, 2),
    data DATE,
    cod_aluno INT,
    FOREIGN KEY (cod_aluno) REFERENCES Alunos(cod)
);

INSERT INTO Matriculas (cod, valor, data, cod_aluno) VALUES
(1, 180.00, '2023-10-10', 1),
(2, 250.00, '2023-10-11', 2),
(3, 400.00, '2023-10-12', 1),
(4, 410.00, '2023-10-09', 3),
(5, 420.00, '2023-10-01', 4),
(6, 430.00, '2023-10-02', 5),
(7, 140.00, '2023-10-03', 6),
(8, 440.00, '2023-10-04', 7),
(9, 460.00, '2023-10-05', 8),
(10, 190.00, '2023-10-06', 9);



-- exercicio 2
select 
alunos.nome as nome_aluno,
alunos.cidade as cidade_aluno,
matriculas.valor as valor_matricula
from alunos
inner join matriculas
on alunos.cod = matriculas.cod_aluno;

-- exercicio 3
select
alunos.cod as cod_alunos,
alunos.nome as nome_aluno,
alunos.cidade as cidade_aluno,
matriculas.valor as valor_matricula
from alunos
left join matriculas
on alunos.cod = matriculas.cod_aluno;

-- exercicio 4
select
 matriculas.valor as valor_matricula,
 alunos.cidade as cidade_aluno,
 alunos.nome as nome_aluno
 from matriculas
 right join alunos 
 on alunos.cod = matriculas.cod_aluno;
 
 -- exercicio 5 
 select
alunos.cod as cod_alunos,
alunos.nome as nome_aluno,
alunos.cidade as cidade_aluno,
matriculas.valor as valor_matricula
from alunos
left join matriculas
on alunos.cod = matriculas.cod_aluno
where matriculas.cod is null;


-- exercicio 6
select 
matriculas.cod as cod_matriculas,
 matriculas.valor as valor_matricula,
 alunos.cidade as cidade_aluno,
 alunos.nome as nome_aluno
 from alunos
 right join matriculas
 on alunos.cod = matriculas.cod_aluno
 where matriculas.valor >200;

 -- exercicio 7 
 select 
 matriculas.cod as cod_matriculas,
 matriculas.valor as valor_matricula,
 alunos.cidade as cidade_aluno,
 alunos.nome as nome_aluno
 from alunos
 right join matriculas
 on alunos.cod = matriculas.cod_aluno
 where matriculas.data like '2023-10%';