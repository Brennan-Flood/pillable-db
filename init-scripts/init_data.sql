-- Insert Users (avoid duplicates)
INSERT INTO users (name, role) 
VALUES 
    ('Brennan', 'admin'), 
    ('Han', 'admin'), 
    ('Billy', 'user')
ON CONFLICT DO NOTHING;

-- Insert Supplements (avoid duplicates)
INSERT INTO supplements (name) 
VALUES 
    ('Vitamin D3'),
    ('Omega-3')
ON CONFLICT DO NOTHING;

-- Insert Follows (avoid duplicates)
INSERT INTO follows (following_user, followed_user)
SELECT 
    (SELECT id FROM users WHERE name = 'Brennan' LIMIT 1),
    (SELECT id FROM users WHERE name = 'Han' LIMIT 1)
UNION ALL
SELECT 
    (SELECT id FROM users WHERE name = 'Billy' LIMIT 1),
    (SELECT id FROM users WHERE name = 'Brennan' LIMIT 1)
ON CONFLICT DO NOTHING;

-- Insert Reviews (avoid duplicates)
INSERT INTO reviews (title, body, user_id, supplement_id, rating)
SELECT 
    'Great supplement!', 'I feel much better taking this.', 
    (SELECT id FROM users WHERE name = 'Brennan' LIMIT 1),
    (SELECT id FROM supplements WHERE name = 'Vitamin D3' LIMIT 1), 
    5
UNION ALL
SELECT 
    'Not bad.', 'Good quality but expensive.', 
    (SELECT id FROM users WHERE name = 'Han' LIMIT 1),
    (SELECT id FROM supplements WHERE name = 'Omega-3' LIMIT 1), 
    4
ON CONFLICT DO NOTHING;
