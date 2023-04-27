SELECT funcionario.nome, funcionario.salario, departamento.descricao 
FROM funcionario 
JOIN departamento ON funcionario.cod_depto = departamento.codigo 
WHERE departamento.cod_gerente IS NULL 
ORDER BY departamento.codigo;
