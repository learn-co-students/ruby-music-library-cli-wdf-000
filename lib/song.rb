require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil) #name is string, artist optional Artist object
    @name = name
    if !artist.nil?
      self.artist = artist
    end
    if !genre.nil?
      self.genre = genre
    end
  #  binding.pry
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)  #remember that artist is an object here, not a string like name is
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre) #like above, genre is an object
    @genre = genre
    @genre.add_song(self)
  end

  def self.new_from_filename(filename)
    data = filename.split(/\s\-\s/)
    if Song.find_by_name(data[1]).nil?  #init new song if there is no song object by that name in the library
      song = Song.new(data[1])
    else
      song = Song.find_by_name(data[1])  #return the song object already in the library
    end
    if Artist.find_by_name(data[0]).nil? #check if the artist exists in the library
      song.artist = Artist.new(data[0])  #if not, create new artist
    else
      song.artist = Artist.find_by_name(data[0])  #if yes, return and assign the existing artist to the song
    end
    if Genre.find_by_name(data[2].gsub(".mp3","")).nil? #check if the genre already exists in the library
      song.genre = Genre.new(data[2].gsub(".mp3",""))
    else
      song.genre = Genre.find_by_name(data[2].gsub(".mp3",""))
    end
    song
  end

  def self.create_from_filename(filename)  #refactor this to use the previous method and then call save on it
    data = filename.split(/\s\-\s/)
    song = Song.find_or_create_by_name(data[1])
    song.artist = Artist.find_or_create_by_name(data[0])
    song.genre = Genre.find_or_create_by_name(data[2].gsub(".mp3",""))
    song
  end

end
