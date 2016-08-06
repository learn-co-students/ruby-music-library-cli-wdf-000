class Artist

	extend Concerns::Findable

	attr_accessor :name, :songs

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

	def initialize(name)
		@name = name
		@songs = []
	end

	def add_song(song)
		if !self.songs.include?(song)
			self.songs << song
		end
		# if song.artist != self
		# 	song.artist = self
		# end
		song.artist ||= self
	end

	def genres
		self.songs.collect{|song| song.genre}.uniq
	end




end