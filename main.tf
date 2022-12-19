data "azurerm_subscription" "subscription" {
  subscription_id = var.subscription_name
}

resource "azurerm_role_definition" "ContributerAccess" {
  name               = var.role_definition_name
  description        = var.role_definition_description
  scope              = data.azurerm_subscription.subscription.id

permissions {
    actions     = [
      "Microsoft.Authorization/*/read",
      "Microsoft.Resources/subscriptions/resourceGroups/read",
      "Microsoft.Resources/deployments/*",
      "Microsoft.Compute/locations/*",
      "Microsoft.Compute/virtualMachines/*",
      "Microsoft.Compute/disks/write",
      "Microsoft.Compute/disks/read",
      "Microsoft.Compute/disks/delete",
      "Microsoft.Network/virtualNetworks/read",
      "Microsoft.Compute/virtualMachines/*/read",
      "Microsoft.Storage/storageAccounts/*",
      "Microsoft.Storage/storageAccounts/blobServices/containers/read",
      "Microsoft.Storage/storageAccounts/blobServices/containers/write",
      "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/write",
      "Microsoft.Sql/locations/*/read",
      "Microsoft.Sql/servers/*"
    ]
          
    not_actions = [
      "Microsoft.Compute/virtualMachines/vmSizes/read",
      "Microsoft.Storage/storageAccounts/blobServices/containers/delete"
    ]
          
    data_actions = []
    not_data_actions = []
  }

  assignable_scopes = [
     data.azurerm_subscription.subscription.id
  ]
}