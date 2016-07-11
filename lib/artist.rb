class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

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
    Artist.new(name).tap(&:save)
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.collect(&:genre).uniq
  end
end
