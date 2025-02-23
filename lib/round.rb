class Round
  attr_reader :deck, :turns, :index, :number_correct, :correct_array, :category_array
  attr_accessor :card_deck

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @index = 0
    @correct_array = []
    @category_array = []
    @card_deck = deck.cards
  end

  def current_card
    @card_deck[0]
  end

  def take_turn(guess)
    another_turn = Turn.new(guess, current_card)
    @category_array << another_turn.card.category
    if another_turn.correct? == true
      @number_correct += 1
      @correct_array << another_turn.card.category
    end
    @turns << another_turn
    @index += 1
    @card_deck = deck.cards.rotate(@index)
    another_turn
  end

  def number_correct_by_category(category)
    @correct_array.count(category)
  end

  def percent_correct
    correct = @correct_array.count.to_f
    total = @turns.count.to_f
    percent = (correct / total) * 100
  end

  def percent_correct_by_category(category_argument)
    category_number = @category_array.count(category_argument)
    category_correct = number_correct_by_category(category_argument)
    result = (category_correct / category_number) * 100
    result.to_f
  end

end
