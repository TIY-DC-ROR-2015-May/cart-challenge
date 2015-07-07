class Item

  attr_reader :name, :price

  def initialize name, price
    @name = name
    @price = price
  end

end

class Cart

  def initialize tax=nil
    @contents = []
    if !tax.nil?
      @tax_rate = tax[:tax_rate]
    else
      @tax_rate = tax
    end
  end

  def add_item item
    @contents.push(item)
  end

  def item_count
    @contents.count
  end

  def contains? item
    @contents.include?(item)
  end

  def tax_rate
    @tax_rate || 10
  end

  def cost_before_tax
    cbt = @contents.map { |c| c.price }
    cbt.inject(:+).to_f
  end

  def cost_after_tax
    tax = cost_before_tax * (tax_rate / 100.0)
    cost_before_tax + tax
  end

end