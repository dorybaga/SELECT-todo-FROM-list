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

INSERT INTO tasks VALUES
(DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

SELECT * FROM tasks;

INSERT INTO tasks (title, description) VALUES ('Study PostgreSQL', 'Read all the docs');

SELECT * FROM tasks;

SELECT title FROM tasks WHERE completed_at IS NULL;
UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';

SELECT * FROM tasks;

SELECT title, description FROM tasks WHERE completed_at IS NULL;
SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description) VALUES ('mistake 1', 'a test entry');
INSERT INTO tasks (title, description) VALUES ('mistake 2', 'a test entry');
INSERT INTO tasks (title, description) VALUES ('mistake 3', 'a test entry');

SELECT * FROM tasks;



\c dorybaga