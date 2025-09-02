# controller-api

Automation for this POC via the AAP controller API

## Overview

Currently, there is only a single set of automation ran via the `Makefile`:

* Scripts to create a personal access token
* Playbook to create a custom Credential Type: `Image Builder Vars`
* Playbook to create a custom Credential: `Image Builder Secrets`

The custom Credential has all the fields needed for the POC, so you don't need to define a vault or embed secrets in environment or extras variables.

You just need to define the vault once here.

## Configuration

Create the vault in the [group_vars/all/](group_vars/all/). Copy [group_vars/all/00-defaults.yml](group_vars/all/00-defaults.yml) to `group_vars/all/99-vault.yml`.

```yaml
## Copy this file to the same directory as 99-vault.yml
## Edit that file with updated values
## then run: ansible-vault encrypt 99-vault.yml
```

Ensure you have the following:
* `organization`: this it the AAP Organization where the new Credential will live.
* `public_key`: This is the ssh public key to embed in the Image Builder image
* `aws_kms_key`: This it the [AWS KMS key used][kms] to encrypt the [images][kms-image]
* `offline_token`: This is the hybrid cloud console API token. [You can generate it here][token].
* `rhsm_activation_key`: The activation key - [which you can create here][rhsm_activation].
* `rhsm_organization`: The orgization name shown in the Activation Keys screen above.
* `aws_default_region`: The default org for all AWS operations.

[kms]: https://aws.amazon.com/kms/
[kms-image]: https://docs.aws.amazon.com/kms/latest/developerguide/overview.html
[token]: https://access.redhat.com/management/api
[rhsm_activation]: https://console.redhat.com/insights/connector/activation-keys

## Usage

Once you have those, just run the Makefile.

```bash
make
```

## Clean up

```bash
make clean
```

## Usage for in AAP

When creating templates and jobs in AAP for this project, you just need to select the `Image Builder Secrets` as part of the credentials.
