RSpec.describe 'a double will' do
  it 'only allows defined methods to be invoked' do
    # must define method(s) to use along with double
    stuntman = double('Johnny Danger', jump: 'high', light_on_fire: true)
    expect(stuntman.jump).to eq('high')
    expect(stuntman.light_on_fire).to eq(true)
  end
end
