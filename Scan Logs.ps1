


$servers = Get-ADComputer -Filter *


$servers | ForEach-Object {

    $Events = $null
    Write-Host Scanning $_.name
    #$_.Name
    $Events = Get-EventLog -LogName 'Windows PowerShell' -ComputerName $_.name | Where-Object {($_.EventID -eq 400) -and ($_.Message -like "*psattack.exe*")} 
    #$Events | Where-Object {$_.Message -like "*psattack.exe*"}
    if ($Events -ne $null) {
        Write-Host "Found ($Events).count"
    }
}




$servers | ForEach-Object {

    $Events = $null
    Write-Host Scanning $_.name

    Test-NetConnection -ComputerName $_.name -CommonTCPPort SMB

    if ($Events -ne $null) {
        Write-Host "Found ($Events).count"
    }
}





