require 'vending_machine'

describe VendingMachine do
  
  let(:product) { double Product, id: 0, price: 55                                }
  let(:basket)  { double Basket, product: product, stock: 8, :update_stock => nil }
  let(:change)  { double Change, denomination: 5, amount: 30                      }
  let(:vend)    { VendingMachine.new([basket], [change])                          }

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
      expect(vend.baskets.first).to receive(:update_stock).with(basket.stock)
      vend.basket_reload([basket])
    end

    it 'can be reloaded with change' do
      expect(vend.coins.first).to receive(:amount=).with(change.amount * 2)
      vend.coin_reload([change])
    end

  end

  context 'Vending' do

    it 'can release a product' do
      expect(vend.release_product(0)).to eq product
    end

    it 'raises an error if trying to release a product not loaded' do
      expect{ vend.release_product(13) }.
          to raise_error(RuntimeError, 'The specified product does not exist')
    end

    it 'returns a selected product if enough money is provided' do
      expect(vend.purchase(0, 55)).to eq product
    end

    xit 'returns change if too much money is provided' do 
      
    end

    it 'requests more money if not enough is provided' do
      expect(STDOUT).to receive(:puts).with('Insufficient funds')
      expect(vend.purchase(0, 25)).to be nil
    end

  end


end