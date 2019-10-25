control 'outputs' do

    title 'Outputs test'
    desc 'Simple tests that the outputs are not empty'

    describe input('rg')['name'] do 
        it{should match /.+/ }
    end

    describe input('vnet') do
        its('length') {should eq 1}
    end

    describe input('subnets') do
        its('length') {should be > 0}
    end

end