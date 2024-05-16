# frozen_string_literal: true

RSpec.describe 'before and after hooks' do
  let(:add_num_to_x) do
    lambda do |x|
      x + 2
    end
  end

  #   hooks are just a moment in between operations
  before do
    print 'should add 2 to x'
  end

  after do
    print 'the result should have been added'
  end

  context 'when passed a positive number' do
    it 'returns a positive num' do
      expect(add_num_to_x.call(9)).to eq(11)
    end
  end

  context 'when passed a negative number' do
    it 'returns a positive num' do
      expect(add_num_to_x.call(-1)).to eq(1)
    end
  end
end
