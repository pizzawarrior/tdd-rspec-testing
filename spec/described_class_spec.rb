class King
  attr_reader :age

  def initialize(age)
    @age = age
  end
end

# the advantage of using described_class is that if the class under test changes, we can still keep these tests
# intact the way they are. This is defensive coding that helps to future-proof against changes that may
# come later
RSpec.describe King do
  subject { described_class.new(42) }
  let(:thirty_seven) { described_class.new(37) }

  it 'expect king to have an age' do
    expect(subject.age).to eq(42)
    expect(thirty_seven.age).to eq(37)
  end
end
