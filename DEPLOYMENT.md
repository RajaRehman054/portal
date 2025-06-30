# Railway Deployment Guide

## Prerequisites
- GitHub account with your Laravel project
- Railway account (free tier available)

## Step 1: Prepare Your Repository
1. Make sure your code is pushed to GitHub
2. Ensure `.env` is in `.gitignore` (already done)
3. The following files are now included:
   - `Procfile` - Tells Railway how to start the app
   - `railway.json` - Railway-specific configuration
   - `deploy.sh` - Deployment script

## Step 2: Deploy to Railway
1. Go to [Railway.app](https://railway.app/)
2. Click "New Project" → "Deploy from GitHub Repo"
3. Select your Laravel job portal repository
4. Railway will automatically detect it's a PHP project

## Step 3: Configure Environment Variables
In Railway dashboard, go to your project → Variables tab and add:

### Required Variables:
```
APP_NAME="Job Portal"
APP_ENV=production
APP_KEY=base64:YOUR_GENERATED_KEY
APP_DEBUG=false
APP_URL=https://your-app-name.railway.app

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=YOUR_RAILWAY_DB_HOST
DB_PORT=YOUR_RAILWAY_DB_PORT
DB_DATABASE=YOUR_RAILWAY_DB_NAME
DB_USERNAME=YOUR_RAILWAY_DB_USER
DB_PASSWORD=YOUR_RAILWAY_DB_PASSWORD

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DISK=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120
```

## Step 4: Add Database
1. In Railway dashboard, click "New" → "Database"
2. Choose MySQL or PostgreSQL
3. Copy the connection details to your environment variables

## Step 5: Deploy
1. Railway will automatically deploy when you push to your main branch
2. Or manually trigger deployment from the dashboard
3. Check the deployment logs for any errors

## Step 6: Access Your App
- Railway will provide a public URL
- Your Laravel job portal should be accessible at that URL

## Troubleshooting
- Check Railway logs for errors
- Ensure all environment variables are set
- Verify database connection
- Make sure migrations run successfully

## Custom Domain (Optional)
- Go to your project settings in Railway
- Add custom domain under "Domains" section 