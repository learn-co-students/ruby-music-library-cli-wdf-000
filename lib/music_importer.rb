class MusicImporter
  attr_accessor :path, :files
  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.glob("#{path}/*.mp3")
    # first split the file with "/" then grab the last item
    @files = @files.map{|file| file.split("/").last}
  end

  def import
    songs = files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end
end