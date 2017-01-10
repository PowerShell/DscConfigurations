# Requirements

Configuration modules should meet a minimum baseline including integration tests and documentation.

Additional information on contributing to the DSC Configurations repository can be found in the following DSC Resource topics:

 - [How to submit a new module](https://github.com/PowerShell/DscResources/blob/master/NewResourceModuleSubmissions.md)
 - [Getting started with GitHub](https://github.com/PowerShell/DscResources/blob/master/GettingStartedWithGitHub.md)
 - [Getting started with Pester](https://github.com/PowerShell/DscResources/blob/master/GettingStartedWithPester.md)

## Integration Tests

DSC Configurations that are owned by the PowerShell Team and published to the gallery must be tested to verify functionality.
Every change should results in the build service running a set of quality **Integration** tests.
The integration tests verify that the AppVeyor service can successfully deploy the solution and run Get, Set, and Test without error.

## Acceptance Tests

If possible, Configuration modules can also include **Acceptance** tests that verify the functionality of the solution after it is deployed.
An example of an acceptance test would be loading a web page and verifying the content.

## Documentation

Solutions provided by Configuration modules should include a ReadMe file with more information.
At minimum, this includes:
  - A description of the current scope for the module.
  - List of the configurations included in the module.
  - Overview and requirements for each configuration.
  - Release notes that identify what changes across each version in the module release history.


| Criterion | Details | Developer Story | Validation |
|-----------|---------|-----------------|------------|
| [PS Script Analyzer](https://github.com/PowerShell/PSScriptAnalyzer) is clean | <ul><li>All mandatory rules pass and flagged rules pass or have been overridden for resources and examples. For now, warnings/information level violations are okay in tests, but there must be no error-level violations anywhere.</li></ul> | If there are any rules that aren't passing they will show up as an error when the common tests are run. Any messages that show up as warning/flagged must be fixed, in a few cases they can be overridden with permission from a DSC team member. | PSSA errors are checked in the common tests. |
| Integration and Acceptance Tests are functional and follow the guidelines | <ul><li>There should be an integration test file for each configuration (under Tests\Integration)</li><li>[Test guidelines](https://github.com/PowerShell/DscResources/blob/master/TestsGuidelines.md ) are being followed</li><li>Tests use [test templates](https://github.com/PowerShell/DscConfiguration/tree/master/Tests.Template)</li><li>Tests are written using [Pester test framework](https://github.com/pester/pester)</li><li>Tests are integrated with appveyor</li></ul> | The configuration is proven to deliver a working configuration that delivers the intended functionality, and the solution can be replicated easily by anyone else. | All configurations will be checked by the common Get/Set/Test tests (100% coverage, no outside dependencies) |
| Configuration is well-documented and free of commented out code and TODOs | <ul><li>There is a README.md file (should follow [readme.md template](https://github.com/PowerShell/DscConfigurations/blob/master/DscResource.Template/README.md)) which gives an overview of the module - what it does, how to use it, requirements for the environment needed to run the module, etc.</li><li>Code is also sufficiently commented so that it is easy to follow what's going on.</li></ul> | Each time the module is updated, the version must also be updated and include comments on the changes. | There will be a check that a README.md file exists, but the clarity, completeness, and cleanliness of this document will need to be manually reviewed. |
| The module follows a set uniform folder and file format | <ul><li> In the root folder there is a 'Tests' Folder with both a 'Unit' and an 'Integration' subfolder. </li><li> In the root folder there is an 'Examples' folder with at least one simple example file as well as an optional subfolder with any example files that contain outside dependencies. </li><li> In the root folder there is a 'DSCResources' folder that contains all the resources contained in their own folder. Within each resource folder there is a schema.mof file. </li><li> The root folder contains a file: moduleName.psd1 with proper structure (defines ProjectUri, LicenseUri and Tags) </li><li>Correct license document present (MIT license recommended)</li></ul> | Ensure this format is followed | There will be a test to check to make sure the module follows this folder format |
| Module does not require git to use | <ul><li>If the module uses git anywhere, there must be an alternative for the user so that the module can be used on a machine with/without git.</li></ul> | Ensure that git is not necessary anywhere in the code | There will be a test for this - if git commands are used anywhere then they will be flagged for review - in some instances it is okay as long as it's not necessary to run the module |
