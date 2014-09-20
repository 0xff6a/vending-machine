class VendingMachine

  attr_reader :products, :coins

  def initialize(products, coins)
    @products = products
    @coins = coins
  end

end