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

    it 'should only accept valid denominations' do
      expect { Change.new(13, 5) }.to raise_error(RuntimeError, "change must have a valid denomination")
    end

  end

  context '#value' do

    it 'should calculate the monetary value from amount and denomination' do
      expect(change.value).to eq(250)
    end

  end

  context '#display_denomination' do

    it 'should display denomination in clear format' do
      expect(change.display_denomination).to eq('50p')
    end
  
  end

end