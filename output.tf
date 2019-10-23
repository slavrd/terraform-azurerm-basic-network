output "resource_group" {
    description = "Properties of the created Azure resource group."
    # value = {
    #     name = azurerm_resource_group.rg.name
    #     id = azurerm_resource_group.rg.id
    #     location = azurerm_resource_group.rg.location
    # }
    value = azurerm_resource_group.rg
}