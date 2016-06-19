class MusicImporter
  attr_reader :path, :files

  def initialize(path)
    @path = path
    @files = Dir.entries(path).select{|filename| /.+\.mp3$/.match(filename)}
    @files.sort!{|a,b| a <=> b}
  end

  def import
    @files.each do |filename|
      Song.new_from_filename(filename)
    end
  end
end
