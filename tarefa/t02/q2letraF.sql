CREATE OR REPLACE PROCEDURE exibir_equipe_projeto(cod_projeto INT)
LANGUAGE plpgsql
AS $$
BEGIN
  FOR equipe IN
    SELECT f.nome, d.sigla
    FROM Funcionario f
    INNER JOIN Membro m ON f.codigo = m.codFuncionario
    INNER JOIN Equipe e ON m.codEquipe = e.codigo
    INNER JOIN Projeto p ON e.codigo = p.equipe
    INNER JOIN Departamento d ON p.depto = d.codigo
    WHERE p.codigo = cod_projeto
  LOOP
    RAISE NOTICE 'Nome do Funcionário: %, Sigla do Departamento: %', equipe.nome, equipe.sigla;
  END LOOP;
END;
$$;

/* Para teste: CALL exibir_equipe_projeto(789); */