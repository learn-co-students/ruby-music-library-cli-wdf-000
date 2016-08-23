class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    # @@all << self
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
      song.artist = self unless song.artist
    end
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

  # def self.find_by_name(name)
  #   self.all.detect do |object|
  #     object.name == name
  #   end
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end
  def out
    "#{self.name} - #{self.songs} - #{self.genres}"
  end
end
