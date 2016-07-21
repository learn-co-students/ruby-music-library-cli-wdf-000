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
    # if !song.artist
    if !self.songs.include?(song)
          @songs << song
          song.artist = self
        end
  end

  def genres
    self.songs.map do |song|
      song.genre
    end.uniq
  end

end
