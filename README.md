# GCP Minecraft Server

This is a Terraform resource to easily setup a Palworld server on GCP.

## Quick start

```
cd terraform
echo 'project = "<GCP_PROJECT>"' > terraform.tfvars
terraform plan
terraform apply # Connect to this ip address
```

### References

- https://registry.terraform.io/modules/terraform-google-modules/container-vm/google
- https://github.com/thijsvanloef/palworld-server-docker
