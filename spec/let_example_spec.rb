# frozen_string_literal: true

class Card
  attr_accessor :rank, :color, :suit

  def initialize(rank, color, suit)
    @rank = rank
    @color = color
    @suit = suit
  end
end

# the `let` method uses MEMOIZATION. It's value is cached for future runs.

# we use the '.' in front of the 'Card' title to indicate it is a class object

# RSpec.describe Card do
RSpec.describe 'a .Card has properties' do
  # this card object will only be instantiated for the first time on line 21, then again each time for each example
  # this is called lazy loading
  let(:card) { Card.new('Ace', 'black', 'spades') }

  it 'has a rank and that rank can change' do
    expect(card.rank).to eq('Ace')
    card.rank = 'Queen'
    expect(card.rank).to eq('Queen')
  end

  it 'has a suit' do
    expect(card.suit).to eq('spades')
  end

  it 'has a color' do
    expect(card.color).to eq('black')
  end

  it 'has a custom error message' do
    card.color = 'pink'
    comparison = 'pink'
    expect(card.color).to eq(comparison), "Error: Expected #{card.color} but got #{comparison} instead"
  end
end
