require_relative 'concerns/findable'
class Genre
	attr_accessor :name, :songs

	extend Concerns::Findable
	extend Func::ClassMethods
	include Func::InstanceMethods

	@@all = []

	def initialize (name)
		@name = name
		@songs = []
	end

	def artists
		@songs.collect { |a| a.artist }.uniq 
	end

	def self.all
		@@all
	end
end
