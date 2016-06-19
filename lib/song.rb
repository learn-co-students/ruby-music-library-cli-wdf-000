class Song
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []

  def self.all
    @@all
  end

  def initialize(name,artist=nil,genre=nil)
    @name = name
    if artist
      @artist = artist
      artist.add_song(self)
    end

    if genre
      @genre = genre
      if !genre.songs.include?(self)
        genre.songs << self
      end
    end
  end

  def artist=(artist)
    @artist = artist
    if !artist.songs.include?(self)
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end
end
