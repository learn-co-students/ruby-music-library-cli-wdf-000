require 'pry'
require_relative '../lib/concerns/findable'

class Genre
  extend Concerns::Findable

  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
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

  def self.create(name)
    Genre.new(name).save   
  end


end