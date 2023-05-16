CREATE FUNCTION calcular_quantidade_atividades_membro(cod_membro INT, cod_projeto INT) RETURNS INTEGER AS $$
DECLARE
  quantidade_atividades INTEGER;
BEGIN
  SELECT COUNT(*) INTO quantidade_atividades
  FROM AtividadeMembro am
  INNER JOIN AtividadeProjeto ap ON am.codAtividade = ap.codAtividade
  WHERE am.codMembro = cod_membro AND ap.codProjeto = cod_projeto;

  RETURN quantidade_atividades;
END;

/* Para teste: SELECT calcular_quantidade_atividades_membro(123, 456); */