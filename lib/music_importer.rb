class MusicImporter
  attr_reader :path, :files
  def initialize(path)
    @path = path
    @files = Dir.entries(path).select {|e| e.include?("mp3")}
  end
  def import
    self.files.map {|file| Song.new_from_filename(file)}
  end
end
