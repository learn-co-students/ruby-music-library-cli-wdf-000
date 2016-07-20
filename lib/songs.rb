require 'pry'
class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    self.artist = artist if artist != nil
    @genre = genre
    self.genre = genre if genre != nil
  end

  def artist=(artist)
    @artist = artist
    self.artist.songs << self unless self.artist.songs.include?(self)
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless self.genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
    self
  end

  def self.create(name)
    song = self.new(name).save
  end

  def self.new_from_filename(file_name)
    split_name = file_name.split(/ - |.mp3/)
    song_name = split_name[1]
    artist_name = split_name[0]
    genre_name = split_name[2]
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(file_name)
    split_name = file_name.split(/ - |.mp3/)
    song_name = split_name[1]
    artist_name = split_name[0]
    genre_name = split_name[2]
    song = self.create(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

end