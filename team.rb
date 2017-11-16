require_relative 'view/view.rb'
require_relative 'player.rb'

class Team
  def initialize(arg = {})
    @name = arg[:name]
    @color = arg[:color] || "no color"
  end


  def self.add_players
    # players = []
    player_name = View.ask_new_player
    if player_name == ""
      @players
    else
      @players << Player.new(name: player_name)
      add_players
    end
  end

  def self.list(players)
    View.list_players(players)
  end

  def self.nb_teams
    View.nb_of_teams.to_i
  end

  def self.create_teams(players, nb_teams)
    @nb_teams = nb_teams
    @nb_players = players.size
    @nb_players_per_team = @nb_players / nb_teams
    nb_extra_players = @nb_players % nb_teams
    @teams = Array.new(nb_teams){ Array.new(@nb_players_per_team)}

    if nb_extra_players == 0
      # if the nb of players is a multiple of nb of teams
      pick_players_in_teams(players)
    else
      # if the nb of players is not a multiple of nb of teams, we first deal with the first players
      # and we assign the players extra in a random teams
      temp = players.size-nb_extra_players - 1
      extra_player = players[temp + 1..players.size]
      pick_players_in_teams(players[0..temp])
      add_extra_players(extra_player)
    end
    @teams
  end

  private
  @players = []

  def self.pick_players_in_teams(players)
    (1..@nb_teams).each do |team|
      (1..@nb_players_per_team).each do |player|
        id = rand(players.size)
        @teams[team - 1][player - 1] = players[id]
        players.delete_at(id)
      end
    end
  end

  def self.add_extra_players(extra_players)
    # puts "Player left: #{extra_players}"
    (0..extra_players.size - 1).each do |team|
      id = rand(extra_players.size)
      @teams[team] << extra_players[id]
      extra_players.delete_at(id)
    end
  end

end



























