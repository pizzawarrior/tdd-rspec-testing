# we define a shared example and refer to it again in the future using the string name that we pass into it
# this allows us to use multiple shared examples
RSpec.shared_examples 'a Ruby object with a length of 3' do
  it 'returns the length of each object' do
    expect(subject.length).to eq(3)
  end
end

RSpec.describe Array do
  subject { [4, 5, 6] }
  include_examples 'a Ruby object with a length of 3'
end

RSpec.describe Hash do
  subject { { a: 1, b: 13, c: 97 } }
  include_examples 'a Ruby object with a length of 3'
end

RSpec.describe String do
  subject { 'bye' }
  include_examples 'a Ruby object with a length of 3'
end

class SausageRoll
  def length
    3
  end
end

RSpec.describe SausageRoll do
  subject { described_class.new }
  include_examples 'a Ruby object with a length of 3'
end
