class MusicImporter

  attr_accessor :path, :files
  def initialize(path)
    @path = path
    Dir.chdir(path) do 
      @files = Dir.glob("*.mp3")
    end
  end

  def import
    @files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end
end