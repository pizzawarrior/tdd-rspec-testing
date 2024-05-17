RSpec.shared_context 'common context' do
  before do
    @foods = []
  end

  def add_condiment
    'ketchup'
  end

  let(:toppings) { { onion: 3, tomato: 2, olives: 6 } }
end

RSpec.describe 'first example group' do
  include_context 'common context'

  it 'can use instance variables declared outside current scope' do
    expect(@foods.length).to eq(0)
    @foods << 'Sushi fish'
    expect(@foods.length).to eq(1)
  end

  it 'can reuse instance variables across examples' do
    expect(@foods.length).to eq(0)
  end

  it 'can use shared helper methods' do
    expect(add_condiment).to eq('ketchup')
  end
end

RSpec.describe 'another example from a different file perhaps' do
  include_context 'common context'

  it 'can use shared let values' do
    expect(toppings[:tomato]).to eq(2)
  end
end
