require "pry"

class Song
  # belongs to Artist
  # belongs to a Genre
  extend Concerns::Findable # Class methods

  attr_accessor :name, :artist, :genre

  @@all = Array.new

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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
    song = self.new(name)
    song.save

    # We need to return the song because if not, we are returning the @@all array
    # from when we call on #save
    song
  end

  def self.new_from_filename(filename)
    song_info = filename.split(/ - |.mp3/)
    song_name = song_info[1]
    song_artist = song_info[0]
    song_genre = song_info[2]

    song = Song.new(song_name)
    song.artist = Artist.find_or_create_by_name(song_artist)
    song.genre = Genre.find_or_create_by_name(song_genre)
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end
end
