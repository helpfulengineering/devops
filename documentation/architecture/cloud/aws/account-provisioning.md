# Howto: Provision AWS Accounts

This document describes how to provision AWS accounts within the Helpful Engineering organization.  This procedure
will focus on the accounts for a project, but should apply fairly generally.

Ironically, Control Tower does not have good automation support.  This procedure will be performed in the AWS console. 

## Steps

### Preparation

Prepare to provision the account by

* determining the 'official' name of the project, its Helpful Engineering Slack channel, and the project leaders' Slack 
handles
* asking the project team leads and DevOps team liaison whether the project has network dependencies that require a VPC  
* logging into the AWS SSO portal and verify you can use the `AWSAdministratorAccess` role of the `he-master` account; 
if you do not have this role, request assistance in the `#skill-software-devops` slack channel

### Provision

Log in to the `he-master` account with the `AWSAdministratorAccess` role.

Navigate to the [Control Tower console](https://us-east-2.console.aws.amazon.com/controltower/home?region=us-east-2).

Switch to the `us-east-2` region if you are not already there.  Note: Control Tower and the underlying Service Catalog
and CloudFormation services and account management resources are region-specific.  The necessary Service Catalog 
resources will not be found outside of `us-east-2`.

Select the 'Account Factory' option in Control Tower's left-hand navigation.

If the project requires a VPC, you will need to edit the factory's network configuration.  Click 'Edit.'  

First, increase the VPC address range's second octet by 1.  For example `172.17.0.0/16` should be 
incremented to `172.18.0.0/16`. The intended result is to provision non-overlapping /16-sized VPCs for each account.

Second, select one and only one region to deploy the VPC into.  Prefer the following regions:

* North America: US East Ohio (`us-east-2`)
* Europe: EU Ireland (`eu-west-1`)
* Asia: Asia Pacific Sydney (`ap-southeast-2`)

Now, save the configuration.

Construct the AWS account name from one of the following forms, all lower case: 

* project delivery account: `he-project-<project name>-<env name>`.  For example, the account for the 
'Monitoring O2' project's development environment is: `he-project-monitoring-o2-dev`
* another use case: `he-<usecase>`.  For example the sandbox's name is `he-sandbox2`

Back at the 'Account Factory' screen, click 'Enroll Account'.

Configure the account's root user email and SSO email to the devops team email address plus the AWS account name: `devops+he-project-<project name>-<env name>@qualimente.com`

Configure the display name to the AWS account with `<project name>-<env name>`.

Set the AWS SSO user name to first name 'Admin', last name '`<project name>`'
 
Select the 'Project Delivery' OU for a project delivery account, Custom otherwise.

Click 'Create Account'.

WAIT.

Wait until the account creation is done before trying to provision another account.  Control Tower can only provision
one account at a time and concurrent executions will fail.

Consider getting a beverage or taking a nap because account provisioning takes 20-40 minutes with Control Tower.

All done?  Let's see!

Navigate to the 'Accounts' section and check for a 'Ready' State for the newly provisioned account.   

### Provision Team Access to the Account

Navigate to the [AWS SSO console](https://us-east-2.console.aws.amazon.com/singlesignon/home?region=us-east-2#/dashboard).

Switch to the `us-east-2` region if you are not already there because AWS SSO is region-specific.

Create `he-<project name>-admins` and `he-<project name>-developer` groups in SSO if they do not already exist.  Assign
the DevOps liaison and project leaders to the admins group.  Assign all project team members that need access to the 
developer group. 

### Communicate

Jump into the project team's slack channel and tell the project leaders the accounts have been created.
 
Tell the project team how to login via AWS SSO.
    
