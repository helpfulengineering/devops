# G Suite Accounts

![Diagram](/images/gsuite-account-diagram.svg)

## Types
Accounts can be divided in three major categories: personal accounts, external accounts and shared (purpose-specific) accounts. Shared accounts will be created only in very specific cases where several individuals need access to a single account for access to G Suite managed resources such as Google Analytics and common file storage.

### External accounts
Those users that only need to manage a collaborative inbox can simply use an individual (external) account configured to send and receive mail on behalf of that inbox. This way, account management costs can be considerably reduced without negatively impacting the ease of use nor the granular access control to group-managed mail accounts.

### Collaborative inboxes
In those cases where mailing is the only need for an «account», there is a much better alternative known as _collaborative inbox_, that allows multiple users to send and receive mail from their individual accounts without additional overhead. These shared inboxes can be<!-- hopefully --> easily managed through [Google Groups](https://groups.google.com/a/helpfulengineering.org/forum/#!myforums) or [through an external account](./collaborative-inbox-forwarding.md). 

### Personal accounts
These full-fledged accounts, which are tied to a natural person, can access all the G Suite products and, due to the implicit costs, should be only used when group mailing is not an option.

### Purpose-specific accounts
This kind of account, managed by one or many users through a [securely shared password](/documentation/guidance/credential-sharing.md), is not tied to any specific natural person and can be used by up to 4 concurrent users. <!-- just in case, to avoid tripping bot protection --> Its main purpose is enabling multiple or variable users to access Google-specific services like Analytics or Drive, and should not be requested only for mail exchange.

## Naming
Though there were some exceptions in the early stages of the provisioning process, all the newly created personal accounts should be named following the well-known convention of concatenating the initial of the first name and the complete last name (*exempli gratia:* John Doe => `jdoe@helpfulengineering.org`). In the case where this convention produces duplication, additional letters from the first name should be used to generate a unique username: a second user with the name John Doe would result in an address of `jodoe@helpfulengineering.org`.

All the non-personal accounts and group mail inboxes should have short and descriptive names, unabbreviated whenever possible, which can be easily identified and understood by external users. This document doesn't intend to thoroughly cover naming styles, so simplicity and clarity are the only really important requirements in this case.

## Shared inbox configuration guides
* [**For administrators:** creating a shared inbox](./collaborative-inbox-creation.md)
* [**For users:** setting up forwarding](./collaborative-inbox-forwarding.md)

