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

-- Populando projetos
INSERT INTO projects (project_name, project_status)
VALUES ('Cub3d', 'in_progress');
INSERT INTO projects (project_name, project_status, start_data, end_data)
VALUES ('Minishell', 'completed', '2025-04-01', '2025-06-20');
INSERT INTO projects (project_name, project_status, start_data, end_data)
VALUES ('So_long', 'completed', '2025-03-01', '2025-05-20');
INSERT INTO projects (project_name, project_status, start_data, end_data)
VALUES ('Philosophers','completed', '2025-06-01', '2025-07-20');
INSERT INTO projects (project_name)
VALUES ('NetPractice');


SELECT *
FROM projects;
