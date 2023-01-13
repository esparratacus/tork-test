require 'product/exempt_item'

describe Product::ExemptItem do
    let(:item) { Product::ExemptItem.new(47.50,1) }
    describe '#sales_tax' do
        it 'should always return 0' do
            expect(item.sales_tax).to eql(0)
        end
    end

    describe '#total' do
        context 'when the item is not imported' do
            it 'should keep shelf price value' do
                expect(item.total).to eql(47.50)
            end
        end

        context 'when the item is imported' do
            let(:item) { Product::ExemptItem.new(47.50,1,true) }
            it 'should add import tax to shelf price value' do
                expect(item.import_tax).to eql(2.40)
                expect(item.total).to eql(49.90)
            end
        end
    end
end