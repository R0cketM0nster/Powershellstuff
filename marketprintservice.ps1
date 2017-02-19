$PcName = Read-Host "PC Name"
$MServ = gsv -ComputerName $PcName -Name marketprintservice

Try{    
	if($MServ | where {$_.Status -eq "stopped"}) 
    {    
        $MServ | Start-Service
        Write-Output "Service $($MServ.ServiceName) is now $($MServ.Status)"    
    }    
    else
    {   
        Write-Warning "No Change - Service Already Running"}}Catch{    Write-Warning "Either the PC name is wrong or MarketPrintService could not be started"    
    }
