class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def genres
    songs.map {|song| song.genre}.uniq
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if !song.artist
      song.artist = self
    end
  end
      
end
