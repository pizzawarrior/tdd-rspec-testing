RSpec.describe 'matching arguments' do
  it 'can return different values depending on the argument' do
    arr_with_three_items = double # [1, 2, 3]
    allow(arr_with_three_items).to receive(:first).with(no_args).and_return(1)
    allow(arr_with_three_items).to receive(:first).with(1).and_return([1])
    allow(arr_with_three_items).to receive(:first).with(2).and_return([1, 2])
    allow(arr_with_three_items).to receive(:first).with(3).and_return([1, 2, 3])

    expect(arr_with_three_items.first).to eq(1)
    expect(arr_with_three_items.first(1)).to eq([1])
    expect(arr_with_three_items.first(2)).to eq([1, 2])
    expect(arr_with_three_items.first(3)).to eq([1, 2, 3])
  end
end
