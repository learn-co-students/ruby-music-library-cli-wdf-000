class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select {|f| !File.directory? f}
  end

  def import
    files.each do |song_file|
      song = Song.create_from_filename(song_file)
    end
    
  end
  
end