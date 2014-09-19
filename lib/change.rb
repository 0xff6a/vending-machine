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

  private 

  def denomination_error
    raise "change must have a valid denomination"
  end

  def valid_denomination?
    VALID_DENOMINATIONS.keys.include?(denomination)
  end


end