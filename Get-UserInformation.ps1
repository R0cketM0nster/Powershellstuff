<#.SYNOPSISGets user information
.DESCRIPTIONTakes username either as a parameter or from pipe and gives information on that user including:Pre-windows 2000 nameUsers nameLast password resetAccount lockedCreation date and by who
.PARAMETER usernameEnter the persons username. This can also be passed to by pipeline.
.EXAMPLEGet-UserInformation -username retailda2This will return information on the user account#>
Function Get-UserInformation 
{
    [CmdletBinding()]
    PARAM 
    (
        [Parameter(Mandatory = $true,Position = 0,valueFromPipeline=$true)]
        $User
    )
    Get-ADUser -Filter {samaccountname -eq $User -or displayname -like $User} -Properties * |
        Select-Object Name, @{Name="User Name"; Expression = {$_.samaccountname}}, @{Name="Email Address"; Expression = {$_.EmailAddress}},
            Enabled, @{Name="Locked out"; Expression = {$_.Lockedout}},@{Name="Password Expired"; Expression = {$_.PasswordExpired}},
                @{Name="Password Last Set"; Expression = {$_.PasswordLastSet}},
                    @{Name="Password Expires"; Expression = {$_.PasswordLastSet.addmonths(6).tostring("d/MM/yyyy h:mm:ss tt")}}, 
                        @{Name="Created by"; Expression = {$_.info}} | Format-List
}
