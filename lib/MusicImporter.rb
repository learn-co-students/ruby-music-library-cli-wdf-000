require 'pry'


class MusicImporter

  attr_accessor :path

  def initialize(test_music_path)
    @path = test_music_path
  end


  def files
    Dir.entries(@path).select do |f|
      if f.include?(".mp3")
        f
      end
    end
  end


  def import
  files.each do |file|
    song = Song.new_from_filename(file)
    song
    end
  end




  # # end
  # end


















end
