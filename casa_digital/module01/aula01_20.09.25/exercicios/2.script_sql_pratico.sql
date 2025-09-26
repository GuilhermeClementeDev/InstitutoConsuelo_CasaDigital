/*
Script Sql
Tema : Gestão de Projetos
*/

CREATE TYPE STATUS as ENUM ('planning', 'in_progress', 'completed', 'canceled');

CREATE TABLE projects(
	project_id SERIAL PRIMARY KEY,
	project_name VARCHAR(40) NOT NULL,
	project_status STATUS NOT NULL DEFAULT 'planning',
	start_data DATE DEFAULT CURRENT_DATE,
	end_data DATE
);

CREATE TYPE ROLE as ENUM ('Tech Lead', 'Dev Junior', 'Dev Pleno', 'Dev Senior');

CREATE TABLE employees(
	employee_id SERIAL PRIMARY KEY,
	employee_name VARCHAR(100),
	employee_role ROLE NOT NULL,
	start_data DATE DEFAULT CURRENT_DATE,
	end_data DATE,
	employee_salary FLOAT NOT NULL
);

CREATE TABLE allocate_employees_project(
	allocate_id SERIAL PRIMARY KEY,
	employee_id INT REFERENCES employees(employee_id),
	project_id INT REFERENCES projects(project_id),
	allocate_data DATE DEFAULT CURRENT_DATE,
	allocate_end_data DATE
);

INSERT INTO projects (project_name, project_status, start_data, end_data)
VALUES
('Cub3d', 'in_progress', '2025-09-01', NULL),
('Minishell', 'completed', '2025-04-01', '2025-06-20'),
('So_long', 'completed', '2025-03-01', '2025-05-20'),
('Philosophers', 'completed', '2025-06-01', '2025-07-20'),
('NetPractice', 'planning', '2025-09-25', NULL);

INSERT INTO employees (employee_name, employee_role, start_data, end_data, employee_salary)
VALUES
('Luiz', 'Tech Lead', '2025-01-01', NULL, 12000),
('Guilherme', 'Dev Junior', '2025-02-15', NULL, 3000),
('Gabriel', 'Dev Pleno', '2023-03-01', '2025-09-01', 5000),
('Beatriz', 'Dev Senior', '2021-01-20', '2025-08-31', 10000),
('Juninho', 'Dev Junior', '2025-04-10', NULL, 3200);

INSERT INTO allocate_employees_project (employee_id, project_id, allocate_data, allocate_end_data)
VALUES
(1, 1, '2025-09-01', NULL),
(2, 1, '2025-09-01', NULL),
(2, 2, '2025-04-01', '2025-06-20'),
(3, 2, '2025-04-01', '2025-06-20'),
(3, 3, '2025-03-01', '2025-05-20'),
(4, 4, '2025-06-01', '2025-07-20'),
(5, 5, '2025-09-25', NULL);

-- Verificando todas as tabelas após criação
/*
SELECT *
FROM projects;
SELECT *
FROM employees;
SELECT *
FROM allocate_employees_project;
*/

-- 3 Consultas usando where
-- Buscando todos os projetos Distintos que ainda não foram finalizados
SELECT DISTINCT *
FROM projects
WHERE end_data IS NULL
OR project_status <> 'completed';
-- '<>' -> significa diferente

-- Busca todos os nomes e salarios dos funcionarios que são Junior ainda ativos
SELECT employee_name, employee_salary
FROM employees
WHERE employee_role = 'Dev Junior'
AND end_data IS NULL;

-- Buscar funcionarios que recebem mais de 5000 e estão ativos
SELECT *
FROM employees
WHERE employee_salary >= 5000
AND end_data IS NULL;

-- 1 Consulta usando ORDER BY
-- Buscando quem é mais antigo de casa
SELECT *
FROM employees
ORDER BY start_data;

-- 1 consulta com JOIN
-- Listar projetos concluídos com os funcionários que participaram.
SELECT p.project_name, p.project_status, e.employee_name, e.employee_role
FROM allocate_employees_project a
JOIN employees e ON a.employee_id = e.employee_id
JOIN projects p ON a.project_id = p.project_id;
