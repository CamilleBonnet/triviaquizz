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
    gets.chomp.to_i
  end

  def self.name_of_team(players)
    print "\n#{players[0].name}, you are the leader of your team.\n"
    print "How do you want to name your team?\n   > "
    gets.chomp.to_s
  end

  def self.list_teams(team)
    print "\nIn the team \'#{team.name}\':\n"
    team.players.size.times do |player|
      print "  >> #{team.players[player].name}\n"
    end
  end

  def self.list_score(team)
    print "\nThe team \'#{team.name}\' has:\n"
      print "  >> #{team.score} points\n"
  end
end
