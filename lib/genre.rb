class Genre

  extend Concerns::Findable
  #extend Persistable::ClassMethods
  #extend Nameable::ClassMethods
  #include Persistable::InstanceMethods

  attr_accessor :name, :songs, :artist

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
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    if !songs.include?(song)
      @songs << song
    end
  end

  def artists
    self.songs.map{|song| song.artist}.uniq
  end
end
