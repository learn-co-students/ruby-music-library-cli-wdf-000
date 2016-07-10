require 'pry'
class MusicImporter
  include Concerns::Searchable
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    mp3s = parse_files(self.path)
  end

  def import
    files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end

end