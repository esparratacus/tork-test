require 'exempt_item'

describe ExemptItem do

    describe '#sales_tax' do
        it 'should always return 0' do
            item = ExemptItem.new(1,47.50)
            expect(item.sales_tax).to eql(0)
        end
    end

    describe '#total' do
        context 'when the item is not imported' do
            it 'should keep shelf price value' do
                item = ExemptItem.new(47.50,1)
                expect(item.total).to eql(47.50)
            end
        end

        context 'when the item is imported' do
            it 'should add import tax to shelf price value' do
                item = ExemptItem.new(47.50,1,true)
                expect(item.import_tax).to eql(2.35)
                expect(item.total).to eql(49.85)
            end
        end
    end
end