require_relative 'concerns/func'
require_relative 'concerns/findable'
require_relative 'artist'
require_relative 'genre'
require 'pry'

class Song

	attr_accessor :name 
	attr_reader :artist, :genre
	extend Concerns::Findable
	extend Func::ClassMethods
	include Func::InstanceMethods

	@@all = []

	def initialize (name,artist = nil, genre = nil)
		@name = name
		artist.add_song(self) if artist
		self.genre= genre if genre
		if ( artist && genre )
			artist.genres << genre unless artist.genres.include?(genre)
		end
	end

	def artist= (artist)
		@artist = artist
		artist.add_song(self) unless artist.songs.include?(self)
	end

	def genre= (genre)
		genre.songs << self unless genre.songs.include?(self)
		@genre = genre
	end

	def self.all
		@@all
	end

	def self.new_from_filename(mp3)
		arr = mp3.split(/\s*-\s*/)
		Song.new(arr[1],Artist.find_or_create_by_name(arr[0]),Genre.find_or_create_by_name(arr[2].match(/^\w+/).to_s))
	end

	def self.create_from_filename(mp3)
		arr = mp3.split(/\s*-\s*/)
		tmp = Song.new(arr[1],Artist.find_or_create_by_name(arr[0]),Genre.find_or_create_by_name(arr[2].match(/^\w+/).to_s))
		tmp.save
		tmp
		#tmp = Song.create(arr[1])
		#tmp.genre = Genre.find_or_create_by_name(arr[2].match(/^\w+/).to_s)
		#tmp.artist = Artist.find_or_create_by_name(arr[0])
		#tmp
	end
end

#song = Song.new_from_filename("Thundercat - For Love I Come - dance.mp3")
#puts song.name
