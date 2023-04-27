-- Criando a view para totalizar o número de funcionários em cada departamento
CREATE VIEW total_funcionarios AS 
SELECT cod_depto, COUNT(*) AS num_funcionarios 
FROM funcionario 
GROUP BY cod_depto;

-- Consulta para selecionar o nome do departamento, o nome do gerente e o número de funcionários de cada departamento
SELECT departamento.descricao AS nome_departamento, 
       COALESCE(funcionario.nome, 'Sem Gerente') AS nome_gerente, 
       COALESCE(total_funcionarios.num_funcionarios, 0) AS num_funcionarios
FROM departamento 
LEFT JOIN funcionario ON departamento.cod_gerente = funcionario.codigo 
LEFT JOIN total_funcionarios ON departamento.codigo = total_funcionarios.cod_depto;
