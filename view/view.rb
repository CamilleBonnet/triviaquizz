class View
  def ask_new_player
    print "\nWho wants to play?\n   > "
    gets.chomp
  end

  def list_players(players)
    puts "there are #{players.size} players are :"
    players.each do |name|
      puts " > #{name}"
    end
  end

  def nb_of_teams
    print "\nHow many teams?\n   > "
    gets.chomp
  end
end
