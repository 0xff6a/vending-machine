require 'vending_machine'

describe VendingMachine do
  
  let(:product)    { double Product, id: 0, price: 5                              }
  let(:basket)     { double Basket, product: product, stock: 8, :stock= => nil    }
  let(:change)     { double Change, denomination: 5, amount: 30                   }
  let(:vend)       { VendingMachine.new([basket], [change])                       }

  context 'Initialisation' do

    it 'should be loaded with change' do
      expect(vend.coins).to eq [change]
    end

    it 'should be loaded with baskets' do
      expect(vend.baskets).to eq [basket]
    end

  end

  context 'Reloading' do

    it 'can be reloaded with baskets' do
      expect(basket).to receive(:stock=).with(basket.stock * 2)
      vend.basket_reload([basket])
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