-- Start from scratch each time
DROP DATABASE IF EXISTS worker_db;
CREATE DATABASE worker_db;
\c worker_db;

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) UNIQUE NOT NULL,
    salary DECIMAL NOT NULL,
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INTEGER NOT NULL,
    manager_id INTEGER,
    FOREIGN KEY (role_id) REFERENCES roles(id),
    FOREIGN KEY (manager_id) REFERENCES employees(id)
);