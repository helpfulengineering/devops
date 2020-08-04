# Helpful Engineering Shared Credentials

Whenever possible, no account should be shared with other users. However, in some instances (e.g. social media accounts, some email accounts, *et cetera*) it will be required to share a single set of credentials with multiple users by using a tool called [1Password](https://1password.com).

The DevOps and Infosec teams maintain a master account to store, manage and share the credentials with the approved users, so secrets are automatically synchronized with the other users' 1Password vaults when they change.

:warning: Credentials should **never** be shared outside the password manager: please **do not** send passwords in plaintext by any other means.

## Getting an account

1. Make a request from the Slack shortcut menu (:zap: on the bottom-left corner) and specify which vaults and secrets you're going to use. If you already have a personal account, you can use the same address for both. 
    ![:zap: shortcut menu](/images/1password-account-request.png)    

2. Your request will be manually triaged and approved by an authorized administrator from [#skill-software-devops](https://helpfulengineering.slack.com/archives/CV54M16QH). Please note that this process is not instantaneous and depends on timezones and human availabiilty.

3. Once your account gets approved and you receive the corresponding informational mail, you can proceed to set up your browser and devices following [this guide](https://support.1password.com/explore/team-member/).

:warning: **Do not forget your master password nor your [secret key](https://support.1password.com/secret-key-security/)!** They are unique to you and cannot be reset by anybody; losing them will keep you from accessing all your passwords.

## Changing passwords

When changing a password, you should generate the new one with the password manager, so it follows the best security practices and can be automatically shared with all the authorized users. If you're not familiar with 1Password, please check [this tutorial](https://support.1password.com/change-website-password/).

Once users don't need to have access to a given resource anymore, they should notify it to one of the remaining team members, who will be in charge of changing the affected passwords.

## [1Password user guide](https://support.1password.com)

You can read a complete user guide at https://support.1password.com
