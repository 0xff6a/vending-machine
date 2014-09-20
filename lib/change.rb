class Change

  VALID_DENOMINATIONS = 

  {
    1   => '1p',
    2   => '2p',
    5   => '5p',
    10  => '10p',
    20  => '20p',
    50  => '50p',
    100 => '£1',
    200 => '£2'
  }

  attr_reader :denomination, :amount

  def initialize(denomination_in_pence, amount)
    @denomination = denomination_in_pence
    @amount = amount
    valid?
  end

  def value
    denomination * amount
  end

  def display_denomination
    VALID_DENOMINATIONS[denomination]
  end

  def valid?
    denomination_error unless valid_denomination?
  end

  def self.change_for(value)
    change_factory(change_data_for(value))
  end

  private 

  def self.change_data_for(value)
    remove_zero_amounts(all_change_data_for(value))
  end

  def self.all_change_data_for(value)
    ordered_denominations_below(value).map do |denom|
      count, value = (value / denom), (value % denom)
      [denom, count]
    end
  end

  def self.remove_zero_amounts(money_data)
    money_data.reject{ |denom, amt| amt == 0 }
  end

  def self.change_factory(money_data)
    money_data.map{ |denom, amt| Change.new(denom, amt) }
  end

  def denomination_error
    raise "change must have a valid denomination"
  end

  def valid_denomination?
    denominations.include?(denomination)
  end

  def self.ordered_denominations_below(value)
    denominations_below(value).reverse
  end

  def self.denominations_below(value)
    VALID_DENOMINATIONS.keys.select {|denom| denom <= value }
  end

  def denominations
    VALID_DENOMINATIONS.keys
  end

end

