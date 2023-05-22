class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction_amount
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction_amount = 0
    end
  
    def add_item(title, price, quantity = 1)
      quantity.times do
        self.items << title
      end
      self.total += price * quantity
      self.last_transaction_amount = price * quantity
    end
  
    def apply_discount
      if discount > 0
        discount_amount = (total * (discount.to_f / 100)).to_i
        self.total -= discount_amount
        "After the discount, the total comes to $#{total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= last_transaction_amount
    end
  end
  
