require 'pry'
class Artist
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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song) #song is an object, not a string!
    song.artist.nil? ? song.artist = self : song.artist
    !songs.include?(song) ? songs << song : song
  end

  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end
end
