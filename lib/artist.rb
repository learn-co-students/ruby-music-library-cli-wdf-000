require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []
 
  def initialize(name)
    self.name = name
    self.songs = []
  end

  def self.all
    @@all
  end

  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end

  def add_song(new_song)
    if !self.songs.include? (new_song)
      self.songs << new_song
    end

    if new_song.artist != self
      new_song.artist = self
    end

    self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

end
