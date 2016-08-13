require 'pry'

class MusicImporter
  attr_accessor :path, :files_array

  def initialize(file_path)
    self.path = file_path
    self.files_array = []
  end

  def Song.new_from_filename(file_name)
    ary = file_name.split(".")[0].split(" - ")
    new_song = Song.find_or_create_by_name(ary[1])
    new_artist = Artist.find_or_create_by_name(ary[0])
    new_genre = Genre.find_or_create_by_name(ary[2])
    new_song.artist = new_artist
    new_song.genre = new_genre
    new_song
  end

  def Song.create_from_filename(file_name)
    new_song = Song.new_from_filename(file_name)
    if !Song.all.include? new_song
      new_song.save
    end
    new_song
  end

  def files
    Dir.open(self.path).each do |mp3|
      if mp3.include? "mp3"
        self.files_array << mp3
      end
    end
    self.files_array
  end

  def import
    ary = []
    files.each do |mp3|
      ary << Song.create_from_filename(mp3)
    end
    ary
  end

end
