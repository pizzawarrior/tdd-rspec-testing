RSpec.describe Hash do
  # we can pass an alias to rename 'subject'
  # this is comparible to let(:customer) {{ ian: 41, tim: 40 }} however, using subject in thsi manner
  # allows us some rspec shorthand not available to the 'let' method. More on this later
  subject(:customer) do
    # create custom subject here
    { ian: 41, tim: 40 }
  end
  it 'should have a length of 2' do
    expect(customer.size).to eq(2)
    expect(subject.size).to eq(2)
  end
end
