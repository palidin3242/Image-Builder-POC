# image-builder-poc
Image Builder POC using API calls and image conversion through AAP

## Background
This project is designed as a POC of creating infrastructure with [Standard Operating Environment][soe] using [Image Builder][imgbuilder] and [Patch Templates][patch].

Goals of simulation:

* Simulate an environment of a single RHEL system (the [Ansible Automation Platform][aap] controller.
* Simulate Day 1: the creation of multiple VMs from an installable image.
* Simulate Day 2: patch the VMs via SOE practices.

Simulated architecture:
* A single AAP controller that will invoke API calls on the [Red Hat Hybrid Cloud Console][rhcc]
* Create a custom execution environment to invoke AAP playbooks.
* Playbooks used to create an installable disk image via the rhcc.
* Playbooks used to convert the installable disk image for the virtualization environment.
* Playbooks to copy the installable disk image to a virtualization environment storage area.
* Playbooks to instantiate VMs form the virtualization environment using the installable disk image.
* Playbooks to [subscribe][rhsm], register and tag VMs to [Red Hat Insights][insights] and the [Remote Host Configuration][rhcd].
* Playbooks to create a [Patch Template][patch] and execute it against the VMs.

Diagram:

![architecture diagram](/docs/images/architecture.png) "Image Builder POC Architecture"

[soe]: https://www.redhat.com/en/topics/management/what-is-an-soe
[imgbuilder]: https://www.redhat.com/sysadmin/rhel-image-builder
[patch]: https://access.redhat.com/documentation/en-us/red_hat_insights/2023/html/system_patching_using_remediation_playbooks/index
[aap]: https://www.redhat.com/en/technologies/management/ansible
[rhcc]: https://console.redhat.com/
[insights]: https://www.redhat.com/en/technologies/management/insights
[rhcd]: https://access.redhat.com/documentation/en-us/red_hat_insights/2023/html/remote_host_configuration_and_management/index
[rmsh]: https://access.redhat.com/documentation/en-us/subscription_central/2023/html/getting_started_with_rhel_system_registration/index

## Limitations

There are some known limitations for this POC.

* I'm simulating a virtual environment using AWS, mainly because
    * it's faster as all created images are stored on AWS.
    * the CDN for content has caching end points on AWS.
    * it was easier for me to stand up than my own Hyper-V or ESX test environment.
    * it had more capacity than my own libvirt/kvm virtualization environment.
* You don't have to convert images for AWS, as Image Builder will create AWS AMIs natively.
* Image Builder will launch AWS instances natively.
* If [Gold Images][gold] via Cloud Access are enough for your use case, then you don't need to use Image Builder.
* This POC is not designed to work on other virtualization environments. (This is a TODO item)

Again, this is a Poof of Concept, not a reference implementation.

[gold]: https://www.redhat.com/en/topics/linux/what-is-a-golden-image#golden-images-and-the-red-hat-portfolio

## Usage

[Click here for more information on how to setup and use this project.][usage]

[usage]: /docs/README.md
