Dir[File.join(__dir__, 'lib', '*.rb')].each {|file| require file }

def create_coins(amount)
  Change::VALID_DENOMINATIONS.keys.map { |denom| Change.new(denom, amount) }
end

def create_baskets(products, stock)
  products.map { |product| Basket.new(product, stock) }
end

def main
  products = 
  [
    Product.new(0, 55),
    Product.new(1, 75),
    Product.new(2, 97)
  ]

  coins = create_coins(50)
  baskets = create_baskets(products, 10)

  vending_machine = VendingMachine.new(baskets, coins)
end

#---------Run Call-----------------
main





