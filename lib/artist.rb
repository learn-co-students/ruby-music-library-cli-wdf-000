require_relative '../concerns/findable.rb'

class Artist

    extend Concerns::Makeable::ClassMethods
    extend Concerns::Findable
    include Concerns::Makeable::InstanceMethods

    attr_accessor :name, :songs, :genres

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
      song.artist == self || song.artist = self
    end

    def genres
      genres = @songs.collect{|song| song.genre}.uniq
      genres
    end


end
