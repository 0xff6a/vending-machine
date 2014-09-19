class Change

  attr_reader :denomination, :amount

  def initialize(denomination_in_pence, amount)
    @denomination = denomination_in_pence
    @amount = amount
  end

  def value
    denomination * amount
  end

end