CREATE TABLE project (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    git_link VARCHAR(200)
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    password TEXT NOT NULL
);

CREATE TABLE state (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE orders(
    id SERIAL PRIMARY KEY, 
    name VARCHAR(20) NOT NULL
);

CREATE TABLE domain(
    id SERIAL PRIMARY KEY, 
    name VARCHAR(20) NOT NULL
);

CREATE TABLE type (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(20) NOT NULL
);

CREATE TABLE task (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(100) NOT NULL,
    begin_at TIMESTAMP, 
    end_at TIMESTAMP,
    state_id INTEGER REFERENCES state(id),
    user_id INTEGER REFERENCES users(id) NOT NULL,
    project_id INTEGER REFERENCES project(id) NOT NULL
);
ALTER TABLE task ADD COLUMN order_id INTEGER REFERENCES orders(id);
ALTER TABLE task ADD COLUMN domain_id INTEGER REFERENCES domain(id);
ALTER TABLE task ADD COLUMN type_id INTEGER REFERENCES type(id);
ALTER TABLE task ADD COLUMN date_mep TIMESTAMP;
ALTER TABLE task ADD COLUMN date_mepp TIMESTAMP;


CREATE TABLE subtask (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(200) NOT NULL,
    begin_at TIMESTAMP,
    end_id TIMESTAMP,
    task_id INTEGER REFERENCES task(id),
    state_id INTEGER REFERENCES state(id)
);