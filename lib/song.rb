require 'pry'
class Song

  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist_obj = nil, genre_obj = nil)
    @name = name

    if(artist_obj != nil)
      self.artist = artist_obj
    end

    if(genre_obj != nil)
      self.genre = genre_obj
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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist_obj)
    @artist = artist_obj
    artist_obj.add_song(self)
  end

  def genre=(genre_obj)
    @genre = genre_obj
    genre_obj.add_song(self)
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_artist = song_array[0]
    song_name = song_array[1]
    song_genre = song_array[2].gsub(".mp3", "")

    s = self.new(song_name)
    s.artist = Artist.find_or_create_by_name(song_artist)
    s.genre = Genre.find_or_create_by_name(song_genre)
    s

  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end

end