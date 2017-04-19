# DSC Configurations

[![Join the chat at https://gitter.im/PowerShell/DscResources](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/PowerShell/DscResources?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Windows PowerShell Desired State Configuration (DSC) provides a configuration platform that is based on open standards.
This repo provides a structured listing of **DSC Configurations** and guidance for Open Source community contribution.
For information about the scripts that perform work described by Configurations, see the GitHub repo for [DSC Resources](http://github.com/powershell/dscresources). 

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

# Sharing Configurations
## Publishing a config to the Gallery should be done in one of these ways:

### Configuration Script
If the Config is a script, create and require in the Script a separate module that contains the docs, help, examples, & tests. 
This ensures when the script is published or downloaded using PSGet cmdlets, the module will be brought along.

You **must** use the RequiredModule metadata to specify the linked module.

If there is a separate Config Data (PSD1) file, it belongs in the module. You **must** document how it is used.

You **should** include a line generating the MOF in the script.

You **may** include the Start-DscConfiguration command in the script. This means the script will be complete, but the deployment will start on script execution when it may or may not be appropriate in the user’s environment. 

### Composite Resource
If the Config is a Composite Resource, publish as a module that contains all the other items. 
You **should** consider publishing a script that uses the composite resource as in the preceeding option.

## Sharing relies on completing important metadata 
```New-ModuleManifest``` and ```New-ScriptFileInfo``` will generate the placeholders for the metadata needed.

All items published to the Gallery **must** have the correct metadata filled in for:
- Author
- Description
- Version
- Company name
- Copyright. 

You **should** consider associating DSC resources with your configuration by using RequiredModule statements. 
This is a general best practice, as it allows users to make a single call to the gallery to geet all preqrequisites for running the script. However, there may be situations where it is incorrect.

If you are using the DSCConfiguration.Tests repo to automate hosting tests on Azure VM's, you **should** also populate the a new property in PSPrivateData named "WindowsOSVersion" and set the value to one of the strings supported by AzureRM.

# Authoring guidelines

The [DSC Resource repository](http://github.com/powershell/dscresources) includes guidance on authoring that is applicable to configurations as well.
For more information, visit the links below:

 - [Best practices](https://github.com/PowerShell/DscResources/blob/master/BestPractices.md)
 - [Style guidelines](https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines.md)
 - [Maintainers](https://github.com/PowerShell/DscResources/blob/master/Maintainers.md)


# Community Discussion

There is a monthly community call hosted on Skype where new submissions and technical topics are discussed.
For more information visit the topic [Community Agenda](https://github.com/PowerShell/DscResources/blob/master/CommunityAgenda.md).
