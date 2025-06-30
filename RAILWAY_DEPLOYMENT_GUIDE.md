# 🚀 Railway Deployment Guide for Laravel Job Portal

## ✅ Your Project is Ready for Railway!

Your Laravel job portal has been configured for Railway deployment. Here's your complete step-by-step guide:

## 📋 Prerequisites
- ✅ GitHub repository with your Laravel project
- ✅ Railway account (free tier available)
- ✅ Your code is already pushed to GitHub

## 🚀 Step-by-Step Deployment

### Step 1: Create Railway Account
1. Go to [Railway.app](https://railway.app/)
2. Sign up/Login with your GitHub account
3. Click **"New Project"**

### Step 2: Deploy from GitHub
1. Select **"Deploy from GitHub Repo"**
2. Choose your `job_portal` repository
3. Railway will automatically detect it's a PHP project
4. Click **"Deploy"**

### Step 3: Add Database
1. In your Railway project dashboard, click **"New"**
2. Select **"Database"**
3. Choose **MySQL** (recommended) or **PostgreSQL**
4. Railway will provision a database for you

### Step 4: Configure Environment Variables
1. Go to your project's **"Variables"** tab
2. Copy the contents from `railway-env-template.txt`
3. **IMPORTANT**: Replace database credentials with Railway's actual values:

#### For MySQL:
```
DB_CONNECTION=mysql
DB_HOST=YOUR_RAILWAY_MYSQL_HOST
DB_PORT=YOUR_RAILWAY_MYSQL_PORT
DB_DATABASE=YOUR_RAILWAY_MYSQL_DATABASE
DB_USERNAME=YOUR_RAILWAY_MYSQL_USERNAME
DB_PASSWORD=YOUR_RAILWAY_MYSQL_PASSWORD
```

#### For PostgreSQL:
```
DB_CONNECTION=pgsql
DB_HOST=YOUR_RAILWAY_PG_HOST
DB_PORT=YOUR_RAILWAY_PG_PORT
DB_DATABASE=YOUR_RAILWAY_PG_DATABASE
DB_USERNAME=YOUR_RAILWAY_PG_USERNAME
DB_PASSWORD=YOUR_RAILWAY_PG_PASSWORD
```

### Step 5: Get Database Credentials
1. Click on your database in Railway dashboard
2. Go to **"Connect"** tab
3. Copy the connection details
4. Update your environment variables with these values

### Step 6: Deploy
1. Railway will automatically redeploy when you update environment variables
2. Check the **"Deployments"** tab for progress
3. Wait for deployment to complete

### Step 7: Access Your App
- Railway will provide a public URL (like `https://web-production-59e65.up.railway.app`)
- Your Laravel job portal should be accessible at that URL

## 🔧 What Happens During Deployment

Your `railway.json` configuration handles:

✅ **Build Phase**:
- Install Composer dependencies
- Generate application key
- Cache configurations, routes, and views

✅ **Deploy Phase**:
- Run database migrations
- Create storage link
- Start Laravel server

## 🐛 Troubleshooting

### Common Issues:

#### 1. Database Connection Error
**Error**: `SQLSTATE[08006] [7] could not connect to server`
**Solution**: 
- Check Railway environment variables
- Ensure database credentials are correct
- Verify database is running in Railway

#### 2. Migration Errors
**Error**: `SQLSTATE[42P01]: Undefined table`
**Solution**:
- Check Railway logs for migration errors
- Ensure database exists and is accessible
- Verify environment variables are set correctly

#### 3. Application Key Error
**Error**: `No application encryption key has been specified`
**Solution**:
- The build process should generate this automatically
- Check if `APP_KEY` is set in environment variables

### Debug Mode
Temporarily set `APP_DEBUG=true` to see detailed error messages.

## 📊 Monitoring Your App

### Railway Dashboard Features:
- **Deployments**: View deployment history and logs
- **Variables**: Manage environment variables
- **Metrics**: Monitor app performance
- **Logs**: View real-time application logs

### Check Deployment Logs:
1. Go to Railway dashboard
2. Click on your project
3. Go to **"Deployments"** tab
4. Click on latest deployment
5. Check build and runtime logs

## 🔄 Updating Your App

To update your app:
1. Make changes to your code
2. Commit and push to GitHub
3. Railway will automatically redeploy
4. Check deployment logs for any issues

## 🌐 Custom Domain (Optional)

1. Go to your Railway project settings
2. Click **"Domains"**
3. Add your custom domain
4. Configure DNS settings as instructed

## 📞 Support

If you encounter issues:
1. Check Railway logs first
2. Verify environment variables
3. Ensure database connection
4. Check [Railway Documentation](https://docs.railway.app/)
5. Contact Railway support if needed

## 🎉 Success!

Once deployed successfully, your Laravel job portal will be live at your Railway URL!

**Your app URL**: `https://web-production-59e65.up.railway.app`

---

## 📝 Quick Checklist

- [ ] Railway account created
- [ ] Project deployed from GitHub
- [ ] Database added (MySQL/PostgreSQL)
- [ ] Environment variables configured
- [ ] Database credentials updated
- [ ] App accessible at Railway URL
- [ ] Migrations run successfully
- [ ] Custom domain configured (optional) 