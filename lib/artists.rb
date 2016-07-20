class Artist
  attr_accessor :name, :songs, :genres
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !(self.songs.any? {song})
      self.songs << song
    end
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    artist = self.new(name).save
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end


end