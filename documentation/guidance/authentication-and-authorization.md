# Authentication and Authorization Guidance

## Resources available through Helpful Engineering
Currently Auth0 is the only authentication service provided by Helpful Engineering.  Approved projects are given access to both a development and production authentication [tenant](https://auth0.com/docs/videos/get-started/01-architecture-your-tenant) as needed to allow for environments to host a stable authentication service as well as an environment for testing changes.

## CI/CD (Automation)
TBD

## Mobile Applications
Mobile applications should take advantage of the hosted Auth0 browser-based authentication using the OIDC (Open ID Connect) protocol, which can be redirected to from a mobile app.  This allows for industry standard security practices to be handled by the browser for authentication and for returning a relatively short-lived token to the mobile app that can be used to securely identify the user to any trusted APIs being called.  This approach also allows for SSO (single sign-on) between related apps without re-authentication.

See [Browser-Based vs. Native Login Flows on Mobile Devices](https://auth0.com/docs/design/browser-based-vs-native-experience-on-mobile) for more details on this guidance.

## Web Applications
### SPA Applications
SPA (Single-Page Applications) that are generally built using a Javascript framework in a Browser that communicates with an API backend service, should use a similar approach to Mobile Applications.  SPAs should use the OIDC protocol which will force a redirect to the Auth0 authorize endpoint when authentication of a user is required.  

SPAs should not store a refresh token that can optionally be provided by Auth0, but should perform a silent token refresh in the browser to securely obtain a new token using the secure samesite cookie stored in the browser based on the user's authentication with Auth0.  If you do use this approach, then it will be required to use a custom domain on Auth0 to ensure that XSS protections in some browsers don't restrict the silent token refresh from succeeding.  See [Renew Tokens When Using Safari](https://auth0.com/docs/api-auth/token-renewal-in-safari) for more details on this.

### Backend Applications
Backend Applications that can store tokens in a secure samesite cookie created from a the back-end website process have more flexibility in the lifetime of tokens and storing of refresh tokens for retreival of new access tokens.

## Web APIs
Web APIs should take advantage of a Certified OIDC (Open ID Connect) Implementation for your chosen language or framework.  This implementation is generally included in an API project as middleware, and should automatically take care of verifying the signature of the token produced by Auth0 via standard OIDC validation processes.  This middleware will usually provide the relevant contents of the access token passed from the front-end application in the request context attributes that identify a user/caller.
