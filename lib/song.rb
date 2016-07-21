require 'pry'
class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if artist

      if !artist.songs.include?(self)
        artist.songs << self
      end
      if self.artist != artist
        self.artist = artist
      end
    end

    if genre
      if !genre.songs.include?(self)
        genre.songs << self
        self.genre = genre
      end

      if !artist.genres.include?(genre)
        artist.genres << genre
      end

      if !genre.artists.include?(artist)
        genre.artists << artist
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
    self.new(name).save
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
    self.new(name).save
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
     if !self.all.detect{|song| song.name == name}
         Song.new(name).save
    else
       self.all.detect{|song| song.name == name}
    end

  end


  def self.new_from_filename(filename)

     artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    # artist = Artist.new(filename.split(" - ")[0])
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
    # binding.pry
    song = Song.new(filename.split(" - ")[1], artist, genre)
    # song.artist = artist
    #

    song

  end


  def self.create_from_filename(filename)
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
   # artist = Artist.new(filename.split(" - ")[0])
   genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
   # binding.pry
   song = Song.new(filename.split(" - ")[1], artist, genre).save
   # song.artist = artist
   #

   song

  end


end
