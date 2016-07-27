#require_relative '../concerns/findable.rb'

class Song

  # extend Concerns::Makeable::ClassMethods
  # extend Concerns::Findable


  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist.add_song(self) if artist
    genre.add_song(self) if genre
    # @genre = genre
    # genre.add_song(self)
  end


  def save
    @@all << self
  end

  def artist=(artist_obj)
    #song belongs to an artist
    self.artist == artist_obj || @artist = artist_obj
    #adds the song to the artist's songs
    artist.songs.include?(self) || artist.add_song(self)
  end

  def genre=(genre_obj)
    self.genre == genre_obj || @genre = genre_obj
    genre.songs.include?(self) || genre.add_song(self)
  end

  def self.find_by_name(song_name)
    self.all.detect do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    #binding.pry
    self.find_by_name(song_name) || self.create(song_name)

  end

  def self.all
    @@all
  end

  def self.new_from_filename(file_name)
    # binding.pry
    artist_name, song_name, genre_name = file_name.split(" - ")

    #create a new song with given song_name
    new_song = self.new(song_name)

    #find or create an artist by artist_name and assign that artist to the new song (song belongs to an artist)
    new_song.artist = Artist.find_or_create_by_name(artist_name)

    #find or create an artist by artist_name and assign that artist to the new song (song belongs to a genre)
    new_song.genre = Genre.find_or_create_by_name(genre_name.chomp(".mp3"))
    #return the new song instance
    new_song

  end

  def self.create_from_filename(file_name)
    
    artist_name, song_name, genre_name = file_name.split(" - ")

    #create a new song with given song_name and save the song
    new_song = self.create(song_name)

    #find or create an artist by artist_name and assign that artist to the new song (song belongs to an artist)
    new_song.artist = Artist.find_or_create_by_name(artist_name)

    #find or create an artist by artist_name and assign that artist to the new song (song belongs to a genre)
    new_song.genre = Genre.find_or_create_by_name(genre_name.chomp(".mp3"))
    #return the new song instance
    new_song

  end


  def self.create(song_name)
    new_song = self.new(song_name)
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end


end