require_relative 'view/view.rb'
require_relative 'player.rb'

class Team
  def initialize
    @view = View.new
    @players = []
  end

  def add_players
    player = @view.ask_new_player
    if player == ""
      @players
    else
      @players << player
      add_players
    end
  end

  def list(players)
    @view.list_players(players)
  end

  def nb_teams
    @view.nb_of_teams.to_i
  end

  def create_teams(players, nb_teams)
    teams = []
    players_temp = players.dup
    nb_players = players.size
    nb_players_per_team = nb_players / nb_teams
    extra_players = nb_players % nb_teams

    if extra_players == 0
      puts "OK"
    else
      puts "Extra"
    end
  end

end
