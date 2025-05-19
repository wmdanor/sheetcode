-- Table: User
CREATE TABLE "Users" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Table: Problems
CREATE TABLE Problems (
    problem_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    level VARCHAR(20), -- Optional: could be ENUM or an INT
    test_cases JSONB NOT NULL
);

-- Table: Languages
CREATE TABLE Languages (
    language_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Table: Submissions
CREATE TABLE Submissions (
    id SERIAL PRIMARY KEY,
    problem_id INT NOT NULL,
    language_id INT NOT NULL,
    timestamp TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    code TEXT NOT NULL,
    status VARCHAR(10) CHECK (status IN ('ok', 'failure')),
    execution_time FLOAT,  -- in seconds
    memory_usage INT,      -- in kilobytes
    error_message TEXT,

    CONSTRAINT fk_problem
        FOREIGN KEY (problem_id)
        REFERENCES Problems(problem_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_language
        FOREIGN KEY (language_id)
        REFERENCES Languages(language_id)
        ON DELETE RESTRICT
);

-- Table: Executors
CREATE TABLE Executors (
    executor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    language_id INT NOT NULL,
    time_limit FLOAT NOT NULL,  -- in seconds, adjust type as needed

    CONSTRAINT fk_language_executor
        FOREIGN KEY (language_id)
        REFERENCES Languages(language_id)
        ON DELETE RESTRICT
);
