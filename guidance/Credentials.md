# Helpful Engineering Shared Credentials

Whenever possible we should create separate accounts for each user.  However in some instances it will be required to share a single set of credentials (ex. social media accounts, HE email accounts, etc).  If we have to share credentials with multiple people we will do so using a tool called Lastpass.  **Credentials should NEVER be shared in plaintext.  Please only share with lastpass so passwords remain encrypted at all times.**

# Lastpass Master Account
The devops and infosec teams maintains a master account where all credentials are stored.  Credentials are then shared from this account to other users after access has been approved.  When the infosec team rotates passwords regularly as a security best practice they will automatically update in other users lastpass vault.  

# Creating a lastpass account
If you do not have a lastpass account please [create one](https://lastpass.com/create-account.php).  **DO NOT FORGET YOUR LASTPASS PASSWORD!**  It cannot be reset by the infosec team or lastpass.  Your password is used to generate your encryption key, so it is unique to you.  We also recommend installing the lastpass browser extension to your favorite browser.

After your account is created send the email address you used to sign up to the infosec team ([#skill-infosec](https://app.slack.com/client/TUTSYURT3/CV4TYGC1Z)) and they will share passwords with you.  If you are outside of the admin group in slack approval for access will be required.  The infosec team will reach out to the admin group for approval. 

[Lastpass sharing documentation](https://helpdesk.lastpass.com/sharing-4-0/)

# Changing Passwords
Lastpass can also [generate secure random passwords](https://helpdesk.lastpass.com/generating-a-password/).  Please use the following settings when generating passwords

 - length > 12
 - Uppercase letter
 - Lowercase letter
 - Numbers
 - Symbols
```
![Lastpass Generate Password Settings](/guidance/GeneratePasswordSettings.png)
```

If you change a password please update the record in lastpass, this will share the new passwords to all other authorized users.