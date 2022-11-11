
require "pry"

class CashRegister

  attr_accessor :discount, :total, :items, :last_transaction

  def initialize (discount = 0)
    @discount = discount
    @total = 0
    @items = []
    @last_transaction = 0
  end
 
  def add_item (title, price, quantity = 0)      

    if (quantity && quantity > 0)
      self.last_transaction = price * quantity
      self.total += last_transaction
      x = 0
      while x < quantity
        self.items << title
        x += 1
      end
    else
      self.last_transaction = price
      self.total += price
      self.items << title
    end 
  end

  def apply_discount
    if discount != 0
      self.total -= self.total * (self.discount.to_f / 100)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction 
    self.total -= self.last_transaction
  end  
end


# c1 = CashRegister.new(20)
# binding.pry