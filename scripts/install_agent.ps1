# Setting vars
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath
$installer = "asgard2-agent-windows-amd64.exe"
$servicename = "asgard2-agent"

# Checking if ASGARD Agent is already installed
if (Get-Service -Name $servicename -ErrorAction SilentlyContinue) {
    Write-Host "ASGARD Agent already installed, exiting"
    exit 0
} else {
    Write-Host "ASGARD Agent not found, trying to install..."

    # Install ASGARD Agent
    Start-Process -Wait -FilePath "$dir\$installer" -WorkingDirectory $dir -WindowStyle Hidden -PassThru

    # Timeout just to make sure the service is up and running
    Timeout /T 15

    # Checking service to see if agent was installed
    if (Get-Service -Name $servicename -ErrorAction SilentlyContinue) {
        Write-Host "Installed ASGARD Agent successfully"
        exit 0
    } else {
        $Host.UI.WriteErrorLine("Could not install ASGARD Agent")
        exit 1
    }
}