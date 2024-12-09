/*
  # Seed Test Data

  1. Test Users
    - Creates test users with posts
  2. Test Posts
    - Adds sample posts for each user
*/

-- Insert test posts
DO $$
DECLARE
  test_user_1 uuid;
  test_user_2 uuid;
BEGIN
  -- Get or create test users from auth.users
  INSERT INTO auth.users (email)
  VALUES ('alice@example.com')
  ON CONFLICT (email) DO UPDATE SET email = EXCLUDED.email
  RETURNING id INTO test_user_1;

  INSERT INTO auth.users (email)
  VALUES ('bob@example.com')
  ON CONFLICT (email) DO UPDATE SET email = EXCLUDED.email
  RETURNING id INTO test_user_2;

  -- Insert test posts
  INSERT INTO posts (content, user_id, created_at)
  VALUES
    ('Hello everyone! This is my first post in this amazing social network! 👋', 
     test_user_1, 
     now() - interval '2 days'),
    ('Just finished reading an incredible book about space exploration! 🚀', 
     test_user_1, 
     now() - interval '1 day'),
    ('Beautiful sunny day for a walk in the park! ☀️', 
     test_user_2, 
     now() - interval '12 hours'),
    ('Working on an exciting new project. Can''t wait to share more details! 💻', 
     test_user_2, 
     now() - interval '6 hours'),
    ('The sunset today was absolutely breathtaking! 🌅', 
     test_user_1, 
     now() - interval '3 hours'),
    ('Just learned something new about programming. Always keep learning! 📚', 
     test_user_2, 
     now() - interval '1 hour')
  ON CONFLICT DO NOTHING;
END $$;