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
end
