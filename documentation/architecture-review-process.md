# Architecture Review Process

This document describes how the DevOps team will review and provide feedback on Helpful Engineering application
and infrastructure architectures.

## Purpose

The primary purpose of this review process is to identify 'big' issues early so that we can address them and help the
project provide value to its customers.  A secondary purpose is to help determine if and how the DevOps team 
will support a given project.  

At this point in the development process, the proposed architecture will have (lots of) imprecision or error in the:

* Problem statement
* Benefits a solution will provide to customers
* Key use cases supported by the system
* Design of the solution
* Satisfaction of ‘non-functional’ requirements, particularly security and cost

That's expected.

The architecture review process helps implementors discover issues, clarify the design, and adjust
the solution to something that will solve the problem under Helpful Engineering's organizational constraints. 

## Constraints

Helpful Engineering is a volunteer, non-profit, decentralized organization that operates under important constraints.

The key constraints are:

1. volunteer time is scarce and while there is a broad skill set in aggregate, 
the depth in any one skill is often shallow 
2. money is scarce and the organization's funding model is still developing
3. authority is highly decentralized amongst this group of _volunteers_

## The Process

First, the project team should share a description of the problems they are solving and their proposed solution as
a reviewable document.  The DevOps team provides a [design template](design-template.md) that guides you through the
review topics.  

You are **not required** to use the template.  However, we do expect project teams to address the topics 
and questions contained in that template.   This design document should reside in the project's relevant source code or
document repository (not a DevOps-owned repository).  Work with your project's DevOps liaison(s) to get the design
in order.

Project team leaders or liaisons may request a review of the proposed project architecture by asking for a review and 
providing a link to the document in the \#skills-software-devops channel.  Please mention/tag the members of the 
[core team](directory.md) for the Cloud you plan to deploy to.  

Second, a member of the relevant core Cloud team will take a quick look at the document and let the review requester
know if it's ready for review.  If the document is ready for review, the core team member and requester will schedule
a one hour video conference for the architecture review.     

Third, conduct the architecture review meeting.  The review should be attended by at least one:

* project team leader
* DevOps project team liaison
* member of the supporting core Cloud team(s) 

The project team leader or liaison will lead attendees through the design, starting from the customer and problem
statement.  Record this meeting so that discussions are captured automatically for later reference and others can 
listen in later.  Consider conducting the review as an Amazon-style read-then-question approach 
(c.f. [How to review a design](https://nodramadevops.com/2019/09/how-to-review-a-design/)) so that reviewers
have uninterrupted time to read what you have written.

By the close of the review meeting, the core Cloud team member(s) will provide initial answers to the following
questions:

* Is this feasible given Helpful Engineering organization constraints?
* What topics or issues need additional engineering prior to deployment to an environment managed by the DevOps team? 
* Which components or services will be provided or supported by the DevOps team? 

Fourth, project liaison and core Cloud team member(s) will document the answers to those questions in the `reviews`
folder of the devops repo.  These answers will be shared back into the \#skills-software-devops along with a link
to the review meeting recording.      

## References

* CNCF [Project Proposal Process](https://github.com/cncf/toc/blob/master/process/project_proposals.adoc)
* [How to review a design](https://nodramadevops.com/2019/09/how-to-review-a-design/)
 