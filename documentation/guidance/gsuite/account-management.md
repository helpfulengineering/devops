# G Suite Account Management

This administration guide will help you to get started with the basic G Suite administration and account management procedures.

## Infrastructure as a Spreadsheet (IaS)
All the G Suite user, group and organizational unit definitions are being controlled through [this spreadsheet](https://docs.google.com/spreadsheets/d/1NuPuDNSh1afVFQP8oe9i_fLPqftys7-eTd3_5h663cQ/edit), which serves as data provider to the [infrastructure-gsuite](https://github.com/helpfulengineering/infrastructure-gsuite) Terraform repository (hence the tongue-in-cheek IaS name).

### Adding users to a collaborative inbox
The `Aliases / Members` field of the spreadsheet defines the members for a given group (collaborative inbox). It's a newline-separated list that you can extend by pressing <kbd>Alt</kbd> + <kbd>Enter</kbd>.
