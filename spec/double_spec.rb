RSpec.describe 'a double will' do
  it 'only allow defined methods to be invoked' do
    # must define method(s) to use along with double
    stuntman = double('Johnny Danger', jump: 'high', light_on_fire: true)
    expect(stuntman.jump).to eq('high')
    expect(stuntman.light_on_fire).to eq(true)
  end
  it 'allows an alternative way to define the test using the allow method' do
    spiderman = double('Peter Parker')
    allow(spiderman).to receive(:catch_criminal).and_return('aww shuxx')
    expect(spiderman.catch_criminal).to eq('aww shuxx')
  end
end

class Surfboard
  def initialize(shaper)
    @shaper = shaper
  end

  def waxed?
    sleep(3)
    true
  end

  def shred
    'heck yes bro'
  end

  def fin_boxes
    5
  end
end

class SurfMovie
  attr_reader :surfboard

  def initialize(surfboard)
    @surfboard = surfboard
  end

  def start_filming
    return unless @surfboard.waxed?

    puts surfboard.fin_boxes
    puts surfboard.shred
  end
end

# surfboard = Surfboard.new('Mayhem')
# surf_movie = SurfMovie.new(surfboard)
# surf_movie.start_filming

RSpec.describe SurfMovie do
  # use a double to simulate the Surfboard
  # note that rental_board has the exact same public interface as the surfboard class
  # this is called polymorphism. The class itself does not matter as long as the same methods are available
  let(:rental_board) { double('Rusty', waxed?: true, shred: 'once I get used to it', fin_boxes: 2) }
  subject { described_class.new(rental_board) }

  describe '#start_filming method' do
    it 'expects a rental_board to have 3 properties' do
      expect(rental_board).to receive(:waxed?)
      expect(rental_board).to receive(:shred)
      expect(rental_board).to receive(:fin_boxes)
      subject.start_filming
    end
    it 'can check that a method is invoked exactly once' do
      expect(rental_board).to receive(:shred).once
      subject.start_filming
    end
    it 'can count the num of times a method is invoked' do
      expect(rental_board).to receive(:shred).exactly(2).times
      subject.start_filming
      subject.start_filming
    end
  end
end
