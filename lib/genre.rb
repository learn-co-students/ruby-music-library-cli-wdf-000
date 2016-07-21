class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @a = []

  end

  def artists
    @a
  end



  def self.find_or_create_by_name(name)
     if !self.all.detect{|song| song.name == name}
         Genre.new(name).save
    else
       self.all.detect{|song| song.name == name}
    end

  end






  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    self.new(name).save
  end




end
