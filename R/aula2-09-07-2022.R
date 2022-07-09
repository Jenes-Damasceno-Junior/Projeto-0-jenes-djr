#FUNÇÕES

# MUTATE
# Criar nova coluna com a combinação de valores de outras colunas;
#SELECT
# Selecionar COLUNAS a partir dos nomes (pode renomear tmb);
#FILTER
#Utiliza criterios para valores em LINHAS;
#ARANGE
#Reordena as observações


#ATIVIDADE DE EXEMPLO
## OBJETIVO: Calcular a média das notas dos alunos de farmácia do RS.
# 1. Importar microdados do enad
#1.1 - import from text base
#2. Filtrar os alunos de fármacia do RS (planilha e informações de importação no site enad)
#2.1 Importação via RStudio (Importa Dataset -> From Text)
#2.2 CO_GRUPO ==19 CO_UF_CURSO == 43
#2.3 farmacia_RS = filter(microdados2019_arq1, CO_GRUPO ==19 & CO_UF_CURSO == 43)
#3. Filtrar as observações do arquivo com as notas a partir da base de dados filtrada na etapa2
#3.1 farmacia_RS_arquivo3 = semi_join(microdados2019_arq3, farmacia_RS, by = "CO_CURSO)
#4. Filtar os alunos que responderam a prova
#farmacia_RS_arquivo3_presentes = filter(farmacia_RS_arquivo3, TP_PR_GER == 555)
#5. Calcular média das notas
#nota_media_farmacia_RS = summarise(farmacia_RS_arquivo3_presentes, mean(NT_GER))

#ATIVIDADE DO ALUNO
#Calcular a média das notas do enad dos concluintes do curso de nutrição
# do RS que responderam a prova.