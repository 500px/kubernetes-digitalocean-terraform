# Deploy Kubernetes on DigitalOcean with Terraform

## Disclaimer

Not tested in production yet. Use it at your own risk.

## Requirements

* [DigitalOcean API token] (https://cloud.digitalocean.com/settings/tokens/new)
* [Terraform](https://www.terraform.io/)

## Generate Keypair
```
ssh-keygen -t rsa -b 4096
```

## Add your public key in DigitalOcean control panel

[Add your SSH Key to DigitalOcean](https://cloud.digitalocean.com/settings/security). Name it and paste the public key just below `Add SSH Key`.

## Add this key to your ssh agent

```bash
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
```

## Apply Terraform configuration

```bash
terraform apply
```

### Setup `kubectl`

After the installation is complete, `terraform` will config `kubectl` for you. The environment variables will be stored in the file `secrets/setup_kubectl.sh`.

Test your brand new cluster

```bash
kubectl get nodes
```

### Deploy DNS Add-on

The file `03-dns-addon.yaml` will be rendered (i.e. replace the value `DNS_SERVICE_IP`), and then `kubectl` will create the Service and Replication Controller.

