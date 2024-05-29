# a quick note on spies vs doubles:
# spies place the expectation after the action, while
# a double places the expectation before the action

RSpec.describe 'spies' do
  let(:customer) { spy('customer') }

  it 'confirms a message has been received' do
    customer.buy_product
    expect(customer).to have_received(:buy_product)
    expect(customer).not_to have_received(:overcharge)
  end
  it 'retains the same functionality of a normal double' do
    customer.buy_product
    customer.buy_product
    customer.buy_product('new_contract')
    expect(customer).to have_received(:buy_product).exactly(3).times
    expect(customer).to have_received(:buy_product).at_least(2).times
    expect(customer).to have_received(:buy_product).with('new_contract')
    expect(customer).to have_received(:buy_product).once.with('new_contract')
  end
end
