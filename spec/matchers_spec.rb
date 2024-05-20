RSpec.describe 'Exploring different matchers' do
  # No to method
  context 'given the not_to method' do
    it 'checks that two values do not match' do
      expect(Array).not_to be_instance_of(Hash)
    end
  end

  # eq and eql
  context 'given equality matchers' do
    let(:a) { 3.0 }
    let(:b) { 3 }
    # eq checks value NOT type
    it 'test for value and ignores type' do
      expect(a).to eq(3)
      expect(b).to eq(3.0)
      expect(a).to eq(b)
    end
    # eql checks both value AND type
    it 'test for value including type' do
      expect(a).not_to eql(3)
      expect(b).not_to eql(3.0)
      expect(a).not_to eql(b)
    end
  end

  context 'equal and be matcher' do
    let(:c) { [1, 2, 3] }
    let(:d) { [1, 2, 3] }
    let(:e) { c }
    # equal and be are the same method
    it 'test for object identity' do
      expect(e).not_to be(d)
      expect(c).not_to be(d)
      expect(c).to equal(e)
      expect(c).to eql(e)
      expect(c).to eq(e)
    end
  end

  context 'comparison matchers' do
    it 'allows for comparison with built in ruby operators' do
      expect(10).to be > 9.9999
      expect(99).to be < 99.1
      expect(1).to be >= -1
    end
  end
  describe 100 do
    it { is_expected.to be <= 100 }
  end

  context 'predicate methods and matchers' do
    it 'can be tested with Ruby methods' do
      result = 168 / 2
      expect(result).to be_even
      expect(result - 1).not_to be_even
      expect(result - 1).to be_odd
      expect([]).to be_empty
    end
  end

  context 0 do
    it { is_expected.to be_zero }
  end

  context 'all-matcher' do
    it 'allows for aggregate checks' do
      # this method...
      [1, 3, 5].each do |val|
        expect(val).to be_odd
      end
    end
    it 'allows for more concise examples' do
      # is the same as this:
      expect([1, 3, 5]).to all(be_odd)
    end
  end

  context 'be matchers' do
    it 'can test for truthiness' do
      expect(true).to be_truthy
      expect(false).not_to be_truthy
      expect('hello').to be_truthy
      expect([1, 2]).to be_truthy
      expect(:symbol).to be_truthy
      expect(nil).to be_falsy
    end
    it 'can test for nil' do
      expect(nil).to be_nil

      my_hash = { a: 5 }
      expect(my_hash[:b]).to be_nil
    end
  end
end
