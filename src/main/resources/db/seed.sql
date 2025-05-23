-- Insert languages
INSERT INTO ref_languages (language_code, name) VALUES
  ('python', 'Python'),
  ('javascript', 'JavaScript'),
  ('java', 'Java'),
  ('csharp', 'C#')
ON CONFLICT (language_code) DO NOTHING;

-- Insert users
INSERT INTO users (id, username, email) VALUES
  (gen_random_uuid(), 'alice', 'alice@example.com'),
  (gen_random_uuid(), 'bob', 'bob@example.com'),
  (gen_random_uuid(), 'charlie', 'charlie@example.com');

-- Insert problems
INSERT INTO problems (id, name, slug, description, level, test_cases, created_on) VALUES
  (
    gen_random_uuid(),
    'Two Sum',
    'two-sum',
    'Find two numbers that add up to target',
    'easy',
    '[{"input": [2,7,11,15,9], "target": 9, "output": [0,4]}]'::jsonb,
    CURRENT_TIMESTAMP
  ),
  (
    gen_random_uuid(),
    'Median of Two Sorted Arrays',
    'median-of-two-sorted-arrays',
    'Find median of two sorted arrays',
    'hard',
    '[{"input": [[1,3], [2]], "output": 2}]'::jsonb,
    CURRENT_TIMESTAMP
  );

-- You need problem_ids for next inserts, so retrieve them
-- Let's create temporary variables with CTEs (only for explanation, adjust if using a script tool)

WITH problem_ids AS (
  SELECT id, slug FROM problems
)
-- Insert language_problems
INSERT INTO language_problems (id, problem_id, language_code, code_template, time_limit_ms)
SELECT
  gen_random_uuid(),
  p.id,
  l.language_code,
  CASE
    WHEN l.language_code = 'python' THEN 'def two_sum(nums, target):\n    pass'
    WHEN l.language_code = 'javascript' THEN 'function twoSum(nums, target) {\n  // code here\n}'
    ELSE ''
  END,
  1000
FROM problem_ids p
JOIN ref_languages l ON l.language_code IN ('python', 'javascript')
WHERE p.slug = 'two-sum';

-- Insert executors
INSERT INTO executors (id, language_code, name, time_limit_ms) VALUES
  (gen_random_uuid(), 'python', 'Python 3.10 Executor', 2000),
  (gen_random_uuid(), 'javascript', 'Node.js 16 Executor', 2000);

-- Insert submissions
-- Need user_ids and problem_ids again. Example using subqueries:

INSERT INTO submissions (id, problem_id, language_code, user_id, code, status, execution_time_ms, memory_usage_kb, error_message, submitted_on)
VALUES
(
  gen_random_uuid(),
  (SELECT id FROM problems WHERE slug = 'two-sum'),
  'python',
  (SELECT id FROM users WHERE username = 'alice'),
  'def two_sum(nums, target): return [0,1]',
  'ok',
  123,
  2048,
  NULL,
  CURRENT_TIMESTAMP
),
(
  gen_random_uuid(),
  (SELECT id FROM problems WHERE slug = 'two-sum'),
  'javascript',
  (SELECT id FROM users WHERE username = 'bob'),
  'function twoSum(nums, target) { return [0,1]; }',
  'failure',
  2000,
  3000,
  'Timeout error',
  CURRENT_TIMESTAMP
);
