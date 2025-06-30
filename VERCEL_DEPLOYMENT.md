# Vercel Deployment Guide for Laravel Job Portal

## ⚠️ Important Notice
**Vercel is primarily designed for frontend applications and serverless functions. Laravel is a full-stack PHP framework that may have limitations on Vercel.**

## Prerequisites
- GitHub repository with your Laravel project
- Vercel account (free tier available)
- Cloud database service (PlanetScale, Supabase, Railway, etc.)

## Step 1: Prepare Your Project

### A. Database Setup
Since Vercel doesn't provide persistent databases, you need a cloud database:

**Option 1: PlanetScale (Recommended)**
1. Go to [PlanetScale.com](https://planetscale.com/)
2. Create a free account
3. Create a new database
4. Get connection details

**Option 2: Supabase**
1. Go to [Supabase.com](https://supabase.com/)
2. Create a free account
3. Create a new project
4. Get PostgreSQL connection details

**Option 3: Railway (Database only)**
1. Go to [Railway.app](https://railway.app/)
2. Create a new project
3. Add MySQL/PostgreSQL database
4. Get connection details

### B. File Storage
For file uploads, use cloud storage:
- AWS S3
- Cloudinary
- Supabase Storage

## Step 2: Deploy to Vercel

### A. Connect to Vercel
1. Go to [Vercel.com](https://vercel.com/)
2. Sign up/Login with GitHub a
3. Click **"New Project"**
4. Import your GitHub repository
5. Select the `job_portal` repository

### B. Configure Build Settings
1. **Framework Preset**: Other
2. **Root Directory**: `./` (leave empty)
3. **Build Command**: `composer install --no-dev --optimize-autoloader`
4. **Output Directory**: `public`
5. **Install Command**: `composer install`

### C. Environment Variables
In Vercel dashboard, go to **Settings** → **Environment Variables** and add:

```
APP_NAME="Job Portal"
APP_ENV=production
APP_KEY=base64:REBTSPaMzJbkUe4H0a2maH9T3/tnC6NqFiQGrYY4pdQ=
APP_DEBUG=false
APP_URL=https://your-app-name.vercel.app

# Database (update with your cloud database credentials)
DB_CONNECTION=mysql
DB_HOST=your-cloud-db-host
DB_PORT=your-cloud-db-port
DB_DATABASE=your-cloud-db-name
DB_USERNAME=your-cloud-db-username
DB_PASSWORD=your-cloud-db-password

# Other Laravel settings
LOG_CHANNEL=stack
CACHE_DRIVER=file
SESSION_DRIVER=file
QUEUE_CONNECTION=sync
```

## Step 3: Deploy

1. Click **"Deploy"**
2. Vercel will build and deploy your project
3. Wait for deployment to complete
4. You'll get a URL like: `https://your-app-name.vercel.app`

## Step 4: Post-Deployment Setup

### A. Run Migrations
Since Vercel is serverless, you need to run migrations manually:

1. **Option 1: Use Laravel Forge or similar**
2. **Option 2: Use Laravel Sail locally with remote database**
3. **Option 3: Use a migration service**

### B. Set Up File Storage
Update your `config/filesystems.php` to use cloud storage:

```php
'default' => env('FILESYSTEM_DISK', 's3'),

'disks' => [
    's3' => [
        'driver' => 's3',
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION'),
        'bucket' => env('AWS_BUCKET'),
        'url' => env('AWS_URL'),
    ],
],
```

## Step 5: Custom Domain (Optional)
1. Go to your Vercel project settings
2. Click **"Domains"**
3. Add your custom domain
4. Configure DNS settings

## Limitations and Considerations

### ✅ What Works
- Static assets (CSS, JS, images)
- Basic Laravel routing
- Database connections
- Simple CRUD operations

### ❌ What May Not Work
- File uploads (need cloud storage)
- Background jobs/queues
- Scheduled tasks
- Complex database operations
- Session storage (stateless)

### 🔧 Workarounds
1. **File Uploads**: Use cloud storage services
2. **Background Jobs**: Use external services (Laravel Horizon on separate server)
3. **Scheduled Tasks**: Use cron services (EasyCron, etc.)
4. **Sessions**: Use database or Redis sessions

## Alternative Recommendations

For Laravel applications, consider these alternatives:
1. **Railway** - Better for full-stack PHP apps
2. **Heroku** - Excellent Laravel support
3. **DigitalOcean App Platform** - Good for Laravel
4. **AWS Elastic Beanstalk** - Enterprise-grade
5. **Laravel Forge + VPS** - Full control

## Troubleshooting

### Common Issues:
1. **Database Connection**: Ensure cloud database is accessible
2. **File Permissions**: Vercel handles this automatically
3. **Environment Variables**: Double-check all variables are set
4. **Build Errors**: Check Vercel build logs

### Debug Mode:
Temporarily set `APP_DEBUG=true` to see detailed error messages.

## Support
- [Vercel Documentation](https://vercel.com/docs)
- [Laravel Documentation](https://laravel.com/docs)
- [Vercel Community](https://github.com/vercel/vercel/discussions)