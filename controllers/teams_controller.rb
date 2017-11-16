require_relative '../view/view'
require_relative '../models/team'

class TeamsController
  def initialize(team_repository, player_repository)
    @team_repository = team_repository
    @player_repository = player_repository
  end

  def nb_teams
    View.nb_of_teams
  end

  def place_players_in_teams(nb_teams)
    players = @player_repository.all.shuffle
    @nb_teams = nb_teams
    @nb_players = players.size
    @nb_players_per_team = @nb_players / nb_teams
    nb_extra_players = @nb_players % nb_teams
    @player_in_teams = Array.new(@nb_teams){ Array.new(@nb_players_per_team)}

    if nb_extra_players == 0
      # if the nb of players is a multiple of nb of teams
      pick_players_in_teams(players)
    else
      # if the nb of players is not a multiple of nb of teams, we first deal with the first players
      # and we assign the players extra in a random teams
      temp = players.size - nb_extra_players
      extra_player = players[temp..players.size - 1]
      pick_players_in_teams(players[0..temp - 1])
      add_extra_players(extra_player)
    end
    @player_in_teams
  end

  def name_teams(teams)
    teams.size.times do |team|
      @team_repository.add(Team.new(name: View.name_of_team(teams[team]), players:teams[team]))
    end
  end

  def list
    @team_repository.all.each do |team|
      View.list_teams(team)
    end
  end

  private

  def pick_players_in_teams(players)
    @nb_teams.times do |team|
      (1..@nb_players_per_team).each do |player|
        id = rand(players.size)
        @player_in_teams[team - 1][player - 1] = players[id]
        players.delete_at(id)
      end
    end
  end

  def add_extra_players(extra_players)
    (extra_players.size).times do |team|
      id = rand(extra_players.size)
      @player_in_teams[team] << extra_players[id]
      extra_players.delete_at(id)
    end
  end
end
