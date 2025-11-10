
library(readxl)
library(dplyr)
library(ggplot2)

# Importar base e ajustar fatores
dados <- read_excel("Base_trabalho.xlsx") %>%
  mutate(
    sexo = factor(sexo, labels = c("Feminino", "Masculino")),
    filhos = factor(filhos, labels = c("Não", "Sim")),
    casado = factor(casado, labels = c("Não", "Sim")),
    escolaridade = factor(escolaridade, 
                          labels = c("Fundamental", "Médio", "Superior")),
    reincidente = factor(reincidente, labels = c("Não", "Sim"))
  )

# Estatísticas descritivas
variaveis <- c("score_periculosidade", "idade", "tempo_preso")

estatisticas <- dados %>%
  summarise(
    across(all_of(variaveis), list(
      media = ~mean(., na.rm = TRUE),
      q1 = ~quantile(., 0.25, na.rm = TRUE),
      mediana = ~median(., na.rm = TRUE),
      q3 = ~quantile(., 0.75, na.rm = TRUE),
      variancia = ~var(., na.rm = TRUE),
      desvio_padrao = ~sd(., na.rm = TRUE),
      amplitude = ~(max(., na.rm = TRUE) - min(., na.rm = TRUE))
    ), .names = "{.col}_{.fn}")
  )

print(estatisticas)

# Gráfico de dispersão entre tempo_preso e score_periculosidade
if(!dir.exists("figures")) dir.create("figures")

p5 <- ggplot(dados, aes(x = tempo_preso, y = score_periculosidade)) +
  geom_point(color = "darkred") +
  geom_smooth(method = "lm", se = TRUE, color = "black") +
  labs(title = "Dispersão: Tempo Preso x Score de Periculosidade",
       x = "Tempo preso (meses)", y = "Score de periculosidade")
ggsave("figures/dispersao_tempo_score.png", p5)
ggsave("figures/dispersao_tempo_score.pdf", p5)

# Correlação
correlacao <- cor(dados$tempo_preso, dados$score_periculosidade)
cat("Correlação entre tempo_preso e score_periculosidade:", round(correlacao, 3), "\n")

# Variância, desvio padrão e amplitude (já calculados acima)
