# Simple Social Network

A simple social network application built with React, TypeScript, and Supabase.

## Features

- User Authentication (Register/Login)
- Create and view posts
- Real-time updates
- Responsive design
- Modern UI with Tailwind CSS

## Tech Stack

- Frontend:
  - React
  - TypeScript
  - Tailwind CSS
  - React Router DOM
  - Lucide React (icons)
  - date-fns (date formatting)
  - Vite (build tool)

- Backend/Database:
  - Supabase (Authentication and Database)

## Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- Supabase account

## Setup

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   ```

3. Create a Supabase project and get your credentials

4. Create a `.env` file in the root directory with your Supabase credentials:
   ```
   VITE_SUPABASE_URL=your_supabase_url
   VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

5. Set up the database schema in Supabase:

   Create the following tables:

   - profiles
     ```sql
     create table profiles (
       id uuid references auth.users on delete cascade,
       email text,
       created_at timestamp with time zone default timezone('utc'::text, now()) not null,
       primary key (id)
     );
     ```

   - posts
     ```sql
     create table posts (
       id uuid default gen_random_uuid() primary key,
       content text not null,
       user_id uuid references auth.users not null,
       created_at timestamp with time zone default timezone('utc'::text, now()) not null
     );
     ```

6. Start the development server:
   ```bash
   npm run dev
   ```

## Project Structure

```
src/
├── components/     # Reusable UI components
├── hooks/          # Custom React hooks
├── lib/           # Utility functions and configurations
├── pages/         # Page components
└── App.tsx        # Main application component
```

## Features Explanation

### Authentication
- Email/password authentication using Supabase Auth
- Protected routes for authenticated users
- Automatic session management

### Posts
- Create new posts
- View posts from all users
- Real-time updates
- Timestamp formatting
- User attribution

### UI/UX
- Responsive design
- Loading states
- Error handling
- Clean and modern interface
- Intuitive navigation

## Development

To start development:

1. Run the development server:
   ```bash
   npm run dev
   ```

2. Open [http://localhost:5173](http://localhost:5173) in your browser

## Building for Production

To create a production build:

```bash
npm run build
```

The build artifacts will be stored in the `dist/` directory.

## License

MIT