# PostgreSQL Deployment Troubleshooting Guide

## Common Issues and Solutions

### 1. Database Connection Error
**Error**: `SQLSTATE[08006] [7] could not connect to server`
**Solution**: 
- Check Railway environment variables
- Ensure `DB_CONNECTION=pgsql`
- Verify PostgreSQL credentials from Railway dashboard

### 2. Missing PostgreSQL Extension
**Error**: `SQLSTATE[HY000] [2002] No such file or directory`
**Solution**:
- Added `ext-pgsql` to composer.json
- Railway should automatically install the extension

### 3. Migration Errors
**Error**: `SQLSTATE[42P01]: Undefined table`
**Solution**:
- Run migrations manually: `php artisan migrate --force`
- Check if database exists and is accessible

### 4. Environment Variables
Make sure these are set in Railway:
```
DB_CONNECTION=pgsql
DB_HOST=your-railway-pg-host
DB_PORT=your-railway-pg-port
DB_DATABASE=your-railway-pg-database
DB_USERNAME=your-railway-pg-username
DB_PASSWORD=your-railway-pg-password
```

### 5. Railway-Specific Steps
1. **Add PostgreSQL Plugin**:
   - Go to Railway dashboard
   - Click "New" → "Database" → "PostgreSQL"
   - Copy connection details

2. **Update Environment Variables**:
   - Use the PostgreSQL credentials from Railway
   - Set `DB_CONNECTION=pgsql`

3. **Redeploy**:
   - Push changes to GitHub
   - Railway will auto-deploy
   - Check deployment logs

### 6. Debug Mode
Temporarily set `APP_DEBUG=true` to see detailed error messages.

### 7. Check Railway Logs
- Go to Railway dashboard
- Check "Deployments" tab
- Look for error messages in logs

## Quick Fix Commands
```bash
# Clear all caches
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

# Regenerate config cache
php artisan config:cache

# Test database connection
php artisan tinker
DB::connection()->getPdo();
```

## Support
If issues persist, check Railway's documentation or contact their support. 