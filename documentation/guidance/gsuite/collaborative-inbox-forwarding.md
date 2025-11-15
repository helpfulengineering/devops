# G Suite Collaborative Inbox Forwarding
This step by step guide will help you to connect your own Gmail account to a Helpful Engineering collaborative inbox. Before you start, please get in touch with a member of the [#devops](https://helpfulengineering.slack.com/archives/CV54M16QH) team in order to get the pertaining authorizations.

:warning: Please get in touch with one of the [#devops](https://helpfulengineering.slack.com/archives/CV54M16QH) members before starting the process, so they can hand over the required verification code as soon as you need it.

### 1. Enable application access in your account
If you don't have [two-factor authentication enabled](https://www.google.com/landing/2step/) or don't even know what it is, simply [enable access for less secure applications](https://myaccount.google.com/lesssecureapps) in your account. If you have two-factor authentication enabled, please [generate an application-specific password](https://myaccount.google.com/apppasswords) instead.

### 2. Open your [account import settings](https://mail.google.com/mail/#settings/accounts) to add another address
![Step 1](/images/gsuite-group-forwarding-1.png)

### 3. Fill the collaborative inbox details
![Step 2](/images/gsuite-group-forwarding-2.png)

| Field | Value | Description |
| ----- | ----- | ----------- |
| Name | `Helpful Engineering - Contact` | Name used on the messages you send; keep it descriptive |
| Email address | `info@helpfulengineering.org` | Address of the shared inbox |
| Treat as an alias | ✓ | Send messages on behalf of the shared inbox account |

### 4. Configure the account<sup>1</sup>
![Step 3](/images/gsuite-group-forwarding-3.png)

You'll only need to complete this step only if your personal account is using a `@gmail.com` address; personal accounts ending with `@helpfulengineering.org` will skip directly to the next step.

| Field | Value | Description |
| ----- | ----- | ----------- |
| SMTP Server | `smtp.gmail.com` | Mail server |
| Username | `my.user` | The part of **your own** mail address before the at `@` sign |
| Password | `********` | The password of your own mail account |

**Note:** if you have MFA set up on your account, you may need to use an "app password" in place of your personal password. To do this, go to https://myaccount.google.com/apppasswords and type an "app name" (just make it the alias you are setting up for simplicity) then click the `Create` button. Use the resulting password *in place of* your personal Gmail account password.


### 5. Input the verification code
Just ask for it from a member of [#devops](https://helpfulengineering.slack.com/archives/CV54M16QH).
![Step 4](/images/gsuite-group-forwarding-4.png)
