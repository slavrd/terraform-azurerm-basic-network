control 'azureSubnets' do

    title 'Verify the Azure subnets for the given Vnet'
    desc 'Verifies that the Vnet exits in Azure'

    input('subnets').each do | cidr, subnet |
        describe azurerm_subnet(resource_group: input('rg_name'), vnet: input('vnet')[:name], name: subnet[:name]) do
            it { should exist }
            its('address_prefix') { should eq cidr.to_s }
        end
    end
end