class Song
  attr_accessor :name, :artist, :genre 
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    self.artist = artist if artist
    self.genre = genre if genre
    @@all << self
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.new(name)
  end
  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    @@all << song
    song
  end
  def self.new_from_filename(name)
    artist = Artist.find_or_create_by_name(name.split(" - ")[0])
    s_name = name.split(" - ")[1]
    genre = Genre.find_or_create_by_name(name.split(" - ")[2].split(".")[0])  
    song = self.new(s_name, artist, genre)
  end
  def self.create_from_filename(name)
    self.new_from_filename(name)
  end
  def save
    @@all << self
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
end
