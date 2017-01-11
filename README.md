# DSC Configurations

[![Join the chat at https://gitter.im/PowerShell/DscResources](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/PowerShell/DscResources?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Windows PowerShell Desired State Configuration (DSC) provides a configuration platform that is based on open standards.
This repo provides a structured listing of **DSC Configurations** and guidance for Open Source community contribution.
For information about the scripts that perform work described by Configurations, see the GitHub repo for [DSC Resources](http://github.com/powershell/dscresources). 

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## What is a DSC Configuration?

A DSC Configuration describes the state of a computer in a declarative syntax.
PowerShell provides a language extension for authoring configurations in a format that should be easily understood by anyone (even if they are not familiar with PowerShell).
A configuration file is composed of DSC Resources, which are installed on the computer as PowerShell Modules.
The DSC Resources handle tasks associated with performing work on the computer, and are surfaced in the configuration as a set of properties.
As a result, authors maintaining a configuration are able to deliver functionality in a consistent fashion without becoming a subject matter expert.

As an example, a simple configuration that enables the web server feature on a Windows Server would be:

```PowerShell
Configuration WebServer
{
    WindowsFeature WebServerFeature
    {
        Ensure = 'Present'
        Name   = 'Web-Server'
    }
}
```

# Configuration Modules

Configurations shared in submodules of this repo should follow a design pattern based on PowerShell modules.

Configurations should be stored in .PSM1 files, as opposed to .PS1 files.
Configurations may share a module, meaning the dependencies for the module will list all resources across all included configurations.
For example, if there are 3 methods of installing and configuring a solution, include the configurations in a single module file.

Configurations often rely on complex expressions of configuration data.
Where appropriate, configuration modules should include a subfolder 'Examples' that demonstrate how to generate a .mof file using sample configuration data, or parameters.  

The module should also include a .PSD1 file that provides version information, metadata, and the dependencies for the Configuration.
Dependencies would include a list of DSC Resources that are required for the Configuration to function.

The repo and module name should be based on the scenario that will be deployed and configured, followed by "Config".
For example, a configuration for an IIS web server would be delivered as part of a module with a name such as "IISConfig" or "WebConfig".

# Authoring guidelines

The [DSC Resource repository](http://github.com/powershell/dscresources) includes guidance on authoring that is applicable to configurations as well.
For more information, visit the links below:

 - [Best practices](https://github.com/PowerShell/DscResources/blob/master/BestPractices.md)
 - [Style guidelines](https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines.md)
 - [Maintainers](https://github.com/PowerShell/DscResources/blob/master/Maintainers.md)

# Contributing

For details on how to contribute a module to this repo, see [Contributing.md](./CONTRIBUTING.md)

# Community Discussion

There is a monthly community call hosted on Skype where new submissions and technical topics are discussed.
For more information visit the topic [Community Agenda](https://github.com/PowerShell/DscResources/blob/master/CommunityAgenda.md).
