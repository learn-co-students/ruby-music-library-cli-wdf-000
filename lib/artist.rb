class Artist
  attr_accessor :name, :songs
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  include Concerns::Findable
  def initialize(name)
    @name = name 
    @songs = []
  end
  def self.create(name)
    self.new(name).save 
  end
  def add_song(song)
    song.artist = self if song.artist.nil?
    @songs << song if !@songs.include?(song)
  end
  def genres
    @songs.map {|song| song.genre}.uniq
  end
end
