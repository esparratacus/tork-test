module Product
    class Item
        attr_reader :price, :qty, :is_imported, :name
    
        SALES_TAX_RATE = 0.1.freeze
        IMPORT_TAX_RATE = 0.05.freeze
    
        def initialize(price, qty, is_imported = false, name = '')
            @price = price
            @qty = qty
            @is_imported = is_imported
            @name = name
        end
    
        def sales_tax
            round_number((price * SALES_TAX_RATE).round(2))
        end
    
        def import_tax
            is_imported? ? round_number((price * IMPORT_TAX_RATE).round(2)) : 0
        end
    
        def total_taxes
            round_number((sales_tax + import_tax) * qty)
        end
    
        def total
            (price * qty).round(2) + total_taxes
        end
    
        def is_imported?
            is_imported
        end
    
        def round_number(number)
            (number * (1/0.05)).ceil/(1/0.05)
        end
    
        def to_s
            "#{qty} #{is_imported? ? 'imported ' : '' }#{name}: #{sprintf("%.2f", total)}"
        end
    end
end