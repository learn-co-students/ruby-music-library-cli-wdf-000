require 'pry'
class MusicImporter

	def initialize(path)
		@path = path
	end

	def path
		@path
	end

	def files
		@files = Dir.glob("#{@path}/*.mp3")
		@files.collect { |file| file.split("/").last}
	end

	def import
  # binding.pry
		files.each do |song_file|
			song_object = Song.create_from_filename(song_file)
		end
	end

end