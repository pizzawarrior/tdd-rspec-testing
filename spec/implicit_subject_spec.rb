# frozen_string_literal: true

# by using 'subject', it will instantiate whatever is passed into the describe method, in this case a hash
# this is the equivalent of let(:new_hash) { {} }
RSpec.describe Hash do
  it 'should return an empty hash' do
    expect(subject).to eq({})
  end

  it 'should have a length of 0' do
    expect(subject.length).to eq(0)
    puts subject
    puts subject.class
  end

  it 'should be mutable' do
    subject[:some_name] = 'a_name'
    expect(subject.size).to eq(1)
  end

  context 'when adding a new property' do
    let(:new_hash) { {} }
    it 'should increase the length by 1' do
      new_hash[:name] = 'Tony'
      expect(new_hash.size).to eq(1)
      expect(new_hash).to be_instance_of(Hash)
      expect(new_hash[:name]).to eq('Tony')
    end
  end
end
