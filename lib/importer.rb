class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path

  end

  def files
    Dir.entries(@path).select {|x | x.end_with?("mp3")}
    # binding.pry

  end

  def import

    files.each {|filename| Song.create_from_filename(filename)}

  end


end
