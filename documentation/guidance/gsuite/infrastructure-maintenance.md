# G Suite Infrastructure Maintenance

This administration guide will help you to get started with the basic G Suite infrastructure maintenance procedures.

## Terraform
All the G Suite infrastructure is being managed through the [infrastructure-gsuite](https://github.com/helpfulengineering/infrastructure-gsuite) repository.

### Provider
Internally, the infrastructure is being managed through a custom provider hosted inside the [terraform-provider-gsuite](https://github.com/helpfulengineering/terraform-provider-gsuite) repository. If you ever need to modify it, please take a look to the latest commits by `0x2b3bfa0` and don't forget to update the binaries inside the `built-plugin` branch: they are being loaded as a `git submodule` by the infrastructure repository.

***

## Security

### Accounts

All the G Suite infrastructure automation tasks are being performed from these accounts:

1. Terraform *super administrator* G Suite account: owns the spreadsheet and has full access to the G Suite administration panel.

2. Auxiliary [GCP project](https://console.cloud.google.com/getting-started?project=g-suite-terraform-279610) service account: can read and write to the spreadsheet and impersonate (**1**) through [domain wide delegation](https://admin.google.com/u/4/ac/owl/domainwidedelegation?hl=en) in order to `terraform` the G Suite resources.


The service account (**2**) credentials are being stored as write-only environment variable secrets on the `infrastructure-gsuite` [GitHub repository](https://github.com/helpfulengineering/infrastructure-gsuite/settings/secrets) and on the `infrastructure-gsuite` [Terraform workspace](https://app.terraform.io/app/helpfulengineering/workspaces/infrastructure-gsuite/runs).

> :warning: These accounts are not meant to be used directly and you **don't** need to know their credentials in order to perform user management nor basic maintenance tasks; they're needed just for internal development of the Terraform provider. If you ever need them, just ask for access to the Helpful Engineering [Google 1Password vault](https://start.1password.com/open/i?a=J3YBD4VIJZGH3ORXYSVY6UUFXY&h=helpfulengineering.1password.com&i=nmlfxmdqp5ejzbb42x5fanz3p4&v=brpvigfbzutlo5cnfvolyeikji).

### Scopes

The service account (**2**) listed above requires the following OAuth scopes added to the [domain wide delegation](https://admin.google.com/u/4/ac/owl/domainwidedelegation?hl=en) settings in order to work:

* https://www.googleapis.com/auth/admin.directory.orgunit
* https://www.googleapis.com/auth/admin.directory.group
* https://www.googleapis.com/auth/admin.directory.user
* https://www.googleapis.com/auth/apps.groups.settings
* https://www.googleapis.com/auth/apps.licensing

If you believe the list above is outdated, please look into the [infrastructure-gsuite `main.tf` file](https://github.com/helpfulengineering/infrastructure-gsuite/blob/master/main.tf#L9-L15).
