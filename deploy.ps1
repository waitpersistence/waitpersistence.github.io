# --- Hexo One-Click Deploy & Source Backup Script ---

# 1. Clean and Generate Static Files
Write-Host "Cleaning cache and generating static files..." -ForegroundColor Cyan
hexo clean
hexo g

# 2. Deploy to GitHub Pages (main branch)
Write-Host "Deploying to GitHub Pages..." -ForegroundColor Cyan
hexo d

# 3. Backup Source Code to GitHub (source branch)
Write-Host "Backing up source code to 'source' branch..." -ForegroundColor Cyan

# Get current timestamp for default commit message
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitMsg = Read-Host "Enter commit message (Press Enter for default: $date)"

if ($commitMsg -eq "") {
    $commitMsg = "Update blog source: $date"
}

# Execute Git Commands
git add .
git commit -m "$commitMsg"
git push origin source

Write-Host "Success! Deployment and backup completed!" -ForegroundColor Green
Pause