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
        round_number(price * SALES_TAX_RATE)
    end

    def import_tax
        is_imported? ? round_number(price * IMPORT_TAX_RATE) : 0
    end

    def total_taxes
        (sales_tax + import_tax) * qty
    end

    def total
        (price * qty) + total_taxes
    end

    def is_imported?
        is_imported
    end

    def round_number(number)
        remainder = number % 0.05
        if remainder >= 0.025
          return (number - remainder + 0.05).round(2)
        else
          return (number - remainder).round(2)
        end
    end

    def to_s
        "#{qty} #{is_imported? ? 'imported ' : '' }#{name}: #{sprintf("%.2f", total)}"
    end
end