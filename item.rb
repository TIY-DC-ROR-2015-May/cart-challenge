class Item

  attr_reader :name, :price

  def initialize name, price
    @name = name
    @price = price
  end

end

class Cart

  attr_reader :item, :contents

  def initialize
    @contents = []
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

  def cost_before_tax
    cbt = @contents.map { |c| c.price }
    cbt.inject(:+)
  end

  def cost_after_tax
    cost_before_tax * 1.1
  end

  def tax_rate
  end

end