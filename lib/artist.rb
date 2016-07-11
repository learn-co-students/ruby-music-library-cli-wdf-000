require "pry"

class Artist
  # has many Songs
  # has many Genres through his/her Songs
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def genres
    self.songs.collect { |song| song.genre }.uniq
  end
end
