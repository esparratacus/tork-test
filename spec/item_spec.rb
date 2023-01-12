require 'item'

describe Item do
    
    describe '#sales_tax' do
        context 'sales tax apply' do
            it 'calculates sales tax accordingly' do
                item = Item.new(47.50,1,true)
                expect(item.sales_tax).to eq 4.75 
            end
        end
    end

    describe '#import_taxes' do
        context 'import tax apply' do
            it 'calculates sales tax accordingly' do
                item = Item.new(47.50,1,true)
                expect(item.import_tax).to eq 2.35 
            end
        end
        context "import tax don't apply" do
            it 'calculates sales tax accordingly' do
                item = Item.new(47.50,1)
                expect(item.import_tax).to eq 0 
            end
        end
    end

    describe '#to_s' do
        it 'should return a string representation of the object' do
            item = Item.new(47.50,1, true, 'bottle of perfume')
            expect(item.to_s).to eql('1 imported bottle of perfume: 54.60')
        end
    end
end