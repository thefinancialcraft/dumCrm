-- Supabase Database Schema for Insurance CRM
-- Run this SQL in your Supabase SQL Editor

-- Create users table for authentication
CREATE TABLE IF NOT EXISTS users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id TEXT NOT NULL UNIQUE,
  email TEXT NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  name TEXT NOT NULL,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create customers table matching CSV export format
CREATE TABLE IF NOT EXISTS customers (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id TEXT NOT NULL,
  lead_id TEXT NOT NULL,
  phone_no TEXT NOT NULL,
  name TEXT NOT NULL,
  expiry_date TEXT,
  customer_details TEXT,
  utilities TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(user_id, lead_id)
);

-- Create dispositions table
CREATE TABLE IF NOT EXISTS dispositions (
  id SERIAL PRIMARY KEY,
  user_id TEXT NOT NULL,
  data JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(user_id)
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_user_id ON users(user_id);
CREATE INDEX IF NOT EXISTS idx_users_is_active ON users(is_active);
CREATE INDEX IF NOT EXISTS idx_customers_user_id ON customers(user_id);
CREATE INDEX IF NOT EXISTS idx_customers_lead_id ON customers(lead_id);
CREATE INDEX IF NOT EXISTS idx_customers_phone ON customers(phone_no);
CREATE INDEX IF NOT EXISTS idx_customers_created_at ON customers(created_at);
CREATE INDEX IF NOT EXISTS idx_dispositions_user_id ON dispositions(user_id);

-- Enable Row Level Security (RLS)
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE customers ENABLE ROW LEVEL SECURITY;
ALTER TABLE dispositions ENABLE ROW LEVEL SECURITY;

-- Create policies for user-specific access
CREATE POLICY "Allow user registration" ON users
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow user login" ON users
  FOR SELECT USING (is_active = true);

CREATE POLICY "Users can only access their own customers" ON customers
  FOR ALL USING (user_id = current_setting('app.current_user_id', true));

CREATE POLICY "Users can only access their own dispositions" ON dispositions
  FOR ALL USING (user_id = current_setting('app.current_user_id', true));

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers to automatically update updated_at
CREATE TRIGGER update_users_updated_at 
  BEFORE UPDATE ON users 
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_customers_updated_at 
  BEFORE UPDATE ON customers 
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_dispositions_updated_at 
  BEFORE UPDATE ON dispositions 
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
