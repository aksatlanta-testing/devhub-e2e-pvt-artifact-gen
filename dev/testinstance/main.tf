module "base" {
  source          = "../../modules/base"
  location        = "eastus"
  siteId          = basename(abspath(path.module))
  domainFqdn      = "jumpstart.local"
}