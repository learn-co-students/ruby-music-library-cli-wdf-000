class Artist

  extend Concerns::Findable
  # extend Concerns::Makeable::ClassMethods

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end
  def songs
    @songs
  end

  def self.create(artist_name)
    new_artist = self.new(artist_name)
    new_artist.save
    new_artist
  end

  def add_song(song_obj)
    #adds the unique song to the artist's song collection
    @songs.include?(song_obj) || @songs << song_obj
    #assigns the artist to the song if it doesn't have a artist
    song_obj.artist == self || song_obj.artist = self
  end

  #artists has many genres through songs
  def genres
    @songs.collect do |song|
      song.genre
    end.uniq
  end

  # def self.find_by_name
  #   self.songs.detect do |song|
  #     song.name == name
  #   end
  # end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

end