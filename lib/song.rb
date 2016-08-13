require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, set_artist=nil, set_genre=nil)
    self.name = name
    if set_artist
      self.artist=(set_artist)
    end
    if set_genre
      self.genre=(set_genre)
    end
  end

  def artist=(new_artist)
    @artist = new_artist
    new_artist.add_song(self)
  end

  def genre=(new_genre)
    @genre = new_genre

    if !new_genre.songs.include? self
      new_genre.songs << self
    end

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

end
