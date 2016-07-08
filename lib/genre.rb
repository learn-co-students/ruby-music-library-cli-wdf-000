class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []
  def self.create(name)
    new(name).tap{|a| a.save}
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def initialize(name)
    @name = name
    @songs = []  
  end
  def artists
    @songs.collect {|song| song.artist}.uniq
  end
  def destroy_all
    self.class.all.clear
  end
  def save
    @@all << self
  end
end
