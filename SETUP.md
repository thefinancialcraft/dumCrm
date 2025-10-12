# Insurance CRM Setup Guide

## Configuration Setup

### 1. Supabase Configuration

1. **Copy the configuration template:**
   ```bash
   cp config.example.js config.js
   ```

2. **Update config.js with your Supabase credentials:**
   ```javascript
   const CONFIG = {
     SUPABASE_URL: 'https://yourproject.supabase.co',
     SUPABASE_ANON_KEY: 'your_supabase_anon_key_here'
   };
   ```

### 2. Get Supabase Credentials

1. Go to your [Supabase Dashboard](https://supabase.com/dashboard)
2. Select your project
3. Go to **Settings** → **API**
4. Copy the following values:
   - **Project URL** → `SUPABASE_URL`
   - **Project API keys** → **anon public** → `SUPABASE_ANON_KEY`

### 3. Security Notes

- ✅ `config.js` is included in `.gitignore` for security
- ✅ Never commit your actual Supabase credentials to version control
- ✅ Use `config.example.js` as a template for other developers

### 4. File Structure

```
rnlData/
├── index.html          # Main application
├── config.js           # Your Supabase credentials (not in git)
├── config.example.js   # Template for configuration
├── .gitignore          # Excludes sensitive files
└── SETUP.md           # This setup guide
```

### 5. Running the Application

1. Make sure `config.js` exists with your credentials
2. Open `index.html` in a web browser
3. The application will automatically load your Supabase configuration

## Troubleshooting

### Common Issues

1. **"CONFIG is not defined" error:**
   - Make sure `config.js` exists and contains valid configuration
   - Check that the file is in the same directory as `index.html`

2. **Supabase connection errors:**
   - Verify your `SUPABASE_URL` and `SUPABASE_ANON_KEY` are correct
   - Check that your Supabase project is active

3. **CORS errors:**
   - Make sure your domain is added to Supabase allowed origins
   - For local development, add `http://localhost` to allowed origins
