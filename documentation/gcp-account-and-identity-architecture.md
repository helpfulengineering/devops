# GCP Account and Identity Architecture

This document describes the Helpful Engineering account and identity architecture for Google Cloud Platform (GCP).

## Problem Statement

[Helpful Engineering](https://helpfulengineering.org) is creating and deploying applications to GCP as part of 
its mission to address the COVID-19 pandemic. These applications are needed or developed by project teams 
staffed by volunteers from all over the world.

The applications and project teams develop and operate independently, have limited time, and use a wide set of 
implementation technologies. Helpful Engineering has neither the time nor the staff to support high touch, high coordination
solutions.

## Solution Benefits

Helpful Engineering needs an GCP account and identity architecture that maximizes data safety, team autonomy, and
execution efficiency.

The solution should:

* Enable project delivery teams to deploy applications safely and independently.
* Safeguard customer and organization data from external and internal threats, both accidental and malicious.
* Minimize demand for scarce DevOps & Cloud skills.

## Key Use Cases

### UC1 - Deliver & Operate Applications Independently

HelpfulEng project teams and deployments are independent, do not generally depend on each other, and expect a high 
degree of autonomy. Project teams need to be able to develop applications, deliver them, and perform some amount of 
operational activities in a self-service, low coordination manner.

We anticipate that project teams will use a mix of manual and automated Cloud configuration and application deployment.
Manual configurations are likely to be used in early prototyping and development. The DevOps team will enable and 
encourage automated configurations delivery and operation to production. The DevOps team has no plans to enforce that.

### UC2 - Provision Accounts

The HelpfulEng DevOps team will provision GCP accounts for both shared and project delivery accounts. The DevOps team
would like provision these accounts in a standardized way with low effort and simple adoption of Cloud security and
governance practices.

## Logical Architecture

This design provisions a set of GCP accounts for each project team to deliver their applications and a few shared
accounts for prototyping, security, and governance. The Helpful Engineering GCP Organization will look like: 

```
HelpfulEng GCP Org
└ Core
  └ Log
  └ Audit
└ Sandboxes
  └ helpful-gcp-sandbox2
└ Project Delivery
  └ Monitoring O2
    └ he-project-monitoring-O2-dev
    └ he-project-monitoring-O2-prod
  └ <project name>
    └ he-<project name>-dev
    └ he-<project name>-prod
  └ ...
```

The design accommodates the wide set of people, skills, and techniques used throughout Helpful Engineering and scopes the
management, fault, and security domain to the project team.  Using separate GCP accounts for each project team 
creates a strong security boundary between teams that isolates each project's activities, resources, and
data from each other.  

The Helpful Engineering GCP Organization OU will be configured to match the depicted hierarchy. This OU 
structure enables use of both shared and project-specific Service Control Policy.

The DevOps team will use [GCP Cloud Identity](https://cloud.google.com/identity/docs) 
to provision both the shared and project accounts. Control Tower provides a simple account provisioning model that
provides a number of security and governance best practices out of the box. 

**Core Accounts**

The `Log` account contains the organization's API activity logs [Cloud Audit Logs](https://cloud.google.com/logging/docs/audit) and resource configurations (Config).

The `Audit` account is a restricted account that gives security and compliance teams read and write access to all 
accounts in the landing zone.

**Sandbox Accounts**

The `helpful-gcp-sandbox` account is a sandbox account teams can use to experiment and prototype solutions.  Applications should not be operated for customers out of 
sandbox  accounts.  The DevOps team should consider enforcing this policy with a governance tool like Cloud Custodian
that destroys resources some number of days after provisioning, e.g. 10 days.

**Project Delivery Accounts**

The DevOps team will provision two 'delivery' accounts for each project team: `dev` and `prod`.  Teams will use the
`dev` account to develop their applications and test application deployments.  Applications should be delivered
to the production account for operation and use by customers and end users.  

The project team is responsible for delivering applications to their accounts with support by the DevOps team.  

Project teams should adopt automated continuous integration to build application artifacts. These artifacts can be 
stored in:
 
* A trusted external repository such as Docker Hub.
* An internal repository such as an S3 bucket hosted within a project account as is the case for the Serverless Framework.

The DevOps team recommends that project teams adopt automated continuous delivery to deploy and configure applications.

## Resources

* [How Should I Organize My GCP Accounts](https://nodramadevops.com/2019/01/how-should-i-organize-my-aws-accounts/)
