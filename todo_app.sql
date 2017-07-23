DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
CREATE DATABASE todo_app WITH OWNER michael;

\c todo_app;

CREATE TABLE tasks (

  id SERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NULL,
  completed BOOLEAN NOT NULL DEFAULT FALSE

);

\d tasks

ALTER TABLE tasks DROP COLUMN completed;

SELECT * FROM tasks;

ALTER TABLE tasks ADD COLUMN completed_at TIMESTAMP DEFAULT NULL;

SELECT * FROM tasks;

ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();


\d tasks

\c dorybaga