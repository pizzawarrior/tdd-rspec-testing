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

  context 'change matchers' do
    subject { [1, 2, 3] }
    it 'checks that a method changes object state' do
      expect { subject.push(4) }.to change { subject.length }.from(3).to(4)
      expect { subject.pop }.to change { subject.length }.by(-1)
    end
  end

  context 'contain exactly matcher' do
    subject { [0, 1, 2] }
    it 'should check for the presence of all elements' do
      # items can appear in any order, as long as all of them are present
      expect(subject).to contain_exactly(2, 0, 1)
    end
  end
end

class FamousSurfer
  attr_reader :name, :board_style

  def initialize(name, board_style)
    @name = name
    @board_style = board_style
  end
end

RSpec.describe 'have attributes matcher' do
  describe FamousSurfer.new('Kelly Slater', 'short board') do
    it 'checks for object attributes and proper values' do
      expect(subject).to have_attributes(board_style: 'short board')
    end
    it { is_expected.to have_attributes(name: 'Kelly Slater') }
  end
end

RSpec.describe 'include matcher' do
  describe 'hot tamale' do
    it 'checks for substring inclusion' do
      expect(subject).to include('hot')
      expect(subject).not_to include('not')
    end
  end
  describe [37, 10, 40, 20] do
    it 'checks for inclusion regardless of order' do
      expect(subject).to include(10, 20)
    end
    it { is_expected.not_to include(789) }
  end
  describe({ a: 13, b: 17 }) do
    it 'can check for values in key-value pairs' do
      expect(subject).to include(a: 13)
    end
  end
end

RSpec.describe 'start_with and end_with matchers' do
  describe 'caterpillar' do
    it 'should check for substring at beginning or end' do
      expect(subject).to start_with('cater')
      expect(subject).to end_with('pillar')
    end
  end
  describe([138, 9, 69]) do
    it 'should check for substring at beginning or end' do
      expect(subject).to start_with(138)
    end
    it { is_expected.to end_with(69) }
    it { is_expected.to end_with(9, 69) }
  end
end

#  create custom error class to inherit from built in error class
class CustomError < StandardError; end

RSpec.describe 'raise_error matcher' do
  def some_method
    x
  end

  it 'can check for a specific error' do
    expect { some_method }.to raise_error(NameError)
  end
  it 'can check for a custom error' do
    expect { raise CustomError }.to raise_error(CustomError)
  end
end

class Skateboard
  def has_pop
    'snap!'
  end

  def can_slide
    'that was dope!'
  end

  def has_wheels(count)
    "I have #{count} wheels"
  end
end

RSpec.describe Skateboard do
  it 'confirms that an object can respond to a method' do
    expect(subject).to respond_to(:has_pop, :can_slide)
  end
  it 'can respond to a method with arguments' do
    expect(subject).to respond_to(:has_wheels).with(1).arguments
  end
end
