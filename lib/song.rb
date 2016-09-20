require 'pry'
class Song

  extend Concerns::Findable #take all of the methods in the Findable module and adds them to class methods
  #extend Persistable::ClassMethods
  #extend Nameable::ClassMethods
  #include Persistable::InstanceMethods

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @songs = []

    if artist != nil
      self.artist = artist
    end

    if genre != nil
      self.genre = genre
    end
  end

  def save
    @@all << self
  end

  def self.all #Class Reader
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    #First be a nice object and tell genre that it has a new song
    #genre.songs << self
    genre.add_song(self)
    #Assign that genre to myself
    @genre = genre
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    artist_name = filename[0]
    song_name = filename[1]
    genre_name = filename[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song



  end
end
