require 'product'

describe Product do
  
  let(:product) { Product.new(0, 2.55) }

  it 'should have an id' do
    expect(product.id).to eq(0)
  end

  it 'should have a price' do
    expect(product.price).to eq(2.55)
  end

end