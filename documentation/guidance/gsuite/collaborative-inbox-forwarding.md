# G Suite Collaborative Inbox Forwarding
This step by step guide will help you to connect your own Gmail account to a Helpful Engineering collaborative inbox. Before you start, please get in touch with a member of the [#skill-software-devops](https://helpfulengineering.slack.com/archives/CV54M16QH) team in order to get the pertaining authorizations.

### 1. Enable application access in your account
If you don't have [two-factor authentication enabled](https://www.google.com/landing/2step/) or don't even know what it is, simply [enable access less secure applications](https://myaccount.google.com/lesssecureapps) in your account. If you have two-factor authentication enabled, please [generate an application-specific password](https://myaccount.google.com/apppasswords) instead.

### 2. Open your [account import settings](https://mail.google.com/mail/#settings/accounts) to add another address
![Step 1](/images/gsuite-group-forwarding-1.png)

### 3. Fill the shared inbox details
![Step 2](/images/gsuite-group-forwarding-2.png)

| Field | Value | Description |
| ----- | ----- | ----------- |
| Name | `Helpful Engineering - Contact` | Name used on the messages you send; keep it descriptive |
| Email address | `info@helpfulengineering.org` | Address of the shared inbox |
| Treat as an alias | ✓ | Send messages on behalf of the shared inbox account |

### 4. Configure the account<sup>1</sup>
![Step 3](/images/gsuite-group-forwarding-3.png)

| Field | Value | Description |
| ----- | ----- | ----------- |
| SMTP Server | `smtp.gmail.com` | Mail server<sup>2</sup> |
| Username | `my.user` | The part of your own mail address before the at `@` sign |
| Password | `********` | The password of your own mail account |

<sup>1</sup> **Notice:** you'll only need to complete this step only if you're using a `@gmail.com` account; `@helpfulengineering.org` accunts don't require it.

<sup>2</sup> Use `smtp.gmail.com` if your own mail account ends with `@gmail.com` or `smtp.helpfulengineering.org` if it ends with `@helpfulengineering.org`. If you encounter any login error, please try visiting https://accounts.google.com/DisplayUnlockCaptcha to authorize the account.

### 5. Input the verification code
Just ask for it from a member of [#skill-software-devops](https://helpfulengineering.slack.com/archives/CV54M16QH).
![Step 4](/images/gsuite-group-forwarding-4.png)
