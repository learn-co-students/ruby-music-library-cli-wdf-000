class Genre
  attr_accessor :name, :songs
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  include Concerns::Findable
  def initialize(name)
    @name = name
    @songs = []
  end
  def self.create(name)
    @@all << self.new(name)
  end
end
