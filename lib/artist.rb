require 'pry'

class Artist
  extend Concerns::Findable


  attr_accessor :name, :songs, :genres

  @@all = []


  def initialize(name)
    @name = name
    @songs = []
    @g = []

  end

  def genres
    @g
  end





  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    self.new(name).save
  end



  def add_song(song)
    if !self.songs.include?(song)


      self.songs << song

    end

    if song.artist != self
      song.artist = self
    end


  end

  def self.find_or_create_by_name(name)
     if !self.all.detect{|song| song.name == name}
         Artist.new(name).save
    else
       self.all.detect{|song| song.name == name}
    end

  end


end
