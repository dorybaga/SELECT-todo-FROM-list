DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
CREATE DATABASE todo_app WITH OWNER michael;

\c todo_app;

CREATE TABLE tasks (

  id SERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT NULL,
  created_at TIMESTAMP without time zone NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP without time zone NULL,
  completed BOOLEAN NOT NULL DEFAULT FALSE

);
