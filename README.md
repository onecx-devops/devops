# Manage GitHub repositories

This repository automates the provisioning and management of GitHub repositories and teams. It provides Terraform 
modules for defining repositories, teams, and applications, enabling version-controlled, scalable management 
of collaborative projects or products.

# Getting started

Initialize this repository check for changes and apply:

```
terraform init
terraform plan
terraform apply
```

## Tokens

### Tokens to run terraform

In order to run the terraform scripts you need to set GITHUB_TOKEN as env var. And reset `data "github_user" "self"` 
in main.tf to your account name. To obtain your GitHub token go to:

Profile &rarr; Developer Settings &rarr; [Personal access tokens (classic)](https://github.com/settings/tokens)

Set also SONARCLOUD_TOKEN as env var. Read next chapter on how to obtain it.

### Sonar token in GitHub

Sonar token can expire, to refresh it replace `SONAR_TOKEN` in GitHub:

Organization &rarr; Settings &rarr; Security &rarr; Secrets and variables &rarr; [Actions](https://github.com/organizations/onecx-devops/settings/secrets/actions)

Use token from SonarCloud [security](https://sonarcloud.io/account/security).  

## Add new product

Check `terraform-scripts -> products -> example-product` as template.
* Create new folder in `terraform-scripts -> products`
* Copy `example-product.tf` to your new folder and change 
  * `repository_name` in repository module
  * `team_name` and `team_description` according your team
  * Copy team.csv to your new folder, add names of your teammates and copy its path starting with `/products` to `team_file_path` and their role
* Add names of teammamber also to `members.csv` with `write` role
