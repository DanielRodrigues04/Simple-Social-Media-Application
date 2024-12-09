/*
  # Seed Test Data

  1. Test Users
    - Creates test profiles for sample users
  2. Test Posts
    - Adds sample posts linked to test profiles
*/

-- First, create test profiles
INSERT INTO profiles (id, email, created_at)
VALUES
  ('00000000-0000-0000-0000-000000000001', 'alice@example.com', now()),
  ('00000000-0000-0000-0000-000000000002', 'bob@example.com', now())
ON CONFLICT (id) DO NOTHING;

-- Then insert test posts
INSERT INTO posts (content, user_id, created_at)
VALUES
  ('Hello everyone! This is my first post in this amazing social network! 👋', 
   '00000000-0000-0000-0000-000000000001', 
   now() - interval '2 days'),
  ('Just finished reading an incredible book about space exploration! 🚀', 
   '00000000-0000-0000-0000-000000000001', 
   now() - interval '1 day'),
  ('Beautiful sunny day for a walk in the park! ☀️', 
   '00000000-0000-0000-0000-000000000002', 
   now() - interval '12 hours'),
  ('Working on an exciting new project. Can''t wait to share more details! 💻', 
   '00000000-0000-0000-0000-000000000002', 
   now() - interval '6 hours'),
  ('The sunset today was absolutely breathtaking! 🌅', 
   '00000000-0000-0000-0000-000000000001', 
   now() - interval '3 hours'),
  ('Just learned something new about programming. Always keep learning! 📚', 
   '00000000-0000-0000-0000-000000000002', 
   now() - interval '1 hour')
ON CONFLICT DO NOTHING;