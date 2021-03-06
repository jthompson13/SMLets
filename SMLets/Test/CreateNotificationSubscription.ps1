Import-Module SMLets -Force

$IncidentClass = Get-SCSMClass -Name System.Domain.User$
Write-Host "Got class $IncidentClass"
$User = Get-SCSMOBject -Class $IncidentClass -Filter "Username -eq administrator"
Write-Host "Got user $User"
$Template = Get-SCSMTemplate -Name AssignedToUserNotificationTemplate
Write-Host "Got template $Template"
$MP = Get-SCSMManagementPack -Name ManagementPack.2c73360c25da49a9a03d481e266f7342
WRite-Host "Got management pack $MP"

New-SCSMNotificationSubscription -Name "Travis Test Notification Subscription" -ManagementPack $MP -Recipients $User -NotificationTemplate $Template -OperationType Update -Class $IncidentClass

