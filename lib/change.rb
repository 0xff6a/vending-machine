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
    change_factory(value_to_denominations(value))
  end

  private 

  def self.value_to_denominations(value)
    result = []
    while value != 0
      closest_result = closest_denomination(value)
      result << [closest_result, value / closest_result]
      value %= closest_result
    end
    result
  end

  def self.closest_denomination(value)
    VALID_DENOMINATIONS.keys.select {|denom| denom <= value }.min_by{ |denom| (denom - value).abs }
  end

  def self.change_factory(change_data_array)
    change_data_array.map{ |denom, amt| Change.new(denom, amt) }
  end

  def denomination_error
    raise "change must have a valid denomination"
  end

  def valid_denomination?
    VALID_DENOMINATIONS.keys.include?(denomination)
  end

end

