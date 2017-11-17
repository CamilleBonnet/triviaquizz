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

  def self.turn_to_play(team)
    print "\n\nTEAM #{team.name}!! Your turn to Play!\n"
  end

  def self.display_question(question)
    print "\n Here is the question: \n"
    print "It is a \'#{question.type}\' question...  (diff: #{question.difficulty})\n"
    print "  > \'#{question.question}\'\n"
  end

  def self.display_answer(question)
    print " >>> The answer is...\n"
    print " >>> "
    print question.answer.upcase
    print "\n"
  end

  def self.check_good_answer
    typing = ""
    while typing != "y" && typing != "n"
      print "\nThe answer was good??  (y/n)\n  > "
      typing = gets.chomp.to_s
    end
    return true if typing == "y"
    return false if typing == "n"
  end

  def self.display_message_win(nb)
    print "\n WELL DONE"
    print "\n You scored #{nb} !!\n"
  end

  def self.display_message_loose
    print "\n LOOSERS!!\n"
  end
end
