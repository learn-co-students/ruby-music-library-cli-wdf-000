require 'pry'

class Song

  attr_accessor :name, :artist, :genre

  extend Findable

  @@all = []

  def self.new_from_filename(filename)
    filename.slice! ".mp3"
    filename
    bruh = filename.split(" - ")
    artist_name = bruh[0]
    song_name = bruh[1]
    genre = bruh[2]
    song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre)
    artist.add_song(song)
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(filename)
    filename.slice! ".mp3"
    filename
    bruh = filename.split(" - ")
    artist_name = bruh[0]
    song_name = bruh[1]
    genre = bruh[2]
    song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre)
    artist.add_song(song)
    song.artist = artist
    song.genre = genre
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !@genre.songs.include?(self)
      @genre.songs << self
    end
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      artist.add_song(self)
    end
    if genre != nil
      self.genre = genre
    end
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

  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end

  # def self.find_by_name(song_name)
  #   self.all.detect{|a| a.name == song_name}
  # end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end

end