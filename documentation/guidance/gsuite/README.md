# G Suite Accounts

![Diagram](/images/gsuite-account-diagram.svg)

## Types
Accounts can be divided in two major categories: personal accounts, and team accounts; the latter can be either collaborative inboxes (mail only) or purpose-specific accounts (other services).

![Account selection flowchart](/images/gsuite-account-selection-flowchart.png)

**Examples**
> `info@helpfulengineering.org`: collaborative inbox
> - Is a mail-only account (inherited from the old mail server)
> - Might be shared by several users

> `media@helpfulengineering.org`: purpose-specific account
> - Needs access to services other than mail (Analytics and Drive)
> - Might be shared by several users

> `rjohns@helpfulengineering.org`: personal account
> - Needs access to services other than mail (G Suite Admin)
> - Tied to a natural person


### Team accounts

###### Collaborative inboxes
In those cases where mailing is the only need for an «account», there is a much better alternative known as _collaborative inbox_, that allows multiple users to send and receive mail from their individual accounts without additional overhead. These shared inboxes can be<!-- hopefully --> easily managed through [Google Groups](https://groups.google.com/a/helpfulengineering.org/forum/#!myforums) or [through an external account](./collaborative-inbox-forwarding.md).

Those users that only need to manage a collaborative inbox can simply use an individual (external) account configured to send and receive mail on behalf of that inbox. This way, account management costs can be considerably reduced without negatively impacting the ease of use nor the granular access control to group-managed mail accounts.

###### Purpose-specific accounts
This kind of account, managed by one or many users through a [securely shared password](/documentation/guidance/credential-sharing.md), is not tied to any specific natural person and can be used by up to 4 concurrent users. <!-- just in case, to avoid tripping bot protection --> Its main purpose is enabling multiple or variable users to access Google-specific services like Analytics or Drive, and should not be requested when email is the only required service.

### Personal accounts
These full-fledged accounts, which are tied to a [natural person](https://en.wikipedia.org/wiki/Natural_person), can access all the G Suite products and, due to the implicit costs in many configurations, should be only used when group mailing is not an option.

## Naming
Though there were some exceptions in the early stages of the provisioning process, all the newly created personal accounts should be named following the well-known convention of concatenating the initial of the first name and the complete last name (*exempli gratia:* John Doe would have `jdoe@helpfulengineering.org` as user name). In the case where this convention produces duplication, additional letters from the first name should be used to generate a unique username: a second user with the name John Doe would result in an address of `jodoe@helpfulengineering.org`.

All the non-personal accounts and group mail inboxes should have short and descriptive names, unabbreviated whenever possible, which can be easily identified and understood by external users. This document doesn't intend to thoroughly cover naming styles, so simplicity and clarity are the only really important requirements in this case.

## Organizational units
Though it might change in a future, the current organization is structured as follows:
* `/individuals` -> natural persons.
* `/projects/example` -> members of the `example` project.
* `/teams` -> purpose-specific accounts.

## Administration
G Suite accounts are being managed through a Google Sheet which serves as frontend to a linked Terraform infrastructure repository. Any changes made to that spreadsheet will be commited to the `master` branch of the infrastructure repository, triggering a `terraform plan` and sending a Slack message to [#skill-software-devops](https://helpfulengineering.slack.com/archives/CV54M16QH) asking for human confirmation before running `terraform apply`. For more information, please check the documentation inside the spreadsheet itself and take a look to the [G Suite Infrastructure main repository](https://github.com/helpfulengineering/infrastructure-gsuite).



## User guides
* [**Collaborative inbox for users:** setting up forwarding](./collaborative-inbox-forwarding.md)
