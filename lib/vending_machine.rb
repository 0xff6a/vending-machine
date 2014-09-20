class VendingMachine

  attr_reader :baskets, :coins

  def initialize(baskets, coins)
    @baskets = baskets
    @coins = coins
  end

  def basket_reload(new_baskets)
    new_baskets.each { |basket| product_present?(basket) ? 
          update_stock_with(basket) : add_basket(basket) }
  end

  def products
    baskets.map(&:product)
  end

  def basket_for(product)
    baskets[products.index(product)]
  end

  private

  def add_basket(new_basket)
    @baskets << new_basket
  end

  def update_stock_with(new_basket)
     basket_for(new_basket.product).stock += new_basket.stock
  end

  def product_present?(basket)
    products.include?(basket.product)
  end

end