control 'outputs' do

    title 'Outputs test'
    desc 'Simple tests that the outputs are not empty'

    describe 'rg output' do
        subject{ input('rg') }

        it 'should not be empty' do
            expect(subject['name']).to(match /.+/)
        end

        it 'tags should not be empty' do
            expect(subject['tags'].empty?).to(be false)
        end
        
    end

    describe 'vnet output' do
        subject{ input('vnet') }

        it 'array should have 1 element' do
            expect(subject.length).to(eq 1)
        end

        it 'tags should not be empty' do
            expect(subject[0]['tags'].empty?).to(be false)
        end

    end

    describe 'subnets output' do
        subject{ input('subnets').length }
        it 'array should not be empty' do
            expect(subject).to(be > 0)
        end
    end

end