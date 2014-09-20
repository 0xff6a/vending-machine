require 'vending_machine'

describe VendingMachine do
  
  let(:prod)    { double Product, id: 0, price: 5             }
  let(:chng)    { double Change, denomination: 5, amount: 30  }
  let(:vend)    { VendingMachine.new([prod], [chng])          }

  context 'Initialisation' do

    it 'should be loaded with change' do
      expect(vend.coins).to eq [chng]
    end

    it 'should be loaded with products' do
      expect(vend.products).to eq [prod]
    end

  end

  xcontext 'Reloading' do

    it 'can be reloaded with products' do
      
    end

    it 'can be reloaded with change' do
    end

  end

  xcontext 'Vending' do

    it 'returns a selected product if enough money is provided' do
    end

    it 'returns change if too much money is provided' do 
    end

    it 'requests more money if not enough is provided' do
    end

  end


end