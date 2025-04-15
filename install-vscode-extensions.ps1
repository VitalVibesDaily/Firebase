# VS Code extensions to install
$extensions = @(
    "dbaeumer.vscode-eslint",
    "esbenp.prettier-vscode",
    "bradlc.vscode-tailwindcss",
    "ms-vscode.vscode-typescript-next",
    "eamodio.gitlens",
    "formulahendry.auto-rename-tag",
    "naumovs.color-highlight",
    "christian-kohler.path-intellisense",
    "mikestead.dotenv"
)

# Install each extension
foreach ($extension in $extensions) {
    code --install-extension $extension
} 