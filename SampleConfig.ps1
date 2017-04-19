
<#PSScriptInfo

.VERSION 1.0.0.0

.GUID 08b1d249-5522-40f8-94b4-37e46a6555b3

.AUTHOR Michael Greene

.COMPANYNAME Microsoft

.COPYRIGHT 

.TAGS DSC Config

.LICENSEURI https://github.com/PowerShell/DscConfigurations/blob/master/LICENSE

.PROJECTURI https://github.com/PowerShell/DscConfigurations/

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES


#>

<# 

.DESCRIPTION 
 This is a simple example of a script that contains a PowerShell DSC Configuration but does not include any additional assets such as tests or documentation. 

#> 

Configuration SampleConfig {

    Registry WUServer {
        Key         = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate'
        ValueName   = 'WUServer'
        ValueData   = 'http://mywsusserver.mydomain.local'
        ValueType   = 'String'
        Ensure      = 'Present'
    }

    Registry WUStatusServer {
        Key         = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate'
        ValueName   = 'WUStatusServer'
        ValueData   = 'http://mywsusserver.mydomain.local'
        Ensure      = 'Present'
    }

}
