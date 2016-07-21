require 'pry'
class MusicImporter

  attr_accessor :path, :files

  def initialize(path_to_music_folder)
    @path = path_to_music_folder
  end

  def files
    @files = Dir.glob("#{@path}/*.mp3")
  #  binding.pry
    @files.collect {|file| file.split("/").last} #chop off the path from the filename
  end

  def import
    files.collect {|file| Song.create_from_filename(file)}
  end


end
