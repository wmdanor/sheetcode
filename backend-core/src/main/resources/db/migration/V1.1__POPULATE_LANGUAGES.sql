-- Insert languages
INSERT INTO ref_languages (id, name) VALUES
  ('c04dfeb9-80fd-4e71-a18c-0369cf72cd50', 'Python'),
  ('b20a89cf-4772-439e-9301-be1dcb33797b', 'JavaScript'),
  ('f6897f47-c4ae-44c3-b3ce-e5e18d979017', 'Java'),
  ('e4698ace-82ad-4b9e-9ceb-a8c90773ae32', 'C#')
ON CONFLICT (id) DO NOTHING;
