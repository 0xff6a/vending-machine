class Basket

  attr_reader   :product
  attr_accessor :stock

  def initialize(product, stock)
    @product = product
    @stock = stock
  end

end