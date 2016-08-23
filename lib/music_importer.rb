# require 'pry'
class MusicImporter

  def initialize(path)
    @path = path

  end

  def path
    @path
  end

  def files

    @files = Dir.glob("#{path}/*.mp3").collect do |file|
      file.gsub("#{path}/","")
    end
    @files
    # binding.pry
  end

  # def import
  #   @files.each do |file|
  #     Song.new_from_filename(file)
  #   end
  # end

  def import
    self.files.each{ |filename| Song.create_from_filename(filename)}
  end

end
