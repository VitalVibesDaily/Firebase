# Vital Vibes Daily - Development Setup

## Prerequisites
- Node.js (v18 or higher)
- XAMPP (Apache, MySQL, PHP)
- Git
- Visual Studio Code

## Development Environment

### Local Development URLs
- Next.js Development Server: http://127.0.0.1:3001
- XAMPP Local Server: http://vitalvibesdaily.local

### Starting Development
1. Run the development script:
   ```powershell
   .\start-dev.ps1
   ```
   This will:
   - Start the Next.js development server
   - Open XAMPP Control Panel

2. In XAMPP Control Panel:
   - Start Apache
   - Start MySQL

### VS Code Extensions
Make sure you have these extensions installed:
- ESLint
- Prettier
- Tailwind CSS IntelliSense
- TypeScript and JavaScript Language Features
- GitLens
- Auto Rename Tag
- Color Highlight
- Path Intellisense
- DotENV

### Git Configuration
Git is configured with:
- Name: Jzineldin
- Email: Jzineldin.ai@gmail.com

### Environment Setup
1. Hosts file entry:
   ```
   127.0.0.1 vitalvibesdaily.local
   ```

2. XAMPP Virtual Host:
   - Document Root: C:/Users/Jzine/Documents/vitalvibesdaily1-main
   - Server Name: vitalvibesdaily.local

## Development Workflow
1. Start development environment using `start-dev.ps1`
2. Make changes to your code
3. Test changes in browser
4. Commit changes using Git
5. Push changes to repository

## Troubleshooting
- If Next.js port 3000 is in use, it will automatically use port 3001
- If XAMPP services fail to start, check if ports 80 and 3306 are in use
- If local domain doesn't work, verify hosts file entry

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.
