#############################################
# analise_exploratoria.R
# Script único para a atividade: leitura, limpeza,
# análises gráficas e medidas descritivas.
# Autor: Pedro Augusto
# Data: 09/11/2025
#############################################

# 0) Instalar pacotes (descomente a primeira vez)
# install.packages(c("readxl","dplyr","ggplot2","here"))

library(readxl)
library(dplyr)
library(ggplot2)
library(here)

#importar base
dados = read_xlsx("Base_trabalho.xlsx")

# Transformar variáveis categóricas em fatores
dados <- dados %>%
  mutate(
    sexo = factor(sexo, labels = c("Feminino", "Masculino")),
    filhos = factor(filhos, labels = c("Não", "Sim")),
    casado = factor(casado, labels = c("Não", "Sim")),
    escolaridade = factor(escolaridade, 
                          labels = c("Fundamental", "Médio", "Superior")),
    reincidente = factor(reincidente, labels = c("Não", "Sim"))
  )

# Criar pasta de figuras
if(!dir.exists("figures")) dir.create("figures")

# Análise de dados faltantes
colSums(is.na(dados))

# Histograma da idade
p1 <- ggplot(dados, aes(x = idade)) +
  geom_histogram(binwidth = 5, fill = "steelblue", color = "black") +
  labs(title = "Histograma da Idade", x = "Idade (anos)", y = "Frequência")
ggsave("figures/histograma_idade.png", p1)
ggsave("figures/histograma_idade.pdf", p1)

# Boxplot do tempo preso
p2 <- ggplot(dados, aes(y = tempo_preso)) +
  geom_boxplot(fill = "orange") +
  labs(title = "Boxplot do Tempo Preso", y = "Tempo preso (meses)")
ggsave("figures/boxplot_tempo_preso.png", p2)
ggsave("figures/boxplot_tempo_preso.pdf", p2)

# Boxplot do score_periculosidade por escolaridade
p3 <- ggplot(dados, aes(x = escolaridade, y = score_periculosidade)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Score de Periculosidade por Escolaridade",
       x = "Escolaridade", y = "Score de periculosidade")
ggsave("figures/boxplot_score_por_escolaridade.png", p3)
ggsave("figures/boxplot_score_por_escolaridade.pdf", p3)

# Gráfico de barras da variável reincidente
p4 <- ggplot(dados, aes(x = reincidente)) +
  geom_bar(fill = "purple") +
  labs(title = "Distribuição de Reincidentes",
       x = "Reincidente", y = "Frequência")
ggsave("figures/grafico_reincidente.png", p4)
ggsave("figures/grafico_reincidente.pdf", p4)
