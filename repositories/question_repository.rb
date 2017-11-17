require_relative 'base_repository'

class QuestionRepository < BaseRepository
  def initialize
    super
    @token
  end
end
