require 'money'
require 'change'

describe Money do
  
  let(:money) { Money.new(21) }

  it 'should have a value' do
    expect(money.value).to eq(21)
  end

  xit 'can be created from a collection of change' do

  end

end