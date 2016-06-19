class Song
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :artist
  
  @@all = []

  def self.all
    @@all
  end

  def initialize(name,artist=nil)
    @name = name
    if artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def artist=(artist)
    @artist = artist
    if !artist.songs.include?(self)
      artist.add_song(self)
    end
  end
end
