function Get-IMDBData
{    
    [cmdletbinding()]
    Param    
    (        
        $Actor    
    )    
    BEGIN{}    
    PROCESS
    {                
        $ActorID = Get-ActorID $Actor        
        Get-BasicActorInfo $ActorID             
    }    
    END{}
}
#6280842e-275a-4daf-9243-c99aa842a1a6
Function Get-ActorID
{
    [cmdletbinding()]
    Param    
    (        
        $Actor
    )
    BEGIN{}
    PROCESS
    {
        $Actor = $Actor -join "+"
        irm "http://imdb.wemakesites.net/api/search?q=$actor&api_key=6280842e-275a-4daf-9243-c99aa842a1a6" -ov Basicinfo | Out-Null
        $Basicinfo.data.results.names | where {$_.title -eq $Actor} | select -ExpandProperty id
    }    
    END{}
}

Function Get-BasicActorInfo
{
    [cmdletbinding()]
    Param    
    (
        $ActorID
    )    
    BEGIN{}
    PROCESS
    {
        irm "imdb.wemakesites.net/api/$actorid`?api_key=6280842e-275a-4daf-9243-c99aa842a1a6" -ov Basicinfo |Out-Null
        $basicinfo.data | fl @{l="Name";E={$_.title}},Description -Force 
        $Basicinfo.data.filmography         
    }
    END{}
}
