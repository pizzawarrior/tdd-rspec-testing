# frozen_string_literal: true

class Card
  attr_reader :type, :color, :suit

  def initialize(type, color, suit)
    @type = type
    @color = color
    @suit = suit
  end
end

RSpec.describe Card do
  it 'has a type' do
    card = Card.new('Ace of Spades', 'black', 'spades')
    expect(card.type).to eq('Ace of Spades')
    print card.suit
  end
end
