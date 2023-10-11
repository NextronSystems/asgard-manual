# Get current directory
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath

# Run the installer
$installer = "asgard2-agent-windows-amd64.exe"
Start-Process -Wait -FilePath "$dir\$installer" -WorkingDirectory $dir -WindowStyle Hidden -PassThru

# Timeout just to make sure the service is up and running
Timeout /T 15

# If the service exists, the script writes console output and exits with code 0
# If the service does not exist, the script writes an error output and exits with code 1
# See https://learn.microsoft.com/en-us/mem/configmgr/apps/deploy-use/create-applications#about-custom-script-detection-methods

$servicename = "asgard2-agent"
if (Get-Service -Name $servicename -ErrorAction SilentlyContinue) {
    Write-Host "ASGARD Agent installed"
    exit 0
} else {
    $Host.UI.WriteErrorLine("ASGARD Agent not installed")
    exit 1
}