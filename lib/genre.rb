class Genre

  attr_accessor :name, :songs

  extend Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end

   def artists
    artists = []
    self.songs.collect do |song|
      bruh = song.artist
      if !artists.include?(bruh)
        artists << song.artist
      end
    end
    artists
  end

end