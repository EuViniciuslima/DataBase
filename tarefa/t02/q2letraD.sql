CREATE FUNCTION calcular_atraso_atividade(cod_atividade INT) RETURNS INTEGER AS $$
DECLARE
  data_fim_atividade DATE;
  data_conclusao_atividade DATE;
  atraso INTEGER;
BEGIN
  SELECT dataFim, dataConclusao INTO data_fim_atividade, data_conclusao_atividade
  FROM Atividade
  WHERE codigo = cod_atividade;

  IF data_conclusao_atividade IS NULL THEN
    atraso := EXTRACT(DAY FROM current_date - data_fim_atividade);
  ELSE
    atraso := EXTRACT(DAY FROM data_conclusao_atividade - data_fim_atividade);
  END IF;

  RETURN atraso;
END;

/* Para testar: SELECT calcular_atraso_atividade(123); */