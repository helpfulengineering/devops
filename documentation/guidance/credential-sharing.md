# Helpful Engineering Shared Credentials

Whenever possible, no account should be shared with other users. However, in some instances (e.g. social media accounts, some email accounts, *et cetera*) it will be required to share a single set of credentials with multiple users by using a tool called [1Password](https://1password.com).

The DevOps and Infosec teams maintain a master account to store, manage and share the credentials with the approved users, so secrets are automatically synchronized with the other users' 1Password vaults when they change.

:warning: Credentials should **never** be shared outside the password manager: please **do not** store or send passwords in plaintext by any other means.

## Getting an account

1. Go to the [#devops](https://helpfulengineering.slack.com/archives/CV54M16QH) Slack channel, type `/1Password` on the message field, and select **Request an account**. Then, specify which vaults and secrets you're going to use. If you already have a personal account, you can use the same address for both. 

2. Your request will be manually triaged and approved by an authorized administrator from [#devops](https://helpfulengineering.slack.com/archives/CV54M16QH).

    Please note that this process is not instantaneous: it may take up to 24 hours because of timezone differences and other human factors. Duplicate requests and at-mentioning people in Slack will not elicit a faster approval, though you can expedite the process by bringing the pertaining authorizations in advance to [#devops](https://helpfulengineering.slack.com/archives/CV54M16QH).

3. Once your account gets approved and you receive the corresponding informational mail, you can proceed to set up your browser and devices following [this guide](https://support.1password.com/explore/team-member/).

:warning: **Do not forget your master password nor your [secret key](https://support.1password.com/secret-key-security/)!** They are unique to you and cannot be reset by anybody; losing them will keep you from accessing all your passwords.

## [Using the password manager](https://support.1password.com/getting-started-1password-x)

In order to store, retrieve and autocomplete passwords from your web browser or mobile device, you'll need to install one of the following extensions:

* Browser:
  * [Chrome](https://chrome.google.com/webstore/detail/1password-x-–-password-ma/aeblfdkhhhdcdjpifhhbdiojplfjncoa)
  * [Firefox](https://addons.mozilla.org/en-US/firefox/addon/1password-x-password-manager)
  * [Edge](https://microsoftedge.microsoft.com/addons/detail/dppgmdbiimibapkepcbdbmkaabgiofem)
  * [Safari](https://app-updates.agilebits.com/download/OPM7)
  * [Brave](https://chrome.google.com/webstore/detail/1password-x-–-password-ma/aeblfdkhhhdcdjpifhhbdiojplfjncoa)
* Mobile:
  * [Android](https://play.google.com/store/apps/details?id=com.agilebits.onepassword)
  * [iOS](https://apps.apple.com/app/1password-password-manager/id568903335)
  
If it's your first time using 1Password, you can read or watch the [official getting started guide](https://support.1password.com/getting-started-1password-x) to get familiar with its setup and basic usage, including in-browser autofill and credential saving.

:warning: **Credentials must not be stored outside the password manager**, lest they get outdated or exposed. Passwords will be periodically rotated and updated on the password manager, so you can use the provided autofill functionality to seamlessly keep up with the latest changes.

## Changing passwords

When changing a password, you should generate the new one with the password manager, so it follows the best security practices and can be automatically shared with all the authorized users. If you're not familiar with 1Password, please check [this tutorial](https://support.1password.com/change-website-password/).

Once users don't need to have access to a given resource anymore, they should notify it to one of the remaining team members, who will be in charge of changing the affected passwords.

## [1Password user guide](https://support.1password.com)

You can read a complete user guide at https://support.1password.com
