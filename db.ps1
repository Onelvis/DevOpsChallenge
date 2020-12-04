# Author: Onelvis de la Rosa
# Date: November 21th 2020

echo "Getting SQL Server instance's information"
[reflection.assembly]::LoadWithPartialName("Microsoft.SqlServer.Smo")
$server = new-object ("Microsoft.SqlServer.Management.Smo.Server") "localhost"

$dbExists = $FALSE
foreach ($db in $server.databases) {
  if ($db.name -eq "RobertChallenge") {
    Write-Host "Db already exists."
    $dbExists = $TRUE
  }
}

if ($dbExists -eq $FALSE) {
  $db = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Database -argumentlist $server, "RobertChallenge"
  $db.Create()

  $user = "NT AUTHORITY\NETWORK SERVICE"
  $usr = New-Object -TypeName Microsoft.SqlServer.Management.Smo.User -argumentlist $db, $user
  $usr.Login = $user
  $usr.Create()

  $role = $db.Roles["db_datareader"]
  $role.AddMember($user)
Invoke-SqlCmd -ServerInstance localhost -Database RobertChallenge -InputFile .\src\InitializeDatabase.sql
}
