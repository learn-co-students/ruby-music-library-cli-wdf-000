require 'pry'
class Song

  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []


  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    artist.songs << self if artist
    # artist.add_song(self) if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    Song.new(name).save
  end


  def artist=(artist)
    @artist = artist
    # ^^^^^^
    if !artist.songs.include?(self)
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    @@all.detect{|song| song.name == name} || self.create(name)
  end


  def self.new_from_filename(file)

    name = file.split("-").map{|i| i.strip}[1]
    artist = file.split("-").map{|i| i.strip}[0]
    artist_instance = Artist.find_or_create_by_name(artist)
    genre = file.gsub(/(.mp3)/, "").split(" - ")[2]
    genre_instance = Genre.find_or_create_by_name(genre)
    #file.gsub(/\s+/, "").split("-")
    #file.delete(" ").split("-")
          # binding.pry
    # if self.find_by_name(name) == nil
      song = self.new(name, artist_instance, genre_instance)
    # end
    # - half working - without uniqueness
    # song = self.find_or_create_by_name(name)
    # song.artist = artist
    # song.genre = genre
    # artist.add_song = self
    # song

  end

  def self.create_from_filename(file)
    # array = file.gsub(/(.mp3)/, "").delete(" ").split("_")

    self.new_from_filename(file).save
            # binding.pry
  end


end
