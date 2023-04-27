CREATE TABLE atividade 
SELECT funcionario.nome 
FROM funcionario 
WHERE funcionario.salario > (
    SELECT MAX(funcionario.salario) 
    FROM funcionario 
    JOIN departamento ON funcionario.cod_depto = departamento.codigo 
    WHERE departamento.codigo = 2
);

