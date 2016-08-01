class Genre

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
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song_obj)
    if !self.songs.include?(song_obj)
      self.songs << song_obj
    end
  end

  def artists
    self.songs.collect do |song_obj|
      song_obj.artist
    end.uniq
  end

end
