# --- Hexo 一键发布与源码备份脚本 ---

# 1. 清理并生成静态文件
Write-Host "正在清理缓存并生成静态网页..." -ForegroundColor Cyan
hexo clean
hexo g

# 2. 部署到 GitHub Pages (main 分支)
Write-Host "正在部署到 GitHub Pages..." -ForegroundColor Cyan
hexo d

# 3. 备份源码到 GitHub (source 分支)
Write-Host "正在备份源码到 source 分支..." -ForegroundColor Cyan

# 获取当前时间作为默认提交信息
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$commitMsg = Read-Host "请输入提交信息 (直接回车将使用默认时间: $date)"

if ($commitMsg -eq "") {
    $commitMsg = "Update blog source: $date"
}

# 执行 Git 提交
git add .
git commit -m "$commitMsg"
git push origin source

Write-Host "恭喜！网页部署与源码备份均已完成！" -ForegroundColor Green
Pause