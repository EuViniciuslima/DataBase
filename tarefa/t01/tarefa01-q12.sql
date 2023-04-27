SELECT p.nome AS nome_projeto, p.data_inicio, p.data_fim, a.descricao AS descricao_atividade, a.data_inicio AS data_inicio_atividade, a.data_fim AS data_fim_atividade
FROM projeto p
JOIN atividade_projeto ap ON p.codigo = ap.cod_projeto
JOIN atividade a ON ap.cod_atividade = a.codigo;
