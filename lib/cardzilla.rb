class Cardzilla
  
  attr_accessor :hand, :twos, :threes, :fours, :fives, :sixes, :sevens, :eights, :nines, :tens, :jacks, :queens, :kings, :aces, :spades, :hearts,:clubs,:diamonds 

  
  def initialize(hand)
    @hand = hand
    
    self.twos = []
    self.threes = []
    self.fours = []
    self.fives = []
    self.sixes = []
    self.sevens = []
    self.eights = []
    self.nines = []
    self.tens = []
    self.jacks = []
    self.queens = []
    self.kings = []
    self.aces = []
    
    self.spades = []
    self.hearts = []
    self.clubs = []
    self.diamonds = []
    
    
    #group
    hand.each do |card|
      if card.match('2')
       twos.push(card)
     end
     
      if card.match('3')
        threes.push(card)
      end 
      
      if card.match('4')
         fours.push(card)
       end
       
      if card.match('5')
         fives.push(card)
       end
       
      if card.match('6')
        sixes.push(card)
      end
      
      if card.match('7')
         sevens.push(card)
       end
       
      if card.match('8')
        eights.push(card)
      end
      
      if card.match('9')
         nines.push(card)
       end
       
      if card.match('10')
          tens.push(card)
        end
        
      if card.match('J') || card.match('j')
          jacks.push(card)
        end
        
      if card.match('Q') || card.match('q')
         queens.push(card)
       end
       
      if card.match('K') || card.match('k')
         kings.push(card) 
       end
       
      if card.match('A') || card.match('a')
         aces.push(card)
       end
       
      if card.match('s') || card.match('S')
          spades.push(card)
        end
        
      if card.match('h') || card.match('H')
          hearts.push(card)
        end
        
      if card.match('c') || card.match('C')
           clubs.push(card)
         end
         
      if card.match('d') || card.match('D')
          diamonds.push(card)
        end
            
    end
    

  end
  
  def is_valid_hand()
    if(hand.length != 5)
      return false
    elsif hand[0] == hand[1]
      return false
    else
      return true
    end
  end
  
  # from http://casinosecretsreveald.blogspot.com/2011/02/poker-hand-rankings.html
  def get_best_hand()
    
    if ! (self.is_valid_hand)
      return "this is not a valid hand"
    end
    
    if self.check_royal_flush
      return "royal flush, good job"
    
    elsif self.check_straight_flush
      return "straight flush"
      
    elsif self.check_four_of_a_kind
      return "four of a kind"
      
    elsif self.check_full_house
      return "full house"  
      
    elsif self.check_flush
      return "flush"
    
    elsif self.check_straight
      return "straight"
          
    elsif self.check_three_of_a_kind
      return "three of a kind"
      
    elsif self.check_two_pair
      return "two pair"
      
    elsif self.check_one_pair
      return "one pair"
      
    else 
      return self.check_high_card
    end
  end
  
  
  def check_royal_flush
    
    if aces.length == 1 && kings.length ==1 && queens.length ==1 && jacks.length==1 && tens.length == 1 && self.check_flush
      return true
    else
      return false
    end
  end
  

  def check_straight_flush
    
    if self.check_straight && self.check_flush
      return true
    else
      return false
    end
  end
  
  
  def check_four_of_a_kind
    
    if check_n_of_a_kind(4)
      return true
      else
        return false
      end   
  end
  

  def check_full_house
   
    if check_n_of_a_kind(3)  && ( spades.length == 2 || hearts.length == 2 || clubs.length == 2 || diamonds.length == 2 ) 
      return true
    else
      return false
    end
  end
  
  def check_flush
    if spades.length == 5 || hearts.length ==5 || clubs.length==5 || diamonds.length ==5
      return true
    else
      return false
    end
  end
  
 
  def check_straight
    if twos.length == 1 && threes.length == 1 && fours.length == 1 && fives.length == 1 && sixes.length == 1 
      return true
    elsif threes.length == 1 && fours.length == 1 && fives.length == 1 && sixes.length ==1 && sevens.length == 1
      return true
    elsif fours.length == 1 && fives.length == 1 && sixes.length ==1 && sevens.length == 1 && eights.length == 1
      return true
    elsif fives.length == 1 && sixes.length ==1 && sevens.length == 1 && eights.length == 1 && nines.length == 1
      return true
    elsif sixes.length ==1 && sevens.length == 1 && eights.length == 1 && nines.length == 1 && tens.length == 1
      return true
    elsif sevens.length == 1 && eights.length == 1 && nines.length == 1 && tens.length == 1 && jacks.length == 1
      return true
    elsif eights.length == 1 && nines.length == 1 && tens.length == 1 && jacks.length == 1 && queens.length == 1
      return true
    elsif nines.length == 1 && tens.length == 1 && jacks.length == 1 && queens.length == 1 && kings.length == 1
      return true
    elsif tens.length == 1 && jacks.length == 1 && queens.length == 1 && kings.length == 1 && aces.length == 1
      return true
    end
  end
  
  def check_three_of_a_kind
    if check_n_of_a_kind(3)
      return true
    else
      return false
    end
  end
  

  def check_two_pair
     
     number_of_pairs = 0;
     
    if twos.length == 2
      number_of_pairs += 1
    end
    
    if threes.length == 2
       number_of_pairs += 1
    end
    
    if fours.length == 2
       number_of_pairs += 1
    end
    
    if fives.length == 2
       number_of_pairs += 1
    end
    
    if sixes.length == 2
       number_of_pairs += 1
    end
    
    if sevens.length == 2
       number_of_pairs += 1
    end
    
    if eights.length == 2
       number_of_pairs += 1
    end
    
    if nines.length == 2
       number_of_pairs += 1
    end
    
    if tens.length == 2
       number_of_pairs += 1
    end
    
    if jacks.length == 2
       number_of_pairs += 1
    end
    
    if queens.length == 2
       number_of_pairs += 1
    end
    
    if kings.length == 2
       number_of_pairs += 1
    end
    
    if aces.length == 2
       number_of_pairs += 1
    end
    
    if number_of_pairs == 2
      return true
    else 
      return false
    end
    
  end
  
  def check_one_pair
    if check_n_of_a_kind(2)
      return true
    else
        return false
    end
  end
  

  def check_high_card
    if aces.length > 0
      return "ace"
    elsif kings.length > 0
      return "king"
    elsif queens.length > 0
      return "queen"
    elsif jacks.length > 0
      return "jack"
    elsif tens.length > 0
      return "ten"
    elsif nines.lenth > 0
      return "nine"
    elsif eights.length > 0
      return "eight"
    elsif sevens.length > 0
      return "seven"
    elsif sixes.length > 0
      return "six"
    elsif fives.length > 0
      return "five"
    elsif fours.length > 0
      return "four"
    elsif threes.length > 0
      return "three"
    elsif twos.length > 0
      return "two"
    else
      return "bad card"
    end  
  end
  
  def check_n_of_a_kind(n)
     
     if twos.length == n || threes.length ==n || fours.length == n || fives.length == n || sixes.length == n || sevens.length == n || eights.length == n || nines.length == n || tens.length == n || jacks.length == n || queens.length == n || kings.length == n || aces.length == n 
        return true
     else
          return false
      end
  end

end








