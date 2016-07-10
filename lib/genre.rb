class Genre
  # genres have many songs
  extend Concerns::Memorable::ClassMethods
  extend Concerns::Findable
  include Concerns::Memorable::InstanceMethods
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
  end

  def artists
    @songs.collect do |song|
      song.artist
    end.uniq
  end

end