class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist.add_song(self) if artist.class == Artist
    self.genre = genre if genre.class == Genre
  end

  def song=(artist)
    artist.song = self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(song, artist = nil, genre = nil)
    song = self.new(song, artist, genre)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include? self
      genre.songs << self
    end
  end

  def self.new_from_filename(file)
    song_array = file.split(" - ")
    artist_name = song_array[0]
    song_name = song_array[1]
    genre_name = song_array[2].gsub(".mp3", "")
    
    genre = Genre.find_or_create_by_name(genre_name)
    artist = Artist.find_or_create_by_name(artist_name)

    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    # self.new_from_filename(file).save

    song_array = file.split(" - ")
    artist_name = song_array[0]
    song_name = song_array[1]
    genre_name = song_array[2].gsub(".mp3", "")
    
    genre = Genre.find_or_create_by_name(genre_name)
    artist = Artist.find_or_create_by_name(artist_name)

    self.create(song_name, artist, genre)
  end

  def out
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

end