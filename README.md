# GCP Minecraft Server
This is a Terraform resource to easily setup a Minecraft server on GCP.

## Quick start

```
cd terraform
echo 'project = "<GCP_PROJECT>"' > terraform.tfvars
terraform plan
terraform apply # IP Address is output
```

### References
- https://registry.terraform.io/modules/terraform-google-modules/container-vm/google
- https://github.com/itzg/docker-minecraft-server
