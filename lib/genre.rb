class Genre

  extend Concerns::Findable
  # extend Concerns::Makeable::ClassMethods

  attr_accessor :name


  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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

  def self.create(genre)
    new_genre = self.new(genre)
    new_genre.save
    new_genre
  end

  def songs
    @songs
  end

  def add_song(song_obj)
    #adds the unique song to the genre's songs
    @songs.include?(song_obj) || @songs << song_obj
    #assigns the genre to the song if it doesn't have a genre
    song_obj.genre == self || song_obj.genre = self
  end
  # genre has many artists through songs
  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end

end