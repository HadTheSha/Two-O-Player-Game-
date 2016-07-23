class Player

   attr_reader :name, :life, :points

  def initialize(player)
    @name = player 
    @life= 3
    @points = 0 

  end 

  def gain_points 
    @points += 1
  end

  def lost_life
    @life -= 1
  end 

end

 
class Game 


  def initialize(player1, player2)
    @player1= player1
    @player2= player2
    @turn = 1
  end 

  def reset_q 
    @x = (rand* 50).to_int
    @y = (rand * 50).to_int
  end
  
  def current_player
    if @turn % 2 == 0 
      @player1
     else 
      @player2
    end
  end

  def questions
    while current_player.life > 0
      reset_q
       puts "#{current_player.name} What does #{@x} plus #{@y} equal?"
      input = gets.chomp.to_i
      if input == @x + @y 
        puts "#{current_player.name}, you've got one extra point!!"
        current_player.gain_points
       else 
        puts "#{current_player.name} you've lost a life"
        current_player.lost_life
       end
       @turn += 1 
    end
  end
end

p1= Player.new("shahad")
p2= Player.new("Armen")
the_game = Game.new(p1, p2)
the_game.questions

