# Soluble Fusion

Soluble Fusion makes it easy to run secure services on Kubernetes!

## Mutli-Cluster / Multi-Cloud Management

As you grow, Fusion reduces the burden of operating dozens (or even hundreds) of Kubernetes clusters securely when they are spread across cloud providers (AWS, GCP, Azure, etc.)


## Workload Identity

Soluble Fusion makes it easy for developers to maintain IAM mapping between Kubernetes service accounts and Cloud IAM roles/service accounts.  Soluble
will auto-generate the mappings so that developers can get access to what they need without leaving a familiar environment.  Fusion does this in a way that is
security- and compliance-friendly.

### Amazon EKS

TBD

### Google GKE

Google Kubernetes Engine has a feature called [Workload Identity](https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity) that maps a GCP service account onto Kubernetes service accounts.  This enables pods to have access to GCP service without issuing static credentials.

The process for establishing this mapping is somewhat involved:

1. GKE Cluster must have workload identity enabled.
2. GCP Service Account must be created
3. GCP Service account must have policy added that maps it to a Kubernetes service account
4. Kubernetes service account must have an annotation (`iam.gke.io/gcp-service-account`) applied that references the GCP service account

This can be very tediious.  The Soluble agent takes care of these things for you.

If you apply an annotation `soluble/gcp-service-account` with a value of `auto`to a kubernetes service account, the agent will:

1. Look for a GCP service account with a matching name in the current project.  If it does not exist, it will create one.
2. Apply a the GCP workload identity policy binding to the corresponding kuberenetes service account.
3. Apply the kubernetes annotation to the service account.

Profit!

Future features:

1. Facility for approval (via Slack, JIRA, etc.)
2. Out-of-band workflow (Git Pull Request, Service Request, etc.)
2. Ability to establish mapping to an existing role
2. Permission grants to specific cloud resources specified in YAML

## Certificate Management

TBD
