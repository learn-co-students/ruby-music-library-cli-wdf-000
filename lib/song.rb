class Song
  attr_accessor :name, :artist, :genre 
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    artist.add_song(self) rescue @artist = artist
    @genre = genre
    genre.songs << self if genre
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
  def self.create(name)
    self.new(name).save
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  # def artist=(artist)
  #   artist.add_song(self)
  # end
end
