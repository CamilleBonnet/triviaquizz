require_relative '../view/view'
require_relative '../models/player'

class PlayersController
  def initialize(player_repository)
    @player_repository = player_repository
  end

  def add_players
    # players = []
    player_name = View.ask_new_player
    if player_name == ""
      @players
    else
      @player_repository.add(Player.new(name: player_name))
      add_players
    end
  end

  def list
    View.list_players(@player_repository.all)
  end

end
