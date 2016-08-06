
class Song
	
	extend Concerns::Findable

	attr_accessor :name
	attr_reader :artist, :genre

	@@all = []

	def self.destroy_all
    	self.all.clear
  	end

  	def self.all
		@@all
    end

    def self.create(name)
  		newinstance = self.new(name)
  		newinstance.save
  		newinstance
	end

	def save
		@@all << self
	end

	def initialize(name, artist="", genre="")
		@name = name
		if artist != ""
			self.artist = artist
		end

		if genre != ""
			self.genre = genre
		end
	end

	def artist=(artist)
		@artist = artist
		self.artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		if !self.genre.songs.include?(self)
			self.genre.songs << self
		end
	end

	def self.new_from_filename(filename)
		filename_ary = filename.split(" - ")
		artist_name = filename_ary[0]
		song_name = filename_ary[1]
		genre_name = filename_ary[2].gsub(".mp3", "")
		artist = Artist.find_or_create_by_name(artist_name)
		genre = Genre.find_or_create_by_name(genre_name)
		self.new(song_name, artist, genre)
	end

	def self.create_from_filename(filename)
		song = self.new_from_filename(filename)
		song.save
		song
	end

end