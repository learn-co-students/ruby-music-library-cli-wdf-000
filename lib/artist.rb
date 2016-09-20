class Artist

  extend Concerns::Findable
  #extend Persistable::ClassMethods
  #extend Nameable::ClassMethods
  #include Persistable::InstanceMethods

  attr_accessor :name, :songs
  #reader .name
  #writer .name=
  #ex: song.artist.name = artist_name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end

    if !songs.include?(song)
      @songs << song
    end
  end

  def songs
    @songs
  end

  def genres
    self.songs.map{|song| song.genre}.uniq
  end
end
