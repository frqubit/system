$REPO_DIR = (Get-Item .).FullName

$compress = @{
    Path = "$REPO_DIR\install.bat", "$REPO_DIR\windows"
    CompressionLevel = "Fastest"
    DestinationPath = "$REPO_DIR\install.zip"
}

Compress-Archive -Force @compress
