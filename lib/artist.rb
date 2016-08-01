class Artist

  extend Concerns::Findable
  attr_accessor :name, :songs
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
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song_obj)
    if !self.songs.include?(song_obj)
      @songs << song_obj
    end
    song_obj.artist = self unless song_obj.artist == self
  end

  def genres
    self.songs.collect do |song_obj|
      song_obj.genre
    end.uniq
  end

end
