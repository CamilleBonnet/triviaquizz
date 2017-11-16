class View
  def self.ask_new_player
    print "\nWho wants to play?\n   > "
    gets.chomp
  end

  def self.list_players(players)
    puts "There are #{players.size} players:"
    players.each do |player|
      puts " > #{player.name}"
    end
  end

  def self.nb_of_teams
    print "\nHow many teams?\n   > "
    gets.chomp
  end
end
