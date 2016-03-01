require "data_mapper"

class Task
  include DataMapper::Resource

  property :id, Serial
  property :description, String

  def to_s
    description.to_s
  end
end
