# G Suite Account Management

This administration guide will help you to get started with the basic G Suite administration and account management procedures.

## The process
### User-oriented template
[This sheet](https://docs.google.com/spreadsheets/d/1DkFzpWWR9FbmDZ281I7U6KoeaEJd42L2TgG-II1YR4o/edit), owned by [Craig Sharp](https://helpfulengineering.slack.com/archives/D011RS8SK89), is where the `operations` team can freely [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) their infrastructure.

For each modification of the previous state, users will add a new record setting the `action` field accordingly (either `create`, `update` or `delete`), and you'll only need to paste the values into the main IaS sheet and tick the `done` box to keep track of what changes have been applied.

### Infrastructure as a Spreadsheet (IaS)
All the G Suite user, group and organizational unit definitions are being controlled through the [IaS spreadsheet](https://docs.google.com/spreadsheets/d/1NuPuDNSh1afVFQP8oe9i_fLPqftys7-eTd3_5h663cQ/edit), which serves as data provider to the [infrastructure-gsuite](https://github.com/helpfulengineering/infrastructure-gsuite) Terraform repository (hence the tongue-in-cheek IaS name).

This sheet provides a declarative way to specify G Suite account state. You just need to put into it the desired state of all the accounts and groups, and, once you check the `apply` box, the GitHub Action in the `infrastructure-gsuite` repository will perform the required updates through the G Suite API.

> :book: Please note that, due to the lack of mail support for the spreadsheet owner account, the only ways of requesting access are through a current member or by logging in with the [owner credentials](https://start.1password.com/open/i?a=J3YBD4VIJZGH3ORXYSVY6UUFXY&h=helpfulengineering.1password.com&i=nmlfxmdqp5ejzbb42x5fanz3p4&v=brpvigfbzutlo5cnfvolyeikji) and inviting yourself.

### End-to-end flow example
1. End users request a change (e.g. create a new user) by adding a new record to the [user-oriented template](#user-oriented-template) with the `action` field set to `create` and send a Slack message to #skill-software-devops.

2. The DevOps team makes the change (adds a row in this example) in the [IaS spreadsheet](#infrastructure-as-a-spreadsheet-ias) and it gets automatically applied by a script. Additionally, in the "user create" case, the administrator should issue a password reset from the G Suite administration and send a Slack direct message to the new user with the account details. Finally, the administrator ticks the `done` box in each user-oriented template record.
## Common operations

### Creating users

Just add a new record to the IaS spreadsheet following this template:

| Address    | Aliases / Members    | First Name | Last Name | Organizational Unit | Type | License |
| ------- | ----------------- | ---------- | --------- | ------------------- | ---- | ------- |
| jdoe@helpfulengineering.org | | John | Doe | `/individuals` | Personal account | Business |

Please note that accounts with a `business` license cost $12 per month and are the only accounts that have access to a private mail inbox (G Suite Gmail). If the user only needs to access collaborative inboxes through Google Groups, you can use a `standard` license instead, but all the messages sent to their personal `address` will be rejected.

You can notify the newly created users, by sending a Slack direct message following this template:

> **Your personal G Suite account has been enabled**
> Please log in with the following information through https://accounts.google.com
> * User: `name@helpfulengineering.org`
> * Password: `******`

You'll need to create a temporary password through the [administration console](https://admin.google.com/ac/users) by issuing a password reset for the newly created users, so they can set a new password when logging in for the first time. Please keep both `automatically generate a password` and `ask for a password change at the next sign-in` options enabled to avoid unnecessary security weaknesses.

### Deleting users

Just delete the pertaining record from the IaS spreadsheet and the user will get permanently removed.

Before deleting an account, it would be nice to send a Slack direct message to the affected user following this template:

> **Your personal G Suite account will be deleted soon**
> If you want to preserve its contents, please visit https://takeout.google.com, download all your data and reply to this message once you're done so we can proceed.
>
> If you don't reply to this message after two business days, we'll assume that the account can be readily deleted.

:warning: **Warning:** this is a destructive action that can not be undone.

### Creating collaborative inboxes

Just add a new record to the IaS spreadsheet following this template:

| Address    | Aliases / Members    | First Name | Last Name | Organizational Unit | Type | License |
| ------- | ----------------- | ---------- | --------- | ------------------- | ---- | ------- |
| example@helpfulengineering.org | jdoe@helpfulengineering.org<br>jsmith@gmail.com | Helpful Engineering | Example |  | Collaborative inbox | Standard |

Please notify the newly added `members` (if any) as suggested in the next sections. Some users may not know how to configure nor use their collaborative inbox.

### Adding users to a collaborative inbox
The `Aliases / Members` field of the IaS spreadsheet defines the members for a given group (collaborative inbox) through a newline-separated list that you can extend by pressing <kbd>Alt</kbd> + <kbd>Enter</kbd>. All the members on this list will receive the messages sent to the associated collaborative inbox address and, optionally, will be able to send messages on behalf of that address through [Google Groups](https://groups.google.com) (only valid for domain users) or by setting up a [secondary outbound address](./collaborative-inbox-forwarding.md) on their personal account (also valid for `@gmail.com` addresses).

If you add new members to one or more collaborative inboxes, you can send them a Slack direct message following this template:

> **Your personal account `user@domain` has been added to the following G Suite collaborative inboxes:**
>
> * `collaborative.inbox@helpfulengineering.org`
>
> **What is a collaborative inbox?**
> It’s like an email address that can be used by many people at the same time; messages will be sent on behalf of the public-facing addresses listed above.
>
> **How do I integrate it with my existing account?**
> Please follow [this guide](https://github.com/helpfulengineering/devops/blob/master/documentation/guidance/gsuite/collaborative-inbox-forwarding.md) to get started. Then, you should be able to choose the address you’ll use when sending and replying messages.
>
> _If you have any additional question, just reply to this message._

In order to complete the [configuration process](https://github.com/helpfulengineering/devops/blob/master/documentation/guidance/gsuite/collaborative-inbox-forwarding.md), users will need a confirmation code that can be retrieved by visiting [this link](https://groups.google.com/all-groups) from a privileged G Suite administrator account. You can send it when asked through a Slack direct message.

### Removing users from a collaborative inbox
Just delete the user from the corresponding `Aliases/Members` fields on the IaS spreadsheet and send a Slack direct message following this template:

> **Your personal account `user@domain` has been removed from the following G Suite collaborative inboxes:**
>
> * `collaborative.inbox@helpfulengineering.org`
>
> You'll keep having access to the previously received messages through your personal account, but you won't receive new messages. Also, you won't be able to send messages on behalf of the collaborative inbox address anymore.
>
> _If you have any question, just reply to this message._

## Applying changes

Once you perform all the desired operations, please check the `apply` checkbox on the IaS spreadsheet and wait for the system to automatically commit the changes to the [infrastructure-gsuite](https://github.com/helpfulengineering/infrastructure-gsuite) repository. This may take up to a dozen of minutes because it depends on a scheduled GitHub action.

When it's done, the checkbox will be automatically unchecked and the [#skill-software-devops](https://helpfulengineering.slack.com/archives/CV54M16QH) Slack channel will get an automated message asking for manual confirmation before running `terraform apply`.
