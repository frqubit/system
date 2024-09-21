$REPO_DIR = (Get-Item .).FullName

function Choco-Install {
    param ($pkg_name, $test_for)
    
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = 'stop'

    try {
        if (Get-Command $test_for) {
            Write-Host "$pkg_name is already installed!"
        }
    } catch {
        choco install $pkg_name
    }
}

try {
    if (Get-Command choco) {
        Write-Host "Choco is installed! Installing packages..."

        choco install `
            git googlechrome vscode discord `
            krita kdenlive obs-studio audacity `
            blender spotify `
            -y
    }
} Catch {
    powershell.exe "$REPO_DIR\windows\scripts\chocolatey.ps1"
}

powershell.exe "$REPO_DIR\windows\scripts\disable_onedrive.ps1"
