# Overview

This document describes the design of PROJECT_NAME's technological solution to PROBLEM_NAME.

## Problem Statement

> 1-3 sentences describing the problem and how it impacts customers, business, or organization 

## Expected Benefits of Solution

> 1-3 sentences describing the benefits of the proposed solution in the context of the problem
>
> Also clearly state if/when the solution does not solve significant portions of the problem statement

> Optional: Wardley Map of the current state annotated to show how this design changes the landscape

## Key Use Cases
Ths section describe the three (to five) most important use cases the system will support:

### Use Case - 1

### Use Case - 2

### Use Case - 3


## Context and Requirements

> Briefly describe
> 
> * the current solution to this problem
> * significant constraints within the environment
> * major business requirements
> * major technical requirements

## Logical Architecture

This diagram illustrates the logical architecture of our solution:
> Block diagram illustrating logical architecture of solution

> Starting with the end-user of USE_CASE_1, provide a high-level description of how PROJECT_NAME implements 
> the primary use cases.  Be sure to describe how data flows through the system. 

## Physical Architecture

> describe how the system will be implemented, including aspects such as:
> 
> * description of how components implementing the system will interact
> * key data models, structures, and wire formats
> * when and where data is persisted
> 
> It is very helpful to include sequence or data flow diagrams of Key Use Cases
> You can build these with a diagramming tool such as Lucid Chart, draw.io, or https://www.websequencediagrams.com

## Availability and Fault Tolerance

This section describes the expected availability of the system in terms of 
[‘NINES’](https://en.wikipedia.org/wiki/High_availability) and how it plans to meet those requirements.

**Note:** 99.95% is the maximum availability target generally supported by the DevOps team. This is the maximum 
availability of a single-region cloud deployment.

Expected availability to end users: `99.9%`

> Describe who and how dependents of system will be affected when the system is unavailable.
> Note that this information will be used in the Risk Summary section

> 
> ### Strategy 
> Describe how the system achieves availability and fault tolerance, e.g.
> * redundancy
> * circuit breakers
> * failover
> * rate limits
> * retry-with-backoff
> * feature flags

## Maintenance

This section describes what regular maintenance the system will require.
  
> What regular maintenance does the system require?
> Can the system be maintained while online or is will a ‘maintenance’ window be required? How frequently?

## Scalability

This section describes the system's anticipated scalability requirements and how it plans to meet those requirements.

**Transaction Volume**
> describe expected peak and ‘normal’ throughput requirements

**Data Volume**
> describe peak and ‘normal’ data volume requirements, including data retention

**Scaling Strategy**

> Describe how system if and how system will scale up to handle more work; can the system scale down? 
> What are the minimum and maximum footprints?
>
> Unit of Service Scalability
> What is the unit of scalability as load increases in terms of application processes, databases?
>
> Scaling of Reads, Writes
>
> Limits
> What limits does the system impose to facilitate scaling and fault tolerance, e.g. message size, per-customer/tenant limits
>

## Performance

This section describes the performance requirements for most important and lowest-latency use cases & transactions, 
e.g. p95 & p99 response time @ peak throughput

> How will performance requirements be validated?
> Does/how will performance be monitored?

## Security Model
This section describes key aspects of this design's security model.

### Authentication & Authorization of Access

> How will application users be identified, authenticated, and authorized?
> How will application administrators be identified, authenticated, and authorized (in-app, not infra)?

### Confidentiality Expectations

> Describe the expected Confidentiality of this system’s data, particularly the customer's data.
> 
> What regulatory standards and requirements cover this data?
> * is there personally identifiable information (PII)? this could be covered by GDPR and similar
> * is there personal health information (PHI)? this could covered by HIPAA and similar
> * is there payment card or other financial information (fyi... big red flag)? this could be covered by PCI
> 
> Describe how confidentiality of data is protected both in-flight and at-rest.

## Verification and Monitoring
This section describes how we will know the system is working correctly.

> How will operators know the system is operating correctly?
> Does the system have built-in mechanisms to detect errors? (How) Will this data be propagated to monitoring systems?
> How is data distributed and is there a way to verify its consistency?
> How can the system be tested while online? (How) Can this be done continuously?

## Risk Summary

The section describes the most important failure modes _and their effects_ in this design.

Top 3-5 Failure Modes present in this design are:

> Example: When the database is unavailable for more than 10 minutes, then customers will 
> have to do X instead and the impact is Y.  

## Cost
These are the rough, expected costs to develop and operate the system:

> Develop System
> Describe the costs required to develop the system in people and money.
> 
> Example:
> 1 month effort of a Cloud Architect and Engineer to implement an end-to-end prototype
> 1 month effort of a Market Analyst to gather feedback on the prototype
> 2-3 months of effort for a Cloud Architect and Engineer develop features of MVP
> 1 month for a Cloud Engineer to implement v1 of automated system provisioning process for Cloud and application resources
> 2 weeks for a Cloud Engineer to implement end-to-end monitoring of system

Total: $NNN or months

> Operate System
> Describe the costs required to operate the system in people and money.
> 
> Compute Services: $X / month
> Storage Services: $Y / month
> Third-party app integrations: $Z / month 
> 
> Total: $NNN / month

## Resources

* Link to helpful resource 1
* Link to helpful resource 2
