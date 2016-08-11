require 'pry'

class Song

	extend Concerns::Findable
	attr_accessor :name, :artist, :genre
	@@all = []

	def initialize(name, artist_obj = "", genre_obj = "")
		@name = name
		
		if artist_obj != ""
			self.artist = artist_obj
		end

		if genre_obj != ""
			self.genre = genre_obj
		end
	end

	def self.all
		@@all
	end

	def self.destroy_all
		all.clear
	end

	def save
		@@all << self
	end

	def self.create(name)
		song = self.new(name)
		song.save
		song
	end


	def artist=(artist_obj)
		@artist = artist_obj
		if !artist.songs.include?(self)
			artist_obj.add_song(self)
		end
	end

	def genre=(genre_obj)
		@genre = genre_obj
 		if !genre.songs.include?(self)
 			genre_obj.songs << self
 		end
	end

	def self.new_from_filename(filename)
		parsed = filename.split(" - ")

		artist_name = parsed[0]
		# find an artist with that name in Artist@@all or make a new artist with that name
		artist = Artist.find_or_create_by_name(artist_name) 

		genre_name = parsed[2][0..-5]
		genre = Genre.find_or_create_by_name(genre_name)

		song_name = parsed[1]
		
		s = self.new(song_name)
		s.artist = Artist.find_or_create_by_name(artist_name)
		s.genre = Genre.find_or_create_by_name(genre_name)
		s
	end

	def self.create_from_filename(filename)

		song = new_from_filename(filename)
		song.save
		song
		# parsed = filename.split(" - ")

		# artist_name = parsed[0]
		# # find an artist with that name in Artist@@all or make a new artist with that name
		# artist = Artist.find_or_create_by_name(artist_name)

		# genre_name = parsed[2][0..-5]
		# genre = Genre.find_or_create_by_name(genre_name)

		# song_name = parsed[1]
		# song = self.find_or_create_by_name(song_name)
		
		# song.artist = artist
		# song.genre = genre
		
	end

end