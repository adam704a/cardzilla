require 'test/unit'
require 'Cardzilla'

class CardzillaTest < Test::Unit::TestCase
  
  def test_royal_flush
    hand = ['Ah','Kh','Qh','Jh','10h']
    assert_equal "royal flush, good job",
      Cardzilla.new(hand).get_best_hand
  end
  
  def test_straight_flush
    hand = ['2c','3c','4c','5c','6c']
    assert_equal "straight flush",
      Cardzilla.new(hand).get_best_hand
  end
  
  def test_four_of_a_kind
    hand = ['2c','2d','2h','2s','6c']
    assert_equal "four of a kind",
      Cardzilla.new(hand).get_best_hand
  end
  
  def test_full_house
    hand = ['6c','6d','7h','7d','7s']
    assert_equal "full house",
      Cardzilla.new(hand).get_best_hand
  end
  
  def test_flush
    hand = ['9c','6c','7c','10c','Ac']
    assert_equal "flush",
      Cardzilla.new(hand).get_best_hand
  end
  
  def test_straight
    hand = ['9h','10c','Jc','Qc','Kc']
    assert_equal "straight",
      Cardzilla.new(hand).get_best_hand
  end
  
  def test_three_of_a_kind
    hand = ['10h','10c','10s','4c','Kc']
    assert_equal "three of a kind",
      Cardzilla.new(hand).get_best_hand
  end
  
  def test_two_pair
    hand = ['10h','10c','9s','9c','Kc']
    assert_equal "two pair",
      Cardzilla.new(hand).get_best_hand
  end
  
  def test_one_pair
    hand = ['Jd','Kh','3s','9c','Kc']
    assert_equal "one pair",
      Cardzilla.new(hand).get_best_hand
  end
  
  def test_high_card
    hand = ['Jd','3h','4s','9c','2c']
    assert_equal "jack",
      Cardzilla.new(hand).get_best_hand
  end
  
  def test_not_enough_cards
    hand = ['Jd','3h']
    assert_equal "this is not a valid hand",
      Cardzilla.new(hand).get_best_hand
  end
  
  def test_duplicate_cards
    hand = ['Jd','Jd','4s','9c','2c']
    assert_equal "this is not a valid hand",
      Cardzilla.new(hand).get_best_hand
  end

end