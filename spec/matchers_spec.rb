# No to method
RSpec.describe 'the not to method' do
  it 'checks that two values do not match' do
    expect(Array).not_to be_instance_of(Hash)
  end
end
