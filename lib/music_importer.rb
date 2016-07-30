class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{@path}/*.mp3").collect {|file| file.split("/").last}
  end

  def import
    self.files.each {|file| song = Song.create_from_filename(file)}
  end

end