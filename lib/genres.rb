class Genre
  attr_accessor :name, :songs, :artists
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    genre = self.new(name).save
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end