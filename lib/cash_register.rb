class CashRegister
    attr_accessor :total
    attr_reader :discount
  
    def initialize(discount=0)
      @discount = discount
      @total = 0.0
      @items = []
    end
  
    def add_item(title, price, quantity=1)
      @total += price * quantity
      quantity.times { @items << title }
    end
  
    def apply_discount
      if @discount == 0
        return "There is no discount to apply."
      else
        @total = @total - (@total * @discount / 100)
        return "After the discount, the total comes to $#{(@total.round(2)).to_i}."
      end
    end
  
    def items
      @items
    end
  
    def void_last_transaction
        if @items.empty?
          @total = 0.0
        else
          @total -= (@items.pop[1]).to_f
        end
      end
end
