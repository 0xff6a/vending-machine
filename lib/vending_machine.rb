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

  def coin_reload(new_coins)
    new_coins.each { |change| change_present?(change) ? 
          update_denomination_amount(change) : add_change(change) }
  end

  def products
    baskets.map(&:product)
  end

  def denominations
    coins.map(&:denomination)
  end

  def basket_for(product)
    baskets[products.index(product)]
  end

  def change_for(denomination)
    coins[denominations.index(denomination)]
  end

  private

  def add_basket(new_basket)
    @baskets << new_basket
  end

  def add_change(change)
    @coins << change
  end

  def update_stock_with(new_basket)
    basket_for(new_basket.product).stock += new_basket.stock
  end

  def update_denomination_amount(new_change)
    change_for(new_change.denomination).amount += new_change.amount
  end

  def product_present?(basket)
    products.include?(basket.product)
  end

  def change_present?(change)
    denominations.include?(change.denomination)
  end

end