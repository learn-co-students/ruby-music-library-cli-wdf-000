class MusicImporter
	
	attr_accessor :path
	def initialize (path)
		@path = path
	end
	def files
		Dir.glob(path+"/*.mp3").collect do |x|
			x.split('/').last
		end
	end

	def import
		files.each do |fname|
			Song.create_from_filename(fname)
		end
	end
end
