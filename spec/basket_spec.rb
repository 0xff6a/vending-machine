require 'basket'

describe Basket do 

  let(:prod)     { double Product, id: 0, price: 5  }
  let(:basket)   { Basket.new(prod, 10)             }  

  context 'Initialisation' do

    it 'should hold a product' do
      expect(basket.product).to eq prod
    end

    it 'should have a stock quantity' do
      expect(basket.stock).to eq 10
    end

  end
  
  context '#update_stock' do
  
    it 'can update the stock quantity' do
      basket.update_stock(-5)
      expect(basket.stock).to eq 5
    end
  
  end

end