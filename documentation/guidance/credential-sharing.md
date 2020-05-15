# Helpful Engineering Shared Credentials

Whenever possible, no account should be shared with other users. However, in some instances (e.g. social media accounts, some email accounts, *et cetera*) it will be required to share a single set of credentials with multiple users by using a tool called [1Password](https://1password.com).

The DevOps and Infosec teams maintain a master account to store, manage and share the credentials with the approved users, so secrets are automatically synchronized with the other users' 1Password vaults when they change.

:warning: Credentials should **never** be shared outside the password manager: please **do not** send passwords in plaintext by any other means.

## Getting started

Just create an account request from the Slack shortcut menu (:zap: on the bottom-left corner) and you'll be added to the 1Password team with access to the shared secrets you're allowed to use; if you already have a 1Password account, you can use the same email address when requesting access. Your request will need to be approved by [@admin-group](https://helpfulengineering.slack.com/admin/user_groups) unless you already belong to it.

![:zap: shortcut menu](/images/1password-account-request.png)

Once you receive an email from 1Password, you can proceed to set up your browser and devices following [this guide](https://support.1password.com/explore/team-member/)

:warning: **Do not forget your master password nor your [secret key](https://support.1password.com/secret-key-security/)!** They are unique to you and cannot be reset by anybody; losing them will keep you from accessing all your passwords.

## Changing passwords

When changing a password, you should generate the new one with the password manager, so it follows the best security practices and can be automatically shared with all the authorized users. If you're not familiar with 1Password, please check [this tutorial](https://support.1password.com/change-website-password/).

Once users don't need to have access to a given resource anymore, they should notify it to one of the remaining team members, who will be in charge of changing the affected passwords.

## [1Password user guide](https://support.1password.com)

You can read a complete user guide at https://support.1password.com
