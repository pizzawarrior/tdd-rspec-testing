# frozen_string_literal: true

class Card
  attr_reader :rank, :color, :suit

  def initialize(rank, color, suit)
    @rank = rank
    @color = color
    @suit = suit
  end
end

RSpec.describe Card do
  # before hook: will run 1 time before EACH example
  before do
    # instance variable uses @ symbol:
    @card = Card.new('Ace', 'black', 'spades')
    # @ allows variable to persist throughout the example group
  end
  it 'has a rank' do
    expect(@card.rank).to eq('Ace')
  end
  it 'has a suit' do
    expect(@card.suit).to eq('spades')
  end
  it 'has a color' do
    expect(@card.color).to eq('black')
  end
end
