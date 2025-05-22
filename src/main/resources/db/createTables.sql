-- Table: User
CREATE TABLE IF NOT EXISTS Users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TYPE problem_level AS ENUM ('ok', 'failure');

-- Table: Problems
CREATE TABLE IF NOT EXISTS Problems (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    level problem_level NOT NULL,
    test_cases JSONB NOT NULL
);

-- Table: Languages
CREATE TABLE IF NOT EXISTS Languages (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);


CREATE TYPE status AS ENUM ('ok', 'failure');


-- Table: Submissions
CREATE TABLE IF NOT EXISTS Submissions (
    id UUID PRIMARY KEY,
    problem_id INT NOT NULL,
    language_id INT NOT NULL,
    timestamp TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    code TEXT NOT NULL,
    status status,
    execution_time_ms INT,  -- in milliseconds
    memory_usage_kb INT,      -- in kilobytes
    error_message VARCHAR(255),

    CONSTRAINT fk_problem
        FOREIGN KEY (problem_id)
        REFERENCES Problems(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_language
        FOREIGN KEY (language_id)
        REFERENCES Languages(id)
        ON DELETE RESTRICT
);

-- Table: Language_Problems
CREATE TABLE IF NOT EXISTS "Language_Problems" (
    id SERIAL PRIMARY KEY,
    problem_id INT NOT NULL,
    language_id INT NOT NULL,
    code_template TEXT,
    time_limit FLOAT,

    CONSTRAINT fk_language_problem_problem
        FOREIGN KEY (problem_id)
        REFERENCES Problems(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_language_problem_language
        FOREIGN KEY (language_id)
        REFERENCES Languages(id)
        ON DELETE CASCADE,

    CONSTRAINT uq_language_problem UNIQUE (problem_id, language_id)
);


-- Table: Executors
CREATE TABLE IF NOT EXISTS Executors (
    id SERIAL PRIMARY KEY,
    language_id INT NOT NULL,
    name VARCHAR(100) NOT NULL UNIQUE,
    time_limit FLOAT NOT NULL,  -- in seconds, adjust type as needed

    CONSTRAINT fk_language_executor
        FOREIGN KEY (language_id)
        REFERENCES Languages(id)
        ON DELETE RESTRICT
);
