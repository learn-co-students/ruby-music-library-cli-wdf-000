class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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

  def self.create(artist_name)
    artist = self.new(artist_name)
    artist.save
    artist
  end

  def add_song(song)
    if !@songs.include? song
      @songs << song
    end

    if song.artist != self
      song.artist = self
    end
  end
    #shovel song into @songs array if song is not already inside array

    #set song's artist to be self unless song.artist is already self
    # @songs << song unless @songs.include? song
    # song.artist = self unless song.artist == self

    
    # if song.artist == self
    #   song
    # else
    #   @songs << song
    #   song.artist = self
    # end
  
  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

end