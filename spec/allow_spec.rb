RSpec.describe 'allow method' do
  it 'can customize return values for methods on doubles' do
    calculator = double
    allow(calculator).to receive(:add).and_return(15)
    expect(calculator.add).to eq(15)
  end
  it 'can stub one or more methods on a real object' do
    arr = [1, 2, 3]
    # this method uses the built in sum method
    expect(arr.sum).to eq(6)
    # here we are stubbing the sum method to return a value we want it to
    allow(arr).to receive(:sum).and_return(10)
    expect(arr.sum).to eq(10)
  end
  it 'can return multiple values in sequence' do
    mock_array = double
    # we can specify which items to return in sequence
    allow(mock_array).to receive(:pop).and_return(:a, :b, nil)
    expect(mock_array.pop).to eq(:a)
    expect(mock_array.pop).to eq(:b)
    expect(mock_array.pop).to eq(nil)
    expect(mock_array.pop).to eq(nil)
    expect(mock_array.pop).to eq(nil)
  end
end
