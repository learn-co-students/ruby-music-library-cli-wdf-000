require_relative '../concerns/findable.rb'


class Genre

  extend Concerns::Makeable::ClassMethods
  extend Concerns::Findable
  include Concerns::Makeable::InstanceMethods

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    super
    song.genre = self
  end

  def artists
    @songs.collect{|song| song.artist}.uniq!
  end

end
