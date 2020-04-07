# AWS Account and Identity Architecture

This document describes the Helpful Engineering account and identity architecture for Amazon Web Services (AWS).

## Problem Statement

[Helpful Engineering](https://helpfulengineering.org) is creating and deploying applications to AWS as part of 
its mission to address the COVID-19 pandemic. These applications are needed or developed by project teams 
staffed by volunteers from all over the world.

The applications and project teams develop and operate independently, have limited time, and use a wide set of 
implementation technologies. Helpful Engineering has neither the time nor the staff to support high touch, high coordination
solutions.


**Global vs Hierarchical Identity Namespace**

AWS' Identity and Access Management service provides the primitives to implement fine-grained access control to 
+3,500 AWS service APIs and resources. However, IAM provides no real opinion on how to model and implement complex
access control structures required by large organizations. The problem of ensuring Team A only has access to Team A's 
resources within an AWS account is left to the AWS user. IAM provides a flat, global namespace and definition structure
within an Account for identities and policies. By contrast, GCP and Azure provide hierarchical modeling mechanisms and
inheritance that simplifies implementing more complex relationships.

We will describe our own solution next.

## Solution Benefits

Helpful Engineering needs an AWS account and identity architecture that maximizes data safety, team autonomy, and
execution efficiency.

The solution should:

* Enable project delivery teams to deploy applications safely and independently.
* Safeguard customer and organization data from external and internal threats, both accidental and malicious.
* Minimize demand for scarce DevOps & Cloud skills.

## Key Use Cases

### UC1 - Deliver & Operate Applications Independently

Helpful Engineering project teams and deployments are independent, do not generally depend on each other, and expect a high 
degree of autonomy. Project teams need to be able to develop applications, deliver them, and perform some amount of 
operational activities in a self-service, low coordination manner.

We anticipate that project teams will use a mix of manual and automated Cloud configuration and application deployment.
Manual configurations are likely to be used in early prototyping and development. The DevOps team will enable and 
encourage automated configurations delivery and operation to production. The DevOps team has no plans to enforce that.

### UC2 - Provision Accounts

The Helpful Engineering DevOps team will provision AWS accounts for both shared and project delivery accounts. The DevOps team
would like provision these accounts in a standardized way with low effort and simple adoption of Cloud security and
governance practices.

## Logical Architecture

This design provisions a set of AWS accounts for each project team to deliver their applications and a few shared
accounts for prototyping, security, and governance. The Helpful Engineering AWS Organization will look like: 

```
AWS
├── Core
│   ├── Log
│   └── Audit
├── Sandboxes
│   └── he-sandbox2
└── Project Delivery
    ├── Monitoring O2
    │   ├── he-project-monitoring-O2-dev
    │   └── he-project-monitoring-O2-prod
    ├── <project name>
    │   ├── he-<project name>-dev
    │   └── he-<project name>-prod
    └── ···
```

The design accommodates the wide set of people, skills, and techniques used throughout Helpful Engineering and scopes the
management, fault, and security domain to the project team. Using separate AWS accounts for each project team 
creates a strong security boundary between teams that isolates each project's activities, resources, and
data from each other.

The Helpful Engineering AWS Organization OU will be configured to match the depicted hierarchy. This OU 
structure enables use of both shared and project-specific Service Control Policy.

The DevOps team will use [AWS Control Tower](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html) 
to provision both the shared and project accounts. Control Tower provides a simple account provisioning model that
provides a number of security and governance best practices out of the box. 

**Core Accounts**

The `Log` account contains the organization's API activity logs (CloudTrail) and resource configurations (Config).

The `Audit` account is a restricted account that gives security and compliance teams read and write access to all 
accounts in the landing zone.

**Sandbox Accounts**

The `he-sandbox2` account is a '[sandbox](https://chariotsolutions.com/blog/post/building-developer-sandboxes-on-aws/)' 
account teams can use to experiment and prototype solutions. Applications should not be operated for customers out of 
sandbox accounts. The DevOps team should consider enforcing this policy with a governance tool like Cloud Custodian
that destroys resources some number of days after provisioning, e.g. 10 days.

**Project Delivery Accounts**

The DevOps team will provision two 'delivery' accounts for each project team: `dev` and `prod`. Teams will use the
`dev` account to develop their applications and test application deployments. Applications should be delivered
to the production account for operation and use by customers and end users. 

The project team is responsible for delivering applications to their accounts with support by the DevOps team.

Project teams should adopt automated continuous integration to build application artifacts. These artifacts can be 
stored in:
 
* A trusted external repository such as Docker Hub.
* An internal repository such as an S3 bucket hosted within a project account as is the case for the Serverless Framework.

The DevOps team recommends that project teams adopt automated continuous delivery to deploy and configure applications.


**Identities**

Each project account will have a limited set of IAM roles for people and services. Helpful engineers will use the
people roles to access the account and configure resources. Helpful Engineering automation and applications will use 
service roles to deliver and operate applications. 

The people roles will be accessed using single sign-on (AWS SSO and/or Azure AD). The standard people roles and 
their intended uses are:

* `admin` - Used by DevOps team members to perform emergency operational tasks and initial account configuration 
activities:
   * create initial or fix broken IAM configurations
   * configure resources needed by automated configuration management tools
   * file support cases 
* `appeng` - Used by application engineers (developers) to build and manage applications used by either external or 
internal customers. The `appeng` role will start with the managed `PowerUser` policy. The `PowerUser` policy gives
application engineers a lot of capabilities, minus the ability to configure IAM.

People roles will be defined via [AWS SSO permission sets](https://docs.aws.amazon.com/singlesignon/latest/userguide/permissionsetsconcept.html). 
 
The service roles each project will start with are:

* `delivery-<project name>` - Used by automation to build, package, and deliver applications & infrastructure via CI/CD.
Teams using CI/CD services outside of AWS will likely need a delivery IAM user that instead or in addition to the role.
* `svc-<project name>` - Used as the application's EC2/Task/Function execution role. The application operates with this
identity and attached privileges. When an application has multiple components, we can provision a role for each named
in the form `svc-<project name>-<component>`, e.g. `svc-monitoring-O2-ingress` and `svc-monitoring-O2-analyzer`.
* `aws-controltower-AuditReadOnlyRole` - The Audit account's `aws-controltower-AuditReadOnlyRole` will be used to 
perform security and compliance audits of project accounts.

IAM roles are preferred over IAM users and groups for a couple reasons:

* Roles avoid the possibility of leaking API Access Keys because use of the role is authenticated either by the AWS 
compute platform (service roles) or an authentication method that authorizes short term access to the role.
* Roles can be identified in resource policy conditions. IAM groups, which create collections of users, cannot be
referenced in resource policies and managing references to (people) users scales poorly. 

## Resources

* [How Should I Organize My AWS Accounts](https://nodramadevops.com/2019/01/how-should-i-organize-my-aws-accounts/)
* [AWS Blog: Integrating Azure AD and AWS SSO](https://aws.amazon.com/blogs/aws/the-next-evolution-in-aws-single-sign-on/)
