# Inventories

There are several inventories that are used for the playbooks.

[Invetories](/inventories/)

1. `images.yml` - this contains the image names and variables needed to invoke the Image Builder API and conver the Images (and upload them to AWS - [see Limitations](/README.md#limitations))
2. `instances.yml` - this describes the VMs that will be created via unique names, so we know what they are.
3. `localhost` - this is an adhoc inventory when we want to run against localhost by itself - useful to bootstrap other playbooks, or run API commands.
4. `test.aws_ec2.yml` - this is a test AWS inventory example, you can use this to query your AWS region as an inventory source.
5. `test.insights.yml` - this is a test Insights inventory example, you can use this to query Insights as an inventory source.

## Controller configuration

* [AWS Images inventory](Inventory-aws-image.md)
* [EC2 Instances inventory](Inventory-ec2-instances.md)
* [Demo inventory](Inventory-local-inventory.md)
* [AWS inventory](Inventory-aws-inventory.md)
* [Insights inventory](Inventory-insights-inventory.md)
