# Templates - how to tell AAP to execute a playbook

These are the templetes you will need to create.

## List of Templates

* [AWS Images Check](Template-AWS-Images-Check.md) - this template calls a [playbook](/aws_images_validate.yml) to validate the uploaded images.
* [AWS Images Create](Template-AWS-Images-Create.md) - this template calls a [playbook](/aws_images_create.yml) to create the Image Builder images via the hosted API, download it, convert it, upload it to AWS, and finally start the import process.
* [AWS Images Status](Template-AWS-Images-Status.md) - This template calls a [playbook](/aws_images_status.yml) to query the AWS import process and report on it's status. This can take up to 45 minutes, and this status playbook can be ran multiple times.
* [Create AWS Instances](Template-Create-AWS-instances.md) - This template calls a [playbook](/create_aws_instances.yml) to use the import image to create several VMs, tag them, and register to them RHSM, Insights, and RHC. If then creates the Patch Templates that this instances will belong.
* [Start Insights Patch](Template-Start-Insights-Patch.md) - This template calls a [playbook](/start_insights_patch.yml) that queries the Insights API to build a remediation job inside Insights that patches the systems based on their defined Patch Template.
* [Unregister AWS Instances](Template-Unregister-AWS-Instances.md) - This template calls a [playbook](/unregister_aws_instances.yml) that queries the AWS EC2 inventory, and unregisters and deletes all systems that were tagged as part of this demo.
