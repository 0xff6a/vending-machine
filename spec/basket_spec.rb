require 'basket'

describe Basket do 

  let(:prod)     { double Product, id: 0, price: 5  }
  let(:basket)   { Basket.new(prod, 10)             }  

  it 'should hold a product' do
    expect(basket.product).to eq prod
  end

  it 'should have a stock quantity' do
    expect(basket.stock).to eq 10
  end

end