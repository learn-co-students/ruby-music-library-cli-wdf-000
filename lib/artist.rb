require 'pry'
class Artist
  # has many songs
  # has many genres through songs
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song if !@songs.include?(song) # does not add song if song exits
    song.artist = self if !song.artist # does not assign if artist exists
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end

end