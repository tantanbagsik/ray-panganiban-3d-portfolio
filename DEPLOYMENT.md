# GitHub Pages Deployment Guide

## Prerequisites
- GitHub account
- Git installed on your machine
- Node.js and npm installed

## Step 1: Create GitHub Repository
1. Go to [GitHub](https://github.com) and sign in
2. Click the "+" button in the top right corner
3. Select "New repository"
4. Name your repository: `ray-panganiban-3d-portfolio`
5. Make sure it's set to "Public"
6. Click "Create repository"

## Step 2: Initialize Git Repository
```bash
# Initialize git in your project
git init

# Add all files
git add .

# Make initial commit
git commit -m "Initial commit - 3D Portfolio Website"
```

## Step 3: Connect to Remote Repository
```bash
# Add your GitHub repository as remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/ray-panganiban-3d-portfolio.git

# Push to GitHub
git push -u origin main
```

## Step 4: Enable GitHub Pages
1. Go to your repository on GitHub
2. Click on "Settings" tab
3. Scroll down to "Pages" section in the left sidebar
4. Under "Build and deployment", set "Source" to "Deploy from a branch"
5. Select "gh-pages" as the branch
6. Click "Save"

## Step 5: Deploy Your Website
```bash
# Install dependencies (if not already done)
npm install

# Deploy to GitHub Pages
npm run deploy
```

## Step 6: Access Your Website
Your website will be available at:
`https://YOUR_USERNAME.github.io/ray-panganiban-3d-portfolio/`

## Alternative: Manual Deployment without gh-pages
If the above method doesn't work, you can deploy manually:

1. Build the project:
```bash
npm run build
```

2. The build files will be in the `dist/` folder
3. Go to GitHub repository → Settings → Pages
4. Select "Deploy from a branch"
5. Choose "main" branch and "/docs" folder
6. Rename `dist` to `docs` and commit

## Troubleshooting
- **404 errors**: Make sure the `base` path in `vite.config.ts` matches your repository name
- **White screen**: Check the browser console for path issues
- **Assets not loading**: Verify all image paths are correct

## Automatic Deployment with GitHub Actions
For automatic deployment on every push:

1. Create `.github/workflows/deploy.yml`:
```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'
        cache: 'npm'
    
    - name: Install dependencies
      run: npm ci
    
    - name: Build
      run: npm run build
    
    - name: Deploy
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./dist
```

2. Commit and push this file
3. GitHub will automatically deploy on every push to main branch