# Vercel Deployment Guide

## 🚀 Deploy to Vercel with Environment Variables

### Method 1: Using Vercel CLI (Recommended)

#### 1. Install Vercel CLI
```bash
npm install -g vercel
```

#### 2. Login to Vercel
```bash
vercel login
```

#### 3. Set Environment Variables
```bash
# Set your Supabase credentials
vercel env add SUPABASE_URL
# Enter: https://eigisleuqfshwqiasvxw.supabase.co

vercel env add SUPABASE_ANON_KEY
# Enter: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVpZ2lzbGV1cWZzaHdxaWFzdnh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjAyMTIzMTcsImV4cCI6MjA3NTc4ODMxN30.GuZb5q_dDElI2gBuQZVFgNqH-2UHO_q9QOQ6hKknO4A
```

#### 4. Deploy
```bash
vercel --prod
```

### Method 2: Using Vercel Dashboard

#### 1. Push to GitHub
```bash
git add .
git commit -m "Add Vercel deployment configuration"
git push origin main
```

#### 2. Connect to Vercel
1. Go to [vercel.com](https://vercel.com)
2. Click "New Project"
3. Import your GitHub repository
4. Vercel will auto-detect the configuration

#### 3. Set Environment Variables
1. Go to your project dashboard
2. Click "Settings" → "Environment Variables"
3. Add the following:
   - **Name:** `SUPABASE_URL`
   - **Value:** `https://eigisleuqfshwqiasvxw.supabase.co`
   - **Environment:** Production, Preview, Development

   - **Name:** `SUPABASE_ANON_KEY`
   - **Value:** `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVpZ2lzbGV1cWZzaHdxaWFzdnh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjAyMTIzMTcsImV4cCI6MjA3NTc4ODMxN30.GuZb5q_dDElI2gBuQZVFgNqH-2UHO_q9QOQ6hKknO4A`
   - **Environment:** Production, Preview, Development

#### 4. Deploy
1. Click "Deploy" button
2. Wait for deployment to complete
3. Your app will be available at `https://your-project.vercel.app`

### Method 3: Using .env File (Local Development)

#### 1. Create .env.local file
```bash
# Create .env.local file in the project root
SUPABASE_URL=https://eigisleuqfshwqiasvxw.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVpZ2lzbGV1cWZzaHdxaWFzdnh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjAyMTIzMTcsImV4cCI6MjA3NTc4ODMxN30.GuZb5q_dDElI2gBuQZVFgNqH-2UHO_q9QOQ6hKknO4A
```

#### 2. Run locally
```bash
npm run dev
```

## 📁 File Structure

```
rnlData/
├── index.html              # Main application
├── config.js               # Generated config (gitignored)
├── config.example.js       # Template
├── build.js               # Build script
├── package.json           # Node.js configuration
├── vercel.json            # Vercel configuration
├── .gitignore             # Git ignore rules
├── .env.local             # Local environment (gitignored)
└── VERCEL_DEPLOYMENT.md   # This guide
```

## 🔧 How It Works

1. **Build Process:** `build.js` reads environment variables and generates `config.js`
2. **Environment Variables:** Set in Vercel dashboard or via CLI
3. **Static Build:** Vercel builds the project and serves static files
4. **Runtime:** Browser loads `config.js` with production credentials

## 🛠️ Troubleshooting

### Common Issues

1. **"CONFIG is not defined" error:**
   - Check that environment variables are set in Vercel
   - Verify build process completed successfully

2. **Build fails:**
   - Ensure Node.js version is 14+ in `package.json`
   - Check that all required files are committed

3. **Environment variables not working:**
   - Verify variables are set for all environments (Production, Preview, Development)
   - Redeploy after adding new environment variables

### Debug Steps

1. **Check build logs** in Vercel dashboard
2. **Verify environment variables** are set correctly
3. **Test locally** with `npm run dev`
4. **Check browser console** for errors

## 🔒 Security Notes

- ✅ Environment variables are secure in Vercel
- ✅ `config.js` is generated at build time
- ✅ No sensitive data in source code
- ✅ `.env.local` is gitignored for local development
