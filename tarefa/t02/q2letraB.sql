CREATE FUNCTION calcular_media_idade_departamento() RETURNS TABLE (departamento TEXT, media_idade NUMERIC) AS $$
BEGIN
  RETURN QUERY
    SELECT d.descricao AS departamento, AVG(EXTRACT(YEAR FROM age(f.dataNasc))) AS media_idade
    FROM Funcionario f
    INNER JOIN Departamento d ON f.depto = d.codigo
    GROUP BY d.descricao;
END;

/* Para execultar: SELECT * FROM calcular_media_idade_departamento(); */
