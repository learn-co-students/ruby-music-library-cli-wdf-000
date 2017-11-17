class Genre
    # relationship: Genres have many songs and are initialized with an empty list of songs
	# relationship: Genres have many Artists through Song
	extend Concerns::Findable
	attr_accessor :name, :songs

	@@all = []
	# a class variable @@all that is set to an empty array and is prepared to store all saved instances

	def initialize(name)
		@name = name
		@songs = []
	end

	def self.create(name)
		new(name).tap {|a| a.save}
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def save
		@@all << self
	end

	def artists
		self.songs.collect{|song| song.artist}.uniq
		# relationship: Implement a #artists method for this association.
	end
end