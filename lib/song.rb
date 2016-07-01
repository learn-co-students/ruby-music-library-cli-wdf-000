require_relative '../concerns/findable.rb'

class Song
  extend Concerns::Makeable::ClassMethods
  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    !artist || artist.add_song(self)
    !genre || genre.add_song(self)
    @name = name
  end

  def self.all
    @@all
  end

  def artist=(artist)
    self.artist == artist || @artist = artist
    artist.songs.include?(self) || artist.add_song(self)
  end

  def save
    self.class.all << self
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) || genre.songs << self
  end

end
