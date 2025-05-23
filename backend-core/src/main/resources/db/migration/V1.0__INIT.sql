CREATE TYPE status AS ENUM ('ok', 'failure');
CREATE TYPE problem_level AS ENUM ('easy', 'medium', 'hard');


-- Table: Languages (reference table)
CREATE TABLE IF NOT EXISTS ref_languages (
    id UUID PRIMARY KEY,
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
    language_id UUID NOT NULL,
    code_template TEXT NOT NULL,
    time_limit INTERVAL NOT NULL,

    CONSTRAINT fk_language_problem_problem
        FOREIGN KEY (problem_id)
        REFERENCES problems(id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_language_problem_language
        FOREIGN KEY (language_id)
        REFERENCES ref_languages(id)
        ON DELETE RESTRICT,

    CONSTRAINT uq_language_problem UNIQUE (problem_id, language_id)
);

CREATE INDEX idx_language_problems_problem_id ON language_problems(problem_id);
CREATE INDEX idx_language_problems_language_id ON language_problems(language_id);

-- Table: Submissions
CREATE TABLE IF NOT EXISTS submissions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    problem_id UUID NOT NULL,
    language_id UUID NOT NULL,
    user_id UUID NOT NULL,
    code TEXT NOT NULL,
    status status NOT NULL,
    execution_time INTERVAL,
    memory_usage_kb BIGINT,
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
        FOREIGN KEY (language_id)
        REFERENCES ref_languages(id)
        ON DELETE RESTRICT
);

CREATE INDEX idx_submissions_problem_id ON submissions(problem_id);
CREATE INDEX idx_submissions_language_id ON submissions(language_id);


-- Table: Executors
CREATE TABLE IF NOT EXISTS executors (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    language_id UUID NOT NULL,
    name VARCHAR(100) NOT NULL UNIQUE,
    time_limit INTERVAL NOT NULL,

    CONSTRAINT fk_language_executor
        FOREIGN KEY (language_id)
        REFERENCES ref_languages(id)
        ON DELETE RESTRICT
);

CREATE INDEX idx_executors_language_id ON executors(language_id);
