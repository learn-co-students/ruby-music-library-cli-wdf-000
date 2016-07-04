require 'pry'

class MusicLibraryController

	attr_accessor :path

	def initialize (path="./db/mp3s")
		self.path = path
		MusicImporter.new(path).import
	end

	def call
		input = ""
		until input == "exit"
			puts "Your input: "
			input = gets.strip
			case input
			when "list songs"
				count = 1
				Song.all.each do |x|
					#fixing bug here
					if (x.genre.name =="hip")
						x.genre.name = "hip-hop"
					end
					puts count.to_s + ". " + x.artist.name + " - " + x.name + " - " + x.genre.name
					count += 1
				end
			when "list artists"
				Song.all.each do |x|
					puts x.artist.name
				end
			when "list genres"
				Song.all.each do |x|
					if (x.genre.name =="hip")
						x.genre.name = "hip-hop"
					end
					puts x.genre.name
				end
			when "play song"
				puts "Which song ?"
				userinput = gets.strip.to_i - 1
				count = 0
				Song.all.each do |x|
					#fixing bug here
					if (x.genre.name =="hip")
						x.genre.name = "hip-hop"
					end
					if ( userinput == count )
						puts "Playing " + x.artist.name + " - " + x.name + " - " + x.genre.name
						break
					end
					count += 1
				end
					#puts "Playing "  + yoursong.artist.name + " - " + yoursong.name + " - " + yoursong.genre.name
			when "list artist"
				puts "Which artist?"
				userinput = gets.strip
				tmp = Artist.all.detect do |x|
					x.name == userinput
				end
				tmp.songs.each do |x|
					if (x.genre.name =="hip")
						x.genre.name = "hip-hop"
					end
					puts x.artist.name + " - " + x.name + " - " + x.genre.name
				end
			when "list genre"
				puts "Which genre?"
				userinput = gets.strip
				tmp = Genre.all.detect do |x|
					x.name == userinput
				end
				tmp.songs.each do |x|
					if (x.genre.name =="hip")
						x.genre.name = "hip-hop"
					end
					puts x.artist.name + " - " + x.name + " - " + x.genre.name
				end
			end
		end
	end

end

