module Concerns

module Findable

def find_by_name(name)
  self.all.detect{|item| item.name == name}
end

def find_or_create_by_name(name)
  find_by_name(name) || self.create(name)
end

end

module Makeable

  module ClassMethods

    def destroy_all
      self.all.clear
    end

    def create(name)
      created = self.new(name)
      created.save
      created
    end

    def new_from_filename(filename)
      new_song = Song.new(filename.split(" - ")[1])
      new_song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
      new_song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
      new_song
    end

    def create_from_filename(filename)
      song = Song.find_by_name(filename.split(" - ")[1]) || new_from_filename(filename)
      song.save
      song
    end

  end

  module InstanceMethods

    def initialize(name)
      @name = name
    end

    def save
      self.class.all << self
    end

    def add_song(song)
      @songs.include?(song) || @songs << song
    end


  end



end


end
