CREATE VIEW funcionarios_por_departamento AS
SELECT d.codigo, COUNT(f.codigo) AS num_funcionarios
FROM departamento d
LEFT JOIN funcionario f ON d.codigo = f.cod_depto
GROUP BY d.codigo;

SELECT d.descricao AS nome_departamento, g.nome AS nome_gerente, COALESCE(fp.num_funcionarios, 0) AS num_funcionarios
FROM departamento d
LEFT JOIN funcionario g ON d.cod_gerente = g.codigo
LEFT JOIN funcionarios_por_departamento fp ON d.codigo = fp.codigo
ORDER BY d.codigo;
