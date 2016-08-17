
require 'pry'


class Artist

  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)

    if song.artist == nil
      song.artist = self     #check if artist has the song in the @song collection
    end
    if !self.songs.include?(song)
      self.songs << song
    end
  end


  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end


  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end


  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end












end
