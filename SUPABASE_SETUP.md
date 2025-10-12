# Supabase Setup Instructions

## 1. Create Supabase Project
1. Go to [supabase.com](https://supabase.com)
2. Sign up/Login and create a new project
3. Wait for the project to be ready

## 2. Set up Database Schema
1. Go to your Supabase project dashboard
2. Navigate to SQL Editor
3. Copy and paste the contents of `supabase_schema.sql`
4. Run the SQL script to create the required tables

## 3. Get API Keys
1. Go to Settings > API in your Supabase dashboard
2. Copy the following:
   - Project URL
   - Anon (public) key

## 4. Update Configuration
1. Open `index.html`
2. Find the Supabase configuration section (around line 840)
3. Replace the placeholder values:
   ```javascript
   const SUPABASE_URL = 'YOUR_SUPABASE_URL'; // Replace with your Project URL
   const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY'; // Replace with your Anon key
   ```

## 5. Test the Integration
1. Open the application in your browser
2. The app should now use Supabase instead of localStorage
3. All data will be stored in your Supabase database
4. Test the new signup functionality by clicking "Sign up" on the login page

## New Signup Features
- **User Registration**: Users can now create accounts with email and password
- **Form Validation**: Client-side validation for password matching and length
- **Auto-login**: Users are automatically logged in after successful registration
- **Duplicate Prevention**: System checks for existing email addresses
- **Secure Storage**: User data is stored in Supabase with proper RLS policies

## Database Tables Created

### users
- Stores user authentication data
- Includes email, password hash, name, and active status
- Automatically generates UUIDs for each record
- Supports user registration and login

### customers
- Stores all customer/policy data
- Includes lead tracking and status management
- Automatically generates UUIDs for each record

### dispositions
- Stores disposition data as JSON
- Single record with ID 1 for simplicity

## Features Migrated
- ✅ User registration and authentication
- ✅ Customer data storage
- ✅ Disposition tracking
- ✅ CSV import/export
- ✅ Data backup/restore
- ✅ Authentication with Supabase users table

## Security Notes
- Row Level Security (RLS) is enabled
- Current policies allow all operations (adjust based on your needs)
- Consider implementing proper user authentication with Supabase Auth for production use
