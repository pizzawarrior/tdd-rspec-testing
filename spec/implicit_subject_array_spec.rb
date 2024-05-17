# frozen_string_literal: true

# we pass a class arg to the describe method so rspec can call the 'new' method on it.
# if we passed in a string to describe this would break, as you can not call the 'new' method on a string
RSpec.describe Array do
  it 'should return an empty array' do
    expect(subject.length).to eq(0)
    subject.push('steve')
    expect(subject.length).to eq(1)
  end
  it 'should have a type of array' do
    expect(subject).to be_instance_of(Array)
  end
end
