class Basket

  attr_reader   :product, :stock

  def initialize(product, stock)
    @product = product
    @stock = stock
  end

  def update_stock(difference)
    @stock += difference
  end

end