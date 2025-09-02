# Usage

Usage document for Image Builder POC

## Prerequisites

You will need to do the following before you can fully use this:

### Red Hat Requirements

1. Have purchased a [RHEL][rhel-buy], contacted your [sales team][sales], or obtained a [developer][rhel-dev] subscription.
2. Have purchased a [Ansible Automation Platform][aap] subscription or [obtained an eval][aap-eval].
3. Install [Ansible Automation Platform][aap] on RHEL 9.
4. Have your [Red Hat Hybrid Cloud Console](https://console.redhat.com/) username and password.
5. Create and save a RHSM [activation key][rhsm-ak].
6. Create and save your RHSM [offline token][rhsm-token].
7. Create and save your [Automation Hub token][aah-token].

[rhel-buy]: https://www.redhat.com/en/store/linux-platforms
[sales]: https://www.redhat.com/en/store/contact-sales
[rhel-dev]: https://developers.redhat.com/articles/faqs-no-cost-red-hat-enterprise-linux
[aap]: https://access.redhat.com/documentation/en-us/red_hat_ansible_automation_platform/2.4/html/red_hat_ansible_automation_platform_installation_guide/index
[aap-eval]: https://www.redhat.com/en/technologies/management/ansible/trial
[rhsm-ak]: https://console.redhat.com/insights/connector/activation-keys
[rhsm-token]: https://access.redhat.com/management/api
[aah-token]: https://console.redhat.com/ansible/automation-hub/token/

### Generic Linux Requirement

1. Create or re-use an [SSH private and public key][ssh-keygen] for VM authentication.

[ssh-keygen]: https://www.redhat.com/sysadmin/configure-ssh-keygen

### AWS Requirements

1. Have your [AWS IAM user keys][aws-iamkey].
2. Determine what [AWS region][aws-region] you're going to use: example us-east-1
3. Create and save a [AWS KMS key][kms] to encrypt the [images and VM disks][kms-image]
4. Determine what [AWS VPC][aws-vpc] you will use.
5. Determine what [Security Groups][aws-sg] you will use. [Default SG defined here](SG-my-defaults.md)

[aws-iamkey]: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html
[aws-region]: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html
[kms]: https://aws.amazon.com/kms/
[kms-image]: https://docs.aws.amazon.com/kms/latest/developerguide/overview.html
[aws-vpc]: https://docs.aws.amazon.com/vpc/latest/userguide/vpc-getting-started.html
[aws-sg]: https://docs.aws.amazon.com/vpc/latest/userguide/security-groups.html

## Setup

Personally, I run all of this on the controller node as I'm interacting with the API.

You will need to clone the repository, or fork it to your repo.

```bash
git clone https://github.com/gonoph/image-builder-poc
```

### Extras - If you want, I tried to make life easier.

Inside [Extras](/extras/README.md), I have:

* a custom execution environment - that contains all the dependencies for this POC.
* a custom Credential - that will create a Credential that has all the secrets / settings for the playbooks.

### Common configuration

* [Organizations](Organization.md)
* [Project](Project.md)
* [Inventories](Inventories.md)
* [Templates](Templates.md)
