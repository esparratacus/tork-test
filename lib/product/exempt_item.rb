require 'product/item'
module Product
    class ExemptItem < Item

        def sales_tax
            0
        end

    end
end