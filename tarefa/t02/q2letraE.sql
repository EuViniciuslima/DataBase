CREATE FUNCTION calcular_atraso_projeto(cod_projeto INT) RETURNS INTEGER AS $$
DECLARE
  data_fim_projeto DATE;
  data_conclusao_projeto DATE;
  atraso INTEGER;
BEGIN
  SELECT dataFim, dataConclusao INTO data_fim_projeto, data_conclusao_projeto
  FROM Projeto
  WHERE codigo = cod_projeto;

  IF data_conclusao_projeto IS NULL THEN
    atraso := EXTRACT(DAY FROM current_date - data_fim_projeto);
  ELSE
    atraso := EXTRACT(DAY FROM data_conclusao_projeto - data_fim_projeto);
  END IF;

  RETURN atraso;
END;

/* Para teste: SELECT calcular_atraso_projeto(456); */