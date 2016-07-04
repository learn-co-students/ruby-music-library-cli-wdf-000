require_relative 'concerns/func'
require_relative 'concerns/findable'
require 'pry'

class Artist
	
	attr_accessor :name, :songs
	extend Concerns::Findable
	extend Func::ClassMethods
	include Func::InstanceMethods

	@@all = []

	def initialize (name)
		@name = name
		@songs = []
	end

	def self.all
		@@all
	end

	def genres
		@songs.collect { |g| g.genre}.uniq
	end

	def add_song(song)
		unless @songs.include?(song)
			@songs << song
			song.artist = self unless song.artist == self
		end
	end
end
