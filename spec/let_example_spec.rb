# frozen_string_literal: true

class Card
  attr_reader :rank, :color, :suit

  def initialize(rank, color, suit)
    @rank = rank
    @color = color
    @suit = suit
  end
end

# the `let` method uses MEMOIZATION. It's value is cached for future runs.

RSpec.describe Card do
  # this card object will only be instantiated one time: line 21, when it is called for the first time
  # this is called lazy loading
  let(:card) { Card.new('Ace', 'black', 'spades') }

  it 'has a rank' do
    expect(card.rank).to eq('Ace')
  end
  it 'has properties' do
    expect(card.suit).to eq('spades')
  end
  it 'has properties' do
    expect(card.color).to eq('black')
  end
end
