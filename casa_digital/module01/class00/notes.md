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

## Sites para ajudar no estudo
https://www.w3schools.com/sql/                                                                                                  
https://www.codewars.com/dashboard - Fazer Exercícios de querys em SQL

