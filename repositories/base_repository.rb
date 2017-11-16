class BaseRepository
  def initialize
    @database = []
  end

  def all
    @database
  end

  def add(item)
    @database << item
  end

  def find(index)
    @database.find { |item| item.id == index }
  end

  def delete(index)
    @database.delete_at(index.to_i)
  end
end
