terraform {
  backend "azurerm" {
    resource_group_name  = "resourcegroup"
    storage_account_name = "tfdatas"
    container_name       = "tfstate"
    key                  = "{{.GroupName}}.tfstate"
    use_azuread_auth     = true
    subscription_id      = "26ad903f-2330-429d-8389-864ac35c4350"
  }
}
