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
        it 'array should have 1 element' do
            expect(subject.length).to(eq 1)
        end

    end

    describe 'subnets output' do
        subject{ input('subnets').length }
        it 'array should not be empty' do
            expect(subject).to(be > 0)
        end
    end

end