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
end
