Get-Date
Get-WmiObject -Class Win32_LogicalDisk

function Get-OSInfo {
$os_info = Get-WmiObject -Class Win32_OperatingSystem
$version_number = $os_info.Version.Substring(0, $os_info.Version.LastIndexOf('.'))
$version_text = Get-VersionText -version_number $version_number

Write-Host "You are running $version_text"

}

function Get-VersionText {
param([double]$version_number)

    Switch($version_number){
        
        10{$versionText = 'Windows 10'}

        6.3 {$versionText = 'Windows 8.1 or Server 2012 R2'}

        6.2 {$versionText = 'Windows 8 or Server 2012'}

        6.1 {$versionText = 'Windows 7 or Server 2008 R2'}

        6.0 {$versionText = 'Windows Vista or Server 2008'}

        5.2 {$versionText = 'Windows Server 2003/2003 R2'}

        5.1 {$versionText = 'Windows XP'}

        5.0 {$versionText = 'Windows 2000'}

    }
    Return $version_text
}