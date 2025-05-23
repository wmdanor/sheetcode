CREATE TYPE status AS ENUM ('ok', 'failure');
CREATE TYPE problem_level AS ENUM ('easy', 'medium', 'hard');


-- Table: Languages (reference table)
CREATE TABLE IF NOT EXISTS ref_languages (
    language_code VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Table: User
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Table: Problems,
CREATE TABLE IF NOT EXISTS problems (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(100) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    level problem_level NOT NULL,
    test_cases JSONB NOT NULL,
    created_on TIMESTAMPTZ(0) DEFAULT CURRENT_TIMESTAMP
);

-- Table: Language_Problems
CREATE TABLE IF NOT EXISTS language_problems (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    problem_id UUID NOT NULL,
    language_code VARCHAR(50) NOT NULL,
    code_template TEXT NOT NULL,
    time_limit_ms BIGINT NOT NULL,

    CONSTRAINT fk_language_problem_problem
        FOREIGN KEY (problem_id)
        REFERENCES problems(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_language_problem_language
        FOREIGN KEY (language_code)
        REFERENCES ref_languages(language_code)
        ON DELETE RESTRICT,

    CONSTRAINT uq_language_problem UNIQUE (problem_id, language_code)
);

-- Table: Submissions
CREATE TABLE IF NOT EXISTS submissions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    problem_id UUID NOT NULL,
    language_code VARCHAR(50) NOT NULL,
    user_id UUID NOT NULL,
    code TEXT NOT NULL,
    status status NOT NULL,
    execution_time_ms BIGINT,  -- in milliseconds
    memory_usage_kb BIGINT,      -- in kilobytes
    error_message VARCHAR(1000),
    submitted_on TIMESTAMPTZ(0) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_submission_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_problem
        FOREIGN KEY (problem_id)
        REFERENCES problems(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_language
        FOREIGN KEY (language_code)
        REFERENCES ref_languages(language_code)
        ON DELETE RESTRICT
);

-- Table: Executors
CREATE TABLE IF NOT EXISTS executors (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    language_code VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL UNIQUE,
    time_limit_ms BIGINT NOT NULL,  -- in ms

    CONSTRAINT fk_language_executor
        FOREIGN KEY (language_code)
        REFERENCES ref_languages(language_code)
        ON DELETE RESTRICT
);

-- Indexes for foreign keys
CREATE INDEX idx_submissions_problem_id ON submissions(problem_id);
CREATE INDEX idx_submissions_language_code ON submissions(language_code);
CREATE INDEX idx_language_problems_problem_id ON language_problems(problem_id);
CREATE INDEX idx_language_problems_language_code ON language_problems(language_code);
CREATE INDEX idx_executors_language_code ON executors(language_code);
