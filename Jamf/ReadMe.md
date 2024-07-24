# Jamf

## Description
A combination of pre-install and post-install scripts with Jamf that uses a general outline of structuring scripts for packaging and deployment.
## Jamf Policy Configuration
- Upload the flattened package containing both the pre-install and main install scripts to Jamf.
- Configure a Jamf policy to deploy the package.
- Specify the pre-install script in the "Pre-Install" section of the Jamf policy.
- Specify the main install script in the "Post-Install" section of the Jamf policy.

This will help so that Jamf will execute the pre-install script before installing the main application. The pre-install script checks and installs any prerequisites required for the main application.


