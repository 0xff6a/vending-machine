class VendingMachine

  attr_reader :baskets, :coins

  def initialize(baskets, coins)
    @baskets = baskets
    @coins = coins
  end

  def purchase(product_id, money)
    return release_product(product_id) if exact_change_given?(product_id, money)
    insufficient_change_given?(product_id, money) ? insufficient_funds_msg :
        release_product_with_change(product_id, money)
  end

  def release_product_with_change(product_id, money)
    [ 
      release_product(product_id), 
      release_change(money, product_id)
    ]
  end

  def release_change(money, product_id)

    Change.change_for(money - price_by(product_id))
  end

  def release_product(product_id)
    product_ids.include?(product_id) ? remove_product_from_stock(product_id) : no_product_error
    product_by(product_id)
  end

  def remove_product_from_stock(id)
    basket_for(product_by(id)).update_stock(-1)
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

  def product_ids
    products.map(&:id)
  end

  def denominations
    coins.map(&:denomination)
  end

  def price_by(id)
    product_by(id).price
  end

  def product_by(id)
    products[product_ids.index(id)]
  end

  def basket_for(product)
    baskets[products.index(product)]
  end

  def change_by(denomination)
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
    basket_for(new_basket.product).update_stock(new_basket.stock)
  end

  def update_denomination_amount(new_change)
    change_by(new_change.denomination).amount += new_change.amount
  end

  def product_present?(basket)
    products.include?(basket.product)
  end

  def change_present?(change)
    denominations.include?(change.denomination)
  end

  def no_product_error
    raise 'The specified product does not exist'
  end

  def insufficient_funds_msg
    puts 'Insufficient funds'
  end

  def exact_change_given?(product_id, money)
    money == product_by(product_id).price
  end

  def insufficient_change_given?(product_id, money)
    money < product_by(product_id).price
  end

end