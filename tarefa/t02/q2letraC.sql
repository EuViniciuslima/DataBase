CREATE OR REPLACE PROCEDURE exibir_funcionarios_acima_media_idade()
LANGUAGE plpgsql
AS $$
DECLARE
  media_idade NUMERIC;
BEGIN
  SELECT AVG(EXTRACT(YEAR FROM age(f.dataNasc)))
  INTO media_idade
  FROM Funcionario f
  INNER JOIN Departamento d ON f.depto = d.codigo;
  
  RAISE NOTICE 'Média de idade do departamento: %', media_idade;
  
  FOR funcionario IN
    SELECT f.*
    FROM Funcionario f
    INNER JOIN Departamento d ON f.depto = d.codigo
    WHERE EXTRACT(YEAR FROM age(f.dataNasc)) > media_idade
  LOOP
    RAISE NOTICE 'Código: %, Nome: %, Idade: %', funcionario.codigo, funcionario.nome, EXTRACT(YEAR FROM age(funcionario.dataNasc));
  END LOOP;
END;
$$;



/* Para testar: CALL exibir_funcionarios_acima_media_idade(); */