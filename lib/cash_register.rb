
class CashRegister
    attr_accessor :total, :title, :price, :quantity, :discount, :items, :transaction

    def initialize (discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def current_total(total)
        @total += total
    end


    def add_item(title, price, quantity=1)
        self.title = title
        self.quantity = quantity
        self.transaction= price.to_f * quantity
        self.total += self.transaction
        quantity.times do
            self.items.push(title)
        end
    end


    def apply_discount
        if self.discount != 0
            after_discount = (100 - self.discount.to_f)/100
            self.total = (self.total * after_discount).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.transaction
    end

  
end
