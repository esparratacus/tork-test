require 'product/item'
require 'product/exempt_item'

class Receipt

    attr_reader :items

    def initialize(items)
        @items = items
    end

    def print
        items.each{|i| puts "#{i.to_s}"}
        puts "Sales Taxes: #{sprintf("%.2f", sale_taxes)}"
        puts "Total: #{sprintf("%.2f", total_sale)}"
    end

    def sale_taxes
        items.sum(&:total_taxes)
    end

    def total_sale
        items.sum(&:total)
    end

end