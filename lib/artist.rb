class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  # attr_writer :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all.dup.freeze
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.collect {|song| song.genre }.uniq
  end


end
