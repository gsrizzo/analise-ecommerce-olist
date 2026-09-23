# Análise de Dados - E-commerce Olist

## Sobre o projeto

Projeto de análise de dados desenvolvido a partir do dataset público da Olist, com o objetivo de explorar dados de um e-commerce, identificar padrões e gerar insights relacionados a vendas, produtos, pagamentos, avaliações e entregas.

O projeto está sendo desenvolvido de forma incremental, passando pelas etapas de exploração, tratamento, análise, consultas em SQL e visualização dos dados.

## Objetivos

- Explorar e compreender os datasets utilizados.
- Avaliar a qualidade dos dados.
- Realizar o tratamento e preparação dos dados.
- Analisar indicadores relacionados ao e-commerce.
- Utilizar Python e Pandas para análise e tratamento.
- Utilizar SQL para consultas e análises.
- Desenvolver visualizações com Matplotlib.
- Criar um dashboard no Power BI.
- Gerar insights relevantes para o negócio.

## Tecnologias utilizadas

- Python
- Pandas
- Matplotlib
- SQL
- Power BI
- Jupyter Notebook
- Git e GitHub

## Estrutura do projeto

```text
analise-ecommerce-olist/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── images/
│   ├── avaliacoes_clientes.png
│   ├── evolucao_vendas_mensais.png
│   ├── nota_media_entrega.png
│   ├── pagamentos_mais_utilizados.png
│   ├── top10_categorias_qtd_itens.png
│   └── top10_categorias_valor_vendido.png
│
├── notebooks/
│   ├── 01_exploracao_inicial.ipynb
│   ├── 02_tratamento_dados.ipynb
│   └── 03_analise_exploratoria.ipynb
│
├── powerbi/
│   └── dashboard_olist.pbix
│
├── sql/
│   └── consultas.sql
│
└── README.md
```

## Dados

Os dados utilizados no projeto estão organizados em duas etapas:

- `data/raw/`: datasets originais da Olist, sem alterações;
- `data/processed/`: datasets gerados após o processo de tratamento e preparação dos dados.

### Tratamento realizado

Durante a etapa de tratamento e preparação dos dados foram realizadas:

- conversão das colunas de data para `datetime`;
- análise e tratamento dos valores ausentes;
- investigação de inconsistências nos dados;
- correção de registros com quantidade de parcelas igual a zero;
- análise de inconsistências entre as datas dos pedidos;
- padronização da nomenclatura de colunas;
- validação dos dados após o tratamento;
- geração dos datasets tratados em `data/processed`.

### Análise exploratória

A análise exploratória foi orientada por perguntas de negócio relacionadas ao desempenho do e-commerce. Foram analisados:

- valor total vendido em produtos;
- quantidade de pedidos entregues e ticket médio;
- evolução mensal das vendas;
- categorias com maior valor vendido;
- categorias com maior quantidade de itens vendidos;
- formas de pagamento mais utilizadas;
- distribuição das avaliações dos clientes;
- relação entre atraso na entrega e avaliação dos clientes.

#### Principais resultados

- aproximadamente **R$ 13,22 milhões** em produtos vendidos, considerando pedidos entregues;
- **96.478 pedidos entregues**, com ticket médio de aproximadamente **R$ 137,04**;
- destaque para as categorias **beleza_saude**, **relogios_presentes** e **cama_mesa_banho** em valor vendido;
- predominância do **cartão de crédito** como forma de pagamento;
- pedidos entregues no prazo apresentaram avaliação média de aproximadamente **4,29**, enquanto pedidos atrasados apresentaram média de **2,57**.

#### Evolução das vendas mensais

![Evolução das vendas mensais](images/evolucao_vendas_mensais.png)

#### Categorias com maior valor vendido

![Categorias com maior valor vendido](images/top10_categorias_valor_vendido.png)

#### Relação entre prazo de entrega e avaliação

![Nota média por situação da entrega](images/nota_media_entrega.png)

### Análises SQL

Após a análise exploratória em Python, os dados tratados foram importados para o SQL Server para realização de consultas analíticas.

Foram desenvolvidas as seguintes análises:

1. Valor vendido por estado;
2. Ticket médio por estado;
3. Categorias com maior valor vendido por estado;
4. Prazo médio de entrega por estado;
5. Identificação de clientes recorrentes.

As consultas completas estão disponíveis em [`sql/consultas.sql`](sql/consultas.sql).

### Dashboard Power BI

Após as análises em Python e SQL, foi desenvolvido um dashboard no Power BI para consolidar os principais indicadores do e-commerce.

O dashboard apresenta:

- valor total vendido;
- quantidade de pedidos entregues;
- ticket médio;
- evolução mensal das vendas;
- estados com maior valor vendido;
- categorias com maior valor vendido;
- comparação da nota média entre pedidos entregues no prazo e atrasados;
- filtro interativo por ano.

O arquivo do dashboard está disponível em [`powerbi/dashboard_olist.pbix`](powerbi/dashboard_olist.pbix).

## Conclusões

A análise dos dados da Olist permitiu identificar padrões relevantes relacionados ao desempenho de vendas, perfil dos pedidos e experiência dos clientes.

Entre os principais pontos observados:

- as vendas apresentaram crescimento ao longo de 2017, com destaque para o pico registrado em novembro;
- as categorias Beleza e Saúde, Relógios e Presentes e Cama, Mesa e Banho estiveram entre as principais em valor vendido;
- São Paulo concentrou o maior valor vendido entre os estados;
- o cartão de crédito foi a forma de pagamento mais utilizada;
- pedidos entregues no prazo apresentaram nota média de **4,29**, enquanto pedidos atrasados tiveram média de **2,57**, indicando uma associação relevante entre o cumprimento do prazo de entrega e a satisfação dos clientes.

O projeto integrou Python, SQL e Power BI em diferentes etapas do processo de análise, desde a preparação dos dados até a construção de consultas e visualizações para apresentação dos resultados.

## Como executar

```bash
git clone https://github.com/gsrizzo/analise-ecommerce-olist.git

cd analise-ecommerce-olist

jupyter notebook
```

## Autor

Gabriel Rizzo — [LinkedIn](https://www.linkedin.com/in/gabrielrizzo97) — [GitHub](https://github.com/gsrizzo)