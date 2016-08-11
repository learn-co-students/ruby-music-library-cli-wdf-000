class Artist

	attr_accessor :name, :songs
	extend Concerns::Findable

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def self.all
		@@all
	end

	def add_song(song)
		if !self.songs.include?(song)
			@songs << song
			song.artist = self
		end
	end

	def self.destroy_all
		self.all.clear
	end

	def save
		@@all << self
		self
	end

	def self.create(name)
		self.new(name).save
	end

	def genres
		self.songs.collect{|song| song.genre}.uniq
	end

end