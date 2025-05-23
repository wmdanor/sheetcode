-- Seed data for ref_languages
INSERT INTO ref_languages (language_code, name) VALUES
    ('py', 'Python'),
    ('js', 'JavaScript'),
    ('cpp', 'C++')
ON CONFLICT DO NOTHING;

-- Seed data for users
INSERT INTO users (id, username, email) VALUES
    (gen_random_uuid(), 'alice', 'alice@example.com'),
    (gen_random_uuid(), 'bob', 'bob@example.com')
ON CONFLICT DO NOTHING;

-- Seed data for problems
INSERT INTO problems (id, name, slug, description, level, test_cases) VALUES
    (gen_random_uuid(), 'Two Sum', 'two-sum', 'Find two numbers that add up to a target.', 'easy', '[{"input": [2, 7, 11, 15], "target": 9, "output": [0, 1]}]'),
    (gen_random_uuid(), 'Reverse String', 'reverse-string', 'Reverse the input string.', 'easy', '[{"input": "hello", "output": "olleh"}]')
ON CONFLICT DO NOTHING;

-- Get problem IDs and assign them for linking
-- You can replace the SELECTs with actual UUIDs if you want deterministic seeding.

-- Seed data for language_problems (assuming "Two Sum" and Python)
INSERT INTO language_problems (id, problem_id, language_code, code_template, time_limit_ms)
SELECT
    gen_random_uuid(),
    p.id,
    'py',
    '# Write your solution here\n',
    2000
FROM problems p
WHERE p.slug = 'two-sum'
ON CONFLICT DO NOTHING;

-- Seed data for submissions
INSERT INTO submissions (id, problem_id, language_code, code, status, execution_time_ms, memory_usage_kb, error_message)
SELECT
    gen_random_uuid(),
    p.id,
    'py',
    'def two_sum(nums, target):\n    ...',
    'ok',
    123,
    2560,
    NULL
FROM problems p
WHERE p.slug = 'two-sum'
ON CONFLICT DO NOTHING;

-- Seed data for executors
INSERT INTO executors (id, language_code, name, time_limit_ms) VALUES
    (gen_random_uuid(), 'py', 'Python Executor', 3000),
    (gen_random_uuid(), 'js', 'Node Executor', 3000),
    (gen_random_uuid(), 'cpp', 'C++ Executor', 3000)
ON CONFLICT DO NOTHING;
