class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song) #song is an object, not a string!
    song.genre.nil? ? song.genre = self : song.genre
    !songs.include?(song) ? songs << song : song
  end

  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end
end
