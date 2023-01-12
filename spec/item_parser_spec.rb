require 'item_parser'

describe ItemParser do
    
    describe '#create_item' do
        context 'valid string of regular item' do
            let(:item) { described_class.create_item('1 imported bottle of perfume at 27.99') }

            it 'creates an item according to a string' do
                expect(item).to be_an_instance_of Item
            end

            it 'should have a shelff price of 27.99' do
                expect(item.price).to eql(27.99)
            end

            it 'should be imported' do
                expect(item.is_imported).to be true
            end
        end

        context 'valid string of exempt item' do
            let(:item) { described_class.create_item('1 imported packet of headache pills at 27.99') }

            it 'creates an item according to a string' do
                expect(item).to be_an_instance_of ExemptItem
            end

            it 'should have a shelff price of 27.99' do
                expect(item.price).to eql(27.99)
            end

            it 'should be imported' do
                expect(item.is_imported).to be true
            end
        end
    end
end