CREATE FUNCTION calcular_porcentagem_atividades_membro(cod_membro INT, cod_projeto INT) RETURNS DECIMAL AS $$
DECLARE
  quantidade_total_atividades INTEGER;
  quantidade_atividades_membro INTEGER;
  porcentagem DECIMAL;
BEGIN
  SELECT COUNT(*) INTO quantidade_total_atividades
  FROM AtividadeProjeto
  WHERE codProjeto = cod_projeto;

  SELECT COUNT(*) INTO quantidade_atividades_membro
  FROM AtividadeMembro am
  INNER JOIN AtividadeProjeto ap ON am.codAtividade = ap.codAtividade
  WHERE am.codMembro = cod_membro AND ap.codProjeto = cod_projeto;

  IF quantidade_total_atividades > 0 THEN
    porcentagem := (quantidade_atividades_membro::DECIMAL / quantidade_total_atividades) * 100;
  ELSE
    porcentagem := 0;
  END IF;

  RETURN porcentagem;
END;

/* Para teste: SELECT calcular_porcentagem_atividades_membro(123, 456); */
