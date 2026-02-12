#!/bin/bash

# GitHub Deployment Setup Script
echo "🚀 GitHub Pages Deployment Setup Script"
echo "====================================="

# Get GitHub username
echo "Please enter your GitHub username:"
read username

# Repository name
repo_name="ray-panganiban-3d-portfolio"

echo ""
echo "Setting up repository: $repo_name"
echo "Username: $username"
echo ""

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
    echo "📁 Initializing Git repository..."
    git init
else
    echo "✅ Git repository already exists"
fi

# Add files and make initial commit
echo "📝 Adding files and making initial commit..."
git add .
git commit -m "Initial commit - 3D Portfolio Website with GitHub Pages setup"

# Check if remote already exists
if git remote get-url origin > /dev/null 2>&1; then
    echo "✅ Remote origin already exists"
    git remote set-url origin https://github.com/$username/$repo_name.git
else
    echo "🔗 Adding remote origin..."
    git remote add origin https://github.com/$username/$repo_name.git
fi

echo ""
echo "🎯 Setup complete! Next steps:"
echo ""
echo "1. Create repository at: https://github.com/new"
echo "   Repository name: $repo_name"
echo "   Make it PUBLIC"
echo ""
echo "2. Push to GitHub:"
echo "   git push -u origin main"
echo ""
echo "3. Enable GitHub Pages:"
echo "   - Go to your repository → Settings → Pages"
echo "   - Source: Deploy from a branch"
echo "   - Branch: gh-pages"
echo ""
echo "4. Deploy website:"
echo "   npm run deploy"
echo ""
echo "🌐 Your website will be available at:"
echo "https://$username.github.io/$repo_name/"