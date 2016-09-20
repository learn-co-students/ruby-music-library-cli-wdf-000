class Genre
  #Builder Pattern
  #Mixing Pattern
  #Module Pattern

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
      @songs << song #unless genre.songs.include(song)
    end
  end

  def artists #It looks like a reader but its more complicated, establishes has many through relationship
    self.songs.map{|song| song.artist}.uniq
    #@CLI_video_review
    #@songs.map{|s| s.artist}.uniq
  end
end
