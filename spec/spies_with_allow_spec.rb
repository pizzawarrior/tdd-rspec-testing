# 'allow' also grants spy-like functionality to our expectations

class Customer
  def initialize(account_number)
    @account_number = account_number
  end
end

class ActiveAccount
  attr_reader :accounts

  def initialize
    @accounts = []
  end

  def add_to_active_accounts(account_number)
    # push new instances of account_number into accounts array
    @accounts << Customer.new(account_number)
  end
end

RSpec.describe ActiveAccount do
  let(:customer) { instance_double(Customer) }

  before do
    # mock Customer class method
    allow(Customer).to receive(:new).and_return(customer)
  end

  it 'adds a customer account to active accounts' do
    subject.add_to_active_accounts('xbni878imnzcx99')
    expect(Customer).to have_received(:new).with('xbni878imnzcx99')
    expect(subject.accounts.length).to eq(1)
    expect(subject.accounts.first).to eq(customer)
  end
end
