class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []

  def self.create(name)
    new(name).tap{|a| a.save}
  end
  def initialize(name)
    @name = name 
    @songs = []
  end
  def self.destroy_all
    @@all = []
  end
  def self.all
    @@all
  end
  def save
    @@all << self
  end
  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist != self
  end
  def genres
    @songs.map {|song| song.genre}.uniq
  end
end
