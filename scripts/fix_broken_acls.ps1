$asgardAgent = "C:\Windows\System32\asgard2-agent"
$asgardAgentTemp = "C:\Windows\Temp\asgard2-agent"

if (Get-Item -Path $asgardAgent | Get-Acl | where {$_.Access.IsInherited -eq $false}) {
    Write-Host "ASGARD Agent folder permission broken. Trying to fix: $asgardAgent"
    # Set the new Access Rule to inherit permissions
    $newAcl = Get-Acl -Path $asgardAgent
    $newAcl.SetAccessRuleProtection($false, $true)
    Set-Acl $asgardAgent -AclObject $newAcl -WhatIf
}
if (Get-Item -Path $asgardAgentTemp | Get-Acl | where {$_.Access.IsInherited -eq $false}) {
    Write-Host "ASGARD Agent folder permission broken. Trying to fix: $asgardAgentTemp"
    # Set the new Access Rule to inherit permissions
    $newAcl = Get-Acl -Path $asgardAgentTemp
    $newAcl.SetAccessRuleProtection($false, $true)
    Set-Acl $asgardAgentTemp -AclObject $newAcl -WhatIf
}
get-childitem -path $asgardAgent -Recurse -Depth 1 | Get-Acl | where {$_.Access.IsInherited -eq $false} | % {
    $fullPath = Convert-Path $_.Path
    Write-Host "ASGARD Agent folder permission broken. Trying to fix: $fullPath"
    # Set the new Access Rule to inherit permissions
    $newAcl = Get-Acl -Path $_.Path
    $newAcl.SetAccessRuleProtection($false, $true)
    Set-Acl $_.Path -AclObject $newAcl -WhatIf
}