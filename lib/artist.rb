require 'pry'

class Artist

  attr_accessor :name, :songs

  extend Findable

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
  end

  def self.create(artist)
    new_artist = Artist.new(artist)
    new_artist.save
    new_artist
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    genres = []
    self.songs.collect do |song|
      bruh = song.genre
      if !genres.include?(bruh)
        genres << song.genre
      end
    end
    genres
  end

end