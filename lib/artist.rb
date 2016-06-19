class Artist
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :songs 

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if song.artist != self
      song.artist = self
    end
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end
end

