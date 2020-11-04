control 'azureVnet' do

    title 'Verify the Azure vnet'
    desc 'Verifies that the Vnet exits in Azure'

    describe azurerm_virtual_network(resource_group: input('rg_name'), name: input('vnet')[:name]) do
        it { should exist }
    end
end