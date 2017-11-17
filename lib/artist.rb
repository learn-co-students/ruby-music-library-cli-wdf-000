require 'pry'

class Artist
	# relationship: Artists have many Genres through Song. Artists have many Genres through Song. Implement a #genres method for this association.
	extend Concerns::Findable
	attr_accessor :name, :songs

	@@all = []
	# a class variable @@all that is set to an empty array and is prepared to store all saved instances


	def initialize(name)
		@name = name
		@songs =[]
		# save
		# self.save
	end

	def self.create(artist_name)
		# new(artist_name).tap{|artist| artist.save}
		new_artist = self.new(artist_name)
		new_artist.save
		new_artist
	end

	def self.songs
		all.map do |artist|
			artist.songs
		end
	end


	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def add_song(song)
		#Adding a song to an Artist is done by calling an #add_song method on an instance of the Artist class
		@songs << song if !songs.include?(song)
		song.artist = self if !song.artist

	end

	def save
		@@all << self
	end


	def genres
		self.songs.collect{|song| song.genre}.uniq
		# Artists have many Genres through Song. Implement a #genres method for this association.	
	end
	

end