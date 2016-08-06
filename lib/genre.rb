class Genre
	
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

	def artists
		self.songs.collect{|song| song.artist}.uniq
	end

end