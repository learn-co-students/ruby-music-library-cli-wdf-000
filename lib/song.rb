class Song

  extend Concerns::Findable

  attr_accessor :name, :genre, :artist 
    
  @@all = []

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

  def save
      self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).tap{|s| s.save}
  end

  def self.new_from_filename(filename)
    names = filename.split(" - ")
    artist_name = names[0]
    song_name = names[1]
    genre_name = names[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    names = filename.split(" - ")
    artist_name = names[0]
    song_name = names[1]
    genre_name = names[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end
 

end