class MusicImporter

  attr_accessor :path

  def initialize(path_name)
    self.path = path_name
  end

  def files
    Dir.entries(self.path).reject {|file| file.start_with? "."}
  end

  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end