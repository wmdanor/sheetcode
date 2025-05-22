-- Seed: Users
INSERT INTO "User" (username, email) VALUES
('alice', 'alice@example.com'),
('bob', 'bob@example.com'),
('charlie', 'charlie@example.com');

-- Seed: Languages
INSERT INTO Languages (name) VALUES
('Python'),
('JavaScript'),
('C++');

-- Seed: Problems
INSERT INTO Problems (name, description, level, test_cases) VALUES
('Sum of Two Numbers', 'Write a program to sum two integers.', 'easy', '[{"input": "1 2", "output": "3"}, {"input": "5 7", "output": "12"}]'),
('Palindrome Checker', 'Check if a string is a palindrome.', 'medium', '[{"input": "racecar", "output": "true"}, {"input": "hello", "output": "false"}]');

-- Seed: Executors
INSERT INTO Executors (name, language_id, time_limit) VALUES
('Python Executor', 1, 2.0),
('JS Runner', 2, 1.5),
('C++ Compiler', 3, 1.0);

-- Seed: Submissions
INSERT INTO Submissions (problem_id, language_id, code, status, execution_time, memory_usage, error_message) VALUES
(1, 1, 'print(sum(map(int, input().split())))', 'ok', 0.12, 1024, NULL),
(2, 2, 'console.log(isPalindrome(input))', 'failure', 0.30, 2048, 'ReferenceError: input is not defined'),
(1, 3, '#include <iostream>\nint main() { int a,b; std::cin >> a >> b; std::cout << a + b; }', 'ok', 0.05, 512, NULL);
