class Basket

  attr_reader :product, :stock

  def initialize(product, stock)
    @product = product
    @stock = stock
  end

end