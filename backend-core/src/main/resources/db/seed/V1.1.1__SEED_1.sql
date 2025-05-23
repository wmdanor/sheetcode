INSERT INTO users (id, username, email) VALUES
  ('11111111-1111-1111-1111-111111111111', 'alice', 'alice@example.com'),
  ('22222222-2222-2222-2222-222222222222', 'bob', 'bob@example.com'),
  ('33333333-3333-3333-3333-333333333333', 'charlie', 'charlie@example.com');

INSERT INTO problems (id, name, slug, description, level, test_cases, created_on) VALUES
  (
    '44444444-4444-4444-4444-444444444444',
    'Two Sum',
    'two-sum',
    'Find two numbers that add up to target',
    'easy',
    '[{"input": [2,7,11,15,9], "target": 9, "output": [0,4]}]'::jsonb,
    CURRENT_TIMESTAMP
  ),
  (
    '55555555-5555-5555-5555-555555555555',
    'Median of Two Sorted Arrays',
    'median-of-two-sorted-arrays',
    'Find median of two sorted arrays',
    'hard',
    '[{"input": [[1,3], [2]], "output": 2}]'::jsonb,
    CURRENT_TIMESTAMP
  );

INSERT INTO language_problems (id, problem_id, language_id, code_template, time_limit) VALUES
  (
    '66666666-6666-6666-6666-666666666666',
    '44444444-4444-4444-4444-444444444444',
    'c04dfeb9-80fd-4e71-a18c-0369cf72cd50',
    'def two_sum(nums, target):\n    pass',
    INTERVAL '1000 milliseconds'
  ),
  (
    '77777777-7777-7777-7777-777777777777',
    '44444444-4444-4444-4444-444444444444',
    'b20a89cf-4772-439e-9301-be1dcb33797b',
    'function twoSum(nums, target) {\n  // code here\n}',
    INTERVAL '1000 milliseconds'
  );

INSERT INTO executors (id, language_id, name, time_limit) VALUES
  ('88888888-8888-8888-8888-888888888888', 'c04dfeb9-80fd-4e71-a18c-0369cf72cd50', 'Python 3.10 Executor', INTERVAL '2000 milliseconds'),
  ('99999999-9999-9999-9999-999999999999', 'b20a89cf-4772-439e-9301-be1dcb33797b', 'Node.js 20 Executor', INTERVAL '2000 milliseconds');

INSERT INTO submissions (id, problem_id, language_id, user_id, code, status, execution_time, memory_usage_kb, error_message, submitted_on)
VALUES
(
  'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
  '44444444-4444-4444-4444-444444444444',
  'c04dfeb9-80fd-4e71-a18c-0369cf72cd50',
  '11111111-1111-1111-1111-111111111111',
  'def two_sum(nums, target): return [0,1]',
  'ok',
  INTERVAL '2000 milliseconds',
  2048,
  NULL,
  CURRENT_TIMESTAMP
),
(
  'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
  '44444444-4444-4444-4444-444444444444',
  'b20a89cf-4772-439e-9301-be1dcb33797b',
  '22222222-2222-2222-2222-222222222222',
  'function twoSum(nums, target) { return [0,1]; }',
  'failure',
  INTERVAL '2000 milliseconds',
  3000,
  'Timeout error',
  CURRENT_TIMESTAMP
);
