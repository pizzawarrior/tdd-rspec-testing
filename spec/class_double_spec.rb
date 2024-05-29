# this is stubbed below
# class API
#   def self.call_api
#     # integration logic to make API call
#   end
# end

class APIresponse
  attr_reader :content

  def success
    @content = API.call_api
  end
end

RSpec.describe APIresponse do
  it 'can only implement class methods that are defined on the class' do
    success_response = class_double('API',
                                    call_api: { data: { cust_id: '897ucdb',
                                                        invoice_id: '4947nmmcmc78' } }).as_stubbed_const
    expect(success_response).to receive(:call_api)
    subject.success
    expect(subject.content).to eq({ data: { cust_id: '897ucdb',
                                            invoice_id: '4947nmmcmc78' } })
  end
end
