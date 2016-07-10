require 'pry'
require_relative '../lib/concerns/findable'

class Artist
  extend Concerns::Findable

  @@all = []      
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(artist_name)
    Artist.new(artist_name).save
  end

  def self.songs
    all.map do |artist|
      artist.songs
    end
  end

  def add_song(song)
    song.artist = self if !song.artist 
    @songs << song  if !song.artist.songs.include?(song)
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def to_s
    self.name
  end
end