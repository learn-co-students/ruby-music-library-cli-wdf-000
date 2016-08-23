class Song
  extend Concerns::Findable
  attr_accessor :artist, :genre, :name

    @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
      if artist != nil
        @artist = artist
        artist.add_song(self) unless artist.songs.include?(self)
      end
      if genre != nil
        @genre = genre
        genre.add_song(self)
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
    end

    def self.create(name,art=nil,gen=nil)
     song = self.new(name,art,gen)
     song.save
     song
    end
    # def name
    #   @name.strip
    # end

    def self.new_from_filename(filename)
      filename = filename.split(" - ")
      a_name = filename[0]
      s_name = filename[1]
      g_name = filename[2].gsub(".mp3","")
      genre = Genre.find_or_create_by_name(g_name)
      artist = Artist.find_or_create_by_name(a_name)

      self.new(s_name, artist, genre)
    end

    def self.create_from_filename(filename)
      filename = filename.split(" - ")
      a_name = filename[0]
      s_name = filename[1]
      g_name = filename[2].gsub(".mp3","")
      genre = Genre.find_or_create_by_name(g_name)
      artist = Artist.find_or_create_by_name(a_name)

      self.create(s_name, artist, genre)
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
    end

    def out
      "#{self.artist.name} - #{self.name} - #{self.genre.name}"
    end
end
