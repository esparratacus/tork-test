require 'item'
require 'exempt_item'
class ItemParser

    EXEMPT_ITEMS = [
        'book',
        'chocolate bar',
        'box of chocolates',
        'packet of headache pills'
    ]

    def self.create_item(item_string)
        item_string_arr = item_string.split(' ')
        qty = item_string_arr.slice!(0).to_i
        imported = set_imported_item(item_string_arr[0])
        price = item_string.split('at')[1].to_f
        name = product_name(item_string.split('at')[0])
        klass= set_item_class(name.strip)
        klass.new(price, qty, imported, name)
    end

    def self.set_imported_item(string)
        string == 'imported'
    end

    def self.product_name(string)
        arr = string.split('imported')
        arr.size == 1 ? arr[0] : arr[1]
    end

    def self.set_item_class(item_name)
        if EXEMPT_ITEMS.include?(item_name)
            return ExemptItem 
        else
            
            return Item
        end
    end
end