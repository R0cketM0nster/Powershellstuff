function Get-LoggedOnUser
{
    [cmdletbinding()]
    param    
    (        
        [parameter(Mandatory=$true)]
        $ComputerName    
    )    
    
    Get-CimInstance -ClassName win32_computersystem -ComputerName $computername | select -ExpandProperty username -OutVariable a | Out-Null    
    $a.substring(10)
}
