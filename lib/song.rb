class Song
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []

  def self.all
    @@all
  end

  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.save

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

  # class method
  def self.new_from_filename(filename)
    arr = filename.split(/\s*-\s*|.mp3/)

    artist = Artist.find_or_create_by_name(arr[0])
    genre = Genre.find_or_create_by_name(arr[2])
    new_song = self.new(arr[1],artist,genre)
    new_song
  end
end
