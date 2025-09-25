## Primeiros Passos no SQL (20/09/25)

### Conteúdo Abordado

- Introdução a bancos relacionais e PostgreSQL
- Conceitos de tabelas, registros, chaves primárias e estrangeiras
- Comandos DDL e DML: CREATE, INSERT, SELECT, UPDATE, DELETE
- Filtros e ordenação com WHERE e ORDER BY
- Uso de JOINs simples

### Minhas Anotações/Pesquisas

#### Conceitos Iniciais

- **SGBD**: É um sistema que gerencia um banco de dados, permitindo a capacidade de manipular os dados do banco de maneira segura e organizada.
- **Banco de Dados**: Qualquer repositório de informações com capacidade de adicionar, armazenar e organizar dados.
- **Modelo Relacional**: É o mais popular porém não é o mais flexível. Contudo, para as aplicações em gerais, é o mais utilizado.
- **SQL**: Linguagem utilizada para manipular dados.

#### Estrutura Fundamental

- **Tabela**: Conjunto de Dados(como uma planilha).
- **Registro / Linha**: Uma linha dentro da tabela contendo dados.
- **Campo / Coluna**: Uma categoria de informação.
- **Casos de uso**: ERPs, bancos, e-commerces.

#### Índices

- Estruturas auxiliares que agilizam buscas em tabelas grandes.

#### Tipos de Dados Essenciais

- `VARCHAR(n)`: Texto com limite de caracteres
- `INTEGER`: Números inteiros
- `DATE`: Datas
- `BOOLEAN`: Verdadeiro/Falso
- `SERIAL`: Números sequenciais automáticos (ex.: IDs)

#### Restrições (Constraints)

- `NOT NULL`: Campo obrigatório
- `UNIQUE`: Valor único na coluna
- `CHECK`: Define uma regra para os valores
- `PRIMARY KEY`: Identificador único de um registro.
- `FOREIGN KEY`: Responsável pela ligação entre tabelas.

### DDL (Data Definition Language)

Comandos para **definir e estruturar** o banco de dados.

#### Criar Tabela
```sql
CREATE TABLE alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INTEGER CHECK (idade >= 0),
    email VARCHAR(150) UNIQUE,
    data_cadastro DATE DEFAULT CURRENT_DATE
);
```
#### Modificar Tabelas
```sql
ALTER TABLE alunos ADD COLUMN telefone VARCHAR(15);
```
#### Remover Tabela
```sql
DROP TABLE alunos;
````
### DML (Data Manipulation Language)

Comandos para manipular os dados do banco. Relaciona-se diretamente com o CRUD:

- C (Create) → INSERT (post)
```sql
INSERT INTO alunos (nome, idade, email) values ('João Silva', 20, 'joao@gmail.com');
```
- R (Read) → SELECT (get)
```sql
SELECT * from alunos;
```
- U (Update) → UPDATE(put(atualiza tudo)e patch)
```sql
UPDATE alunos SET idade = 21 WHERE nome = 'João Silva';
```
- D (Delete) → DELETE (delete)
```sql
DELETE FROM alunos WHERE idade < 18
```
## Pesquisa sobre principais SGDBS

Principais SGBDs Relacionais

1- PostgreSQL
- Principais características: Open-source, muito robusto, segue rigorosamente o padrão SQL.
- Casos de uso típicos: Sistemas corporativos complexos, aplicativos financeiros, geolocalização, analytics e aplicações que precisam de integridade e escalabilidade.
- Vantagens: Gratuito, altamente extensível, forte consistência e confiabilidade, ótimo suporte a dados complexos.
- Desvantagens: Curva de aprendizado mais alta que MySQL, desempenho de leitura simples pode ser um pouco mais lento que MySQL em casos básicos.

2- MySQL
- Características: Open-source, popular, simples de instalar e usar. Suporta SQL padrão e é muito utilizado em aplicações web.
- Casos de uso: WordPress, e-commerces, startups e sistemas web em geral.
- Vantagens: Gratuito (há versão paga no MySQL Enterprise), grande comunidade, fácil integração com PHP e frameworks web.
- Desvantagens: Nem sempre segue o padrão SQL fielmente, recursos avançados de consistência e escalabilidade são mais limitados que no PostgreSQL.

3- Oracle Database
- Características: SGBD proprietário da Oracle, extremamente robusto, voltado para grandes corporações. Tem recursos avançados de replicação, segurança, particionamento e análise.
- Casos de uso: Bancos, telecomunicações, sistemas de missão crítica onde falha não é aceitável.
- Vantagens: Altíssimo desempenho, confiabilidade, suporte a Big Data, integração com soluções Oracle.
- Desvantagens: Custo de licença muito elevado, maior complexidade de administração.

4- SQL Server (Microsoft)
- Características: SGBD proprietário da Microsoft, bem integrado ao ecossistema Windows e Azure. Suporta T-SQL (Transact-SQL), que é uma extensão do SQL.
- Casos de uso: Empresas que já usam Microsoft (ERP, BI, Azure, .NET).
- Vantagens: Integração com ferramentas de análise (Power BI, Excel), bom suporte, interface gráfica amigável (SSMS).
- Desvantagens: Licenciamento pago, menos flexível em sistemas Linux, dependência do ecossistema Microsoft.

5- SQLite
- Características: SGBD leve, que não roda como servidor, mas como biblioteca embutida dentro da aplicação.
- Casos de uso: Aplicativos mobile, IoT, sistemas pequenos que não precisam de servidor de banco.
- Vantagens: Extremamente leve, zero configuração, roda em qualquer lugar, ideal para protótipos.
- Desvantagens: Não é feito para grandes cargas de dados, não suporta múltiplos usuários concorrentes em escala.

## Como rodar o PostgreSQL na WSL
```sql
sudo service postgresql start
sudo service postgresql status
psql -U ($USER) -d teste
\i './2.sript_sql_pratico.sql'
```
- service postgresql start → inicia o servidor PostgreSQL.
- service postgresql status → verifica se está online.

- psql → abre o cliente interativo do PostgreSQL.
- -U ($USER) → indica o usuário do PostgreSQL.
- -d teste → indica o banco de dados que você quer usar.
	- Caso não tenha bdd criado
	```sql
		createdb -U ($USER) teste
	```
- \i → significa “input file”, ou seja, ler comandos SQL do arquivo.

## Como apagar as tabelas
```sql
	DROP SCHEMA public CASCADE;
	CREATE SCHEMA public;
	-- ou no bash
	dropdb -U ($USER) teste
	createdb -U ($USER) teste
```
- CASCADE → deleta todas as tabelas, views e constraints dentro do schema.
- CREATE SCHEMA public → recria o schema vazio.
ou
- Derruba e recria o banco inteiro, limpando todas as tabelas e dados.

## Sites para ajudar no estudo
https://www.w3schools.com/sql/
https://www.hackerrank.com/domains/sql - Fazer Exercícios de querys em SQL

