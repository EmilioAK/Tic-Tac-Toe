require_relative 'round.rb'

def main
    player1_score = 0
    player2_score = 0
    
    loop do
        round = Round.new
        winner = round.play_round

        winner = 1 ? player1_score += 1 : player2_score += 1
        puts "Player 1's score is: #{player1_score} \n"
        puts "Player 2's score is: #{player2_score}"
    end
end

if $0 == __FILE__
    main
end