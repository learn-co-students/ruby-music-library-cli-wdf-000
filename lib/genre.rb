class Genre
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  def artists
    @songs.collect{|song| song.artist}.uniq
  end
end

