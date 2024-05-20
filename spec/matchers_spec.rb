# No to method
RSpec.describe 'Exploring different matchers' do
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

    it 'test for sameness' do
      expect(e).not_to be(d)
      expect(c).not_to be(d)
      expect(c).to equal(e)
    end
  end
end
