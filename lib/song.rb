require 'pry'
class Song
  # belongs to an artist and belongs to a genre
  # has many genres
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) if !artist.nil? # add_song if artist not nil
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) if !genre.nil?
  end

  # needs refactoring?
  def self.new_from_filename(file_name)
    song_info = file_name.split(%r{\s-\s|.\w+$})
    name = song_info[1]
    artist = Artist.find_or_create_by_name(song_info[0])
    genre = Genre.find_or_create_by_name(song_info[2])
    song = Song.new(name, artist, genre)
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end
  
end