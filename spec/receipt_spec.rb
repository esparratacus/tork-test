require 'receipt'

describe Receipt do
    let(:input_1)  {[Product::ExemptItem.new(12.49,2,false , 'book'), Product::Item.new(14.99,1,false, 'music CD'), Product::ExemptItem.new(0.85,1,false, 'chocolate bar')]}
    let(:input_2) { [Product::ExemptItem.new(10.00,1,true, 'box of chocolates'), Product::Item.new(47.50,1,true, 'bottle of perfume')] }
    let(:input_3) { [Product::Item.new(27.99,1,true,'bottle of perfume'), 
                    Product::Item.new(18.99,1,false, 'bottle of perfume'), 
                    Product::ExemptItem.new(9.75,1, false, 'packet of headache pills'),
                    Product::ExemptItem.new(11.25,3,true, 'boxes of chocolate')]}
    context 'input 1' do
        describe "total taxes" do
            it "returns the total amount of taxes" do
                receipt = described_class.new(input_1)
                expect(receipt.sale_taxes).to eql(1.50)
            end
        end
        describe "total sale" do
            it "returns the total amount of purchase" do
                receipt = described_class.new(input_1)
                expect(receipt.total_sale).to eql(42.32)
            end
        end
    end
    context 'input 2' do
        describe "total taxes" do
            it "returns the total amount of taxes" do
                receipt = described_class.new(input_2)
                expect(receipt.sale_taxes).to eql(7.65)
            end
        end
        describe "total sale" do
            it "returns the total amount of purchase" do
                receipt = described_class.new(input_2)
                expect(receipt.total_sale).to eql(65.15)
            end
        end
    end
    context 'input 3' do
        describe "total taxes" do
            it "returns the total amount of taxes" do
                receipt = described_class.new(input_3)
                expect(receipt.sale_taxes).to eql(7.90)
            end
        end
        describe "total sale" do
            it "returns the total amount of purchase" do
                receipt = described_class.new(input_3)
                expect(receipt.total_sale).to eql(98.38)
            end
        end
    end
end
    