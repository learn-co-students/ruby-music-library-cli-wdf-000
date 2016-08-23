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
  
  def add_song(song)
    if !self.songs.include?(song)
    self.songs << song
    song.genre = self unless song.genre = self
    end
  end

  def artists
    @songs.collect{|song| song.artist}.uniq
  end

  def self.find_by_name(name)
    self.all.detect do |object|
      object.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
