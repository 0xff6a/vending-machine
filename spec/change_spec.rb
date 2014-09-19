require 'change'

describe Change do
  
  let(:change) { Change.new(50, 5) }

  context 'initialisation' do

    it 'should have a denomination' do
      expect(change.denomination).to eq(50)
    end

    it 'should have an amount' do
      expect(change.amount).to eq(5)
    end

    xit 'should only accept valid denominations' do
    end

  end

  context '#value' do

    it 'should calculate the monetary value from amount and denomination' do
      expect(change.value).to eq(250)
    end

  end



end