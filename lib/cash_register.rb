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
        self.items << title # Adds the item's title to the items array for each quantity
      end
      self.total += price * quantity # Calculates the total price by multiplying the price with the quantity
      self.last_transaction_amount = price * quantity # Updates the last_transaction_amount to the price multiplied by the quantity
    end
  
    def apply_discount
      if discount > 0
        discount_amount = (total * (discount.to_f / 100)).to_i # Calculates the discount amount as a percentage of the total price
        self.total -= discount_amount # Subtracts the discount amount from the total
        "After the discount, the total comes to $#{total}." # Returns a message indicating the new total after applying the discount
      else
        "There is no discount to apply." # Returns a message indicating that there is no discount to apply
      end
    end
  
    def void_last_transaction
      self.total -= last_transaction_amount # Subtracts the last transaction amount from the total to void the last transaction
    end
  end
  
  
