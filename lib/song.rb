require 'pry'

class Song
			#relationship: Songs belong to an Artist and an Artist has many songs
			#relationship: Songs have one genre
	
			
	attr_accessor :name, :artist, :genre
	
	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.artist = artist if artist
		self.genre = genre if genre
	end

	def self.all 
		@@all
	end

	def self.find_by_name(name)
		# I have to implement: Songs should have a find_by_name method
		self.all.detect{|s| s.name == name}
	end

	def self.find_or_create_by_name(name)
		# I have to implement :Songs should have a find_or_create_by_name method
		self.find_by_name(name) || self.create(name)
	end

	def self.new_from_filename(filename)
		parts = filename.split(" - ")
		artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")
		# binding.pry
		new_artist = Artist.find_or_create_by_name(artist_name)
		new_genre = Genre.find_or_create_by_name(genre_name)
		self.new(song_name, new_artist, new_genre)
	end

	def self.create_from_filename(filename)
		song = self.new_from_filename(filename)
		song.save
		song
	end

	def self.destroy_all
		@@all.clear
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self) 
	end

	def genre=(genre)
		@genre = genre
		genre.songs << self unless genre.songs.include?(self)
		# Songs can be initialized with an optional genre
	end

	def save
		@@all << self
		# save method adds the instance itself into the class variable @@all
	end

	def self.create(song_name, artist = nil, genre = nil)
		#a custom constructor .create instantiates an instance using .new but also evokes #save on that instance, forcing it to persist immediately
		new(song_name, artist, genre).tap{|song| song.save}
		
	end

	# def artist=(artist)
	# 	@artist = artist
	# end
end
