RSpec.describe 'shorthand syntax' do
  subject { 5 }

  it 'should return a valid number' do
    expect(subject).to eq(5)
  end
  # the above example is the same as this shorthand:
  context 'with one-liner syntax' do
    it { is_expected.to eq(5) }
    # 'it' refers to the subject defined above in the parent scope
  end
end
