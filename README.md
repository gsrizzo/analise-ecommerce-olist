# Análise de Dados - E-commerce Olist

## Sobre o projeto

Projeto de análise de dados desenvolvido a partir do dataset público da Olist, com o objetivo de explorar dados de um e-commerce, identificar padrões e gerar insights relacionados a vendas, clientes, produtos, pagamentos e avaliações.

O projeto está sendo desenvolvido de forma incremental, passando pelas etapas de exploração, tratamento, análise e visualização dos dados.

## Objetivos

- Explorar e compreender os datasets utilizados.
- Avaliar a qualidade dos dados.
- Realizar o tratamento e preparação dos dados.
- Analisar indicadores relacionados ao e-commerce.
- Utilizar Python, Pandas e NumPy para análise e tratamento.
- Utilizar SQL para consultas e análises.
- Desenvolver visualizações com Matplotlib.
- Criar um dashboard no Power BI.
- Gerar insights relevantes para o negócio.

## Tecnologias utilizadas

- Python
- Pandas
- NumPy
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
├── notebooks/
│   ├── 01_exploracao_inicial.ipynb
│   ├── 02_tratamento_dados.ipynb
│   └── 03_analise_exploratoria.ipynb
│
├── powerbi/
├── sql/
└── README.md
```

## Dados

Os dados utilizados no projeto estão organizados em duas etapas:

- `data/raw/`: datasets originais da Olist, sem alterações;
- `data/processed/`: datasets gerados após o processo de tratamento e preparação dos dados.

## Status do projeto

- [x] Exploração inicial dos dados
- [x] Tratamento e preparação dos dados
- [ ] Análise exploratória e visualizações
- [ ] Consultas e modelagem em SQL
- [ ] Dashboard em Power BI
- [ ] Conclusões e insights finais

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

## Como executar

```bash
git clone https://github.com/gsrizzo/analise-ecommerce-olist.git
cd analise-ecommerce-olist
jupyter notebook
```

## Autor

Gabriel Rizzo — [Linkedin](https://www.linkedin.com/in/gabrielrizzo97) — [GitHub](https://github.com/gsrizzo)