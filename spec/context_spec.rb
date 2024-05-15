# frozen_string_literal: true

# community syntax says if test an instance variable prepend the var with a '#'
# otherwise if testing a class, prepend the class with a '.'
RSpec.describe '#even? method' do
  let(:is_even_number) do
    lambda do |num|
      num.even?
    end
  end
  context 'with even number' do
    it 'should return true' do
      expect(is_even_number.call(136_962)).to eq(true)
    end
  end
  context 'with odd number do'
  it 'should return false' do
    expect(is_even_number.call(57_987)).to eq(false)
  end
end
