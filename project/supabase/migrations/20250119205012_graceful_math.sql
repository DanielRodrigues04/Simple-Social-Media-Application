/*
  # Seed Test Data

  1. Test Posts
    - Adds sample posts with test content
    - Uses existing profiles table
*/

-- Insert test posts with hardcoded UUIDs for testing
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