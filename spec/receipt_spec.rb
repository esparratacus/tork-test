require 'receipt'

describe Receipt do
    let(:input_1)  {[ExemptItem.new(12.49,2,false , 'book'), Item.new(14.99,1,false, 'music CD'), ExemptItem.new(0.85,1,false, 'chocolate bar')]}
    let(:input_2) { [ExemptItem.new(10.00,1,true, 'box of chocolates'), Item.new(47.50,1,true, 'bottle of perfume')] }
    let(:input_3) { [Item.new(27.99,1,true,'bottle of perfume'), 
                    Item.new(18.99,1,false, 'bottle of perfume'), 
                    ExemptItem.new(9.75,1, false, 'packet of headache pills'),
                    ExemptItem.new(11.25,3,true, 'boxes of chocolate')]}
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
                receipt.print
                expect(receipt.sale_taxes).to eql(7.6)
            end
        end
        describe "total sale" do
            it "returns the total amount of purchase" do
                receipt = described_class.new(input_2)
                expect(receipt.total_sale).to eql(65.15)
            end
        end
    end
    context 'input 2' do
        describe "total taxes" do
            it "returns the total amount of taxes" do
                receipt = described_class.new(input_3)
                receipt.print
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
    