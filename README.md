# 📊 Análise Exploratória

**Atividade de Sala:** Prática Estatística II

**Conteúdo Principal:** Git, GitHub e RStudio

**Autor:** Pedro Augusto Menezes Rocha

------------------------------------------------------------------------

## 💻 1. Estrutura do Repositório

Este projeto está organizado para garantir a reprodutibilidade da análise, com a separação clara entre dados, scripts e resultados.

### 1.1. Dados e Dicionário

| Arquivo | Descrição |
|:---|:---|
| `Base_trabalho.xlsx` | O conjunto de dados principal utilizado na análise. |
| `dicionario_Base_trabalho.xlsx` | Arquivo contendo a descrição das variáveis presentes na base de dados. |

### 1.2. Scripts e Ambiente

| Arquivo | Descrição |
|:---|:---|
| `analise_exploratoria.R` | Script contendo o código R para a análise exploratória (transformação, medidas estatísticas, etc.). |
| `analise_grafica.R` | Script dedicado à geração dos gráficos e visualizações de dados. |
| `AnaliseExploratoria.Rproj` | Arquivo do projeto RStudio, garantindo o correto ambiente de trabalho. |
| `.gitignore` | Arquivo de configuração que especifica quais arquivos e pastas o Git deve ignorar. |

### 1.3. Resultados e Documentação

| Arquivo/Pasta | Descrição |
|:---|:---|
| `figures/` | Pasta que armazena todas as figuras (gráficos, boxplots, histogramas) geradas pelos scripts. |
| `README.md` | Documentação principal do projeto. |

------------------------------------------------------------------------

## 📈 2. Resultados Gráficos e Visualização

### 2.1. Gráficos Gerados

Os scripts foram utilizados para gerar as seguintes visualizações:

-   **Histograma da Idade**
-   **Boxplot do Tempo Preso**
-   **Boxplot do Score de Periculosidade por Escolaridade**
-   **Gráfico de Barras da Variável Reincidente**
-   **Gráfico de Dispersão** entre Tempo Preso e Score de Periculosidade

### 2.2. Interpretação dos Resultados

-   **Idade e Tempo Preso**: A população analisada é majoritariamente de adultos jovens/meia-idade (pico entre **25-55 anos**), e o tempo preso mediano é de aproximadamente **60 meses**.
-   **Reincidência**: A grande maioria da amostra é classificada como **Não Reincidente** (cerca de 80-90%).
-   **Correlação**: Existe uma **correlação positiva** entre o Tempo Preso e o Score de Periculosidade: indivíduos com maior tempo preso tendem a apresentar um score de periculosidade mais elevado.
-   **Escolaridade**: O nível de escolaridade (Fundamental, Médio, Superior) **não apresenta diferença significativa** na mediana do Score de Periculosidade.

------------------------------------------------------------------------

## 📚 3. Definições Estatísticas

As seguintes medidas de tendência central e dispersão foram utilizadas ou definidas na análise:

-   **Média:** Soma dos valores $(\sum x_i)$ dividida pelo número de observações $(n)$.
-   **Mediana:** O valor central da distribuição, que divide os dados em duas metades iguais (50%).
-   **1º e 3º Quartil (Q1 e Q3):** Valores que delimitam 25% e 75% dos dados, respectivamente.
-   **Variância:** Média dos quadrados dos desvios em relação à média ($\frac{\sum (x_i - \bar{x})^2}{n-1}$).
-   **Desvio Padrão:** Raiz quadrada da variância $(\sqrt{\text{Variância}})$.
-   **Amplitude:** Diferença entre o maior e o menor valor na distribuição $(\text{Máximo} - \text{Mínimo})$.
