control 'outputs' do

    title 'Outputs test'
    desc 'Simple tests that the outputs are not empty'

    describe 'rg_name output' do
        subject{ input('rg_name') }
        it 'should not be empty' do
            expect(subject).to(match /\w+/)
        end      
    end

    describe 'location output' do
        subject{ input('location') }
        it 'should not be empty' do
            expect(subject).to(match /\w+/)
        end      
    end

    describe 'vnet output' do
        subject{ input('vnet') }

        it 'should be an object' do
            expect(subject.class).to(be Hash)
        end

        it 'should have an id property with value which is the expected id of the Azure Vnet' do
            expect(subject[:id]).to(match /.+\/providers\/Microsoft\.Network\/virtualNetworks\/#{subject[:name]}$/)
        end

    end

    describe 'subnets output' do
        subject{ input('subnets') }

        it 'should be a map' do
              expect(subject.class).to(be Hash)
        end
    end
  
     
    input('subnets').each_value do | subnet |
        describe 'subnet value' do
            subject{ subnet }
            it 'should have an id property with value which is the id of an Azure Subnet' do
                expect(subject[:id]).to(match /.+\/providers\/Microsoft\.Network\/virtualNetworks\/#{input('vnet')[:name]}\/subnets\/#{subject[:name]}$/)
            end    
        end
    end

end