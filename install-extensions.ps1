$extensions = @(
    "dbaeumer.vscode-eslint",           # ESLint
    "esbenp.prettier-vscode",           # Prettier
    "bradlc.vscode-tailwindcss",        # Tailwind CSS IntelliSense
    "eamodio.gitlens",                  # GitLens
    "formulahendry.auto-rename-tag",    # Auto Rename Tag
    "naumovs.color-highlight",          # Color Highlight
    "christian-kohler.path-intellisense", # Path Intellisense
    "mikestead.dotenv",                 # DotENV
    "dsznajder.es7-react-js-snippets"   # React/Next.js Snippets
)

foreach ($extension in $extensions) {
    Write-Host "Installing $extension..."
    code --install-extension $extension
} 