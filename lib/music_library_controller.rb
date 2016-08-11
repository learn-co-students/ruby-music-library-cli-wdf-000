require 'pry'
class MusicLibraryController

	attr_accessor :path 

	def initialize(path = "./db/mp3s")
		@path = path
		music_importer = MusicImporter.new(path)
		music_importer.import
	end

	def list_songs
		Song.all.each_with_index do |song, i|
			puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
		end
	end

	def list_artists
		Artist.all.each do |artist|
			puts artist.name
		end
	end

	def list_genres
		Genre.all.each do |genre|
			puts genre.name
		end
	end

	def play_song(song_input)
		song = Song.all[(song_input.to_i)-1]
		puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
	end

	def list_artist_songs(artist_input)
		artist = Artist.find_by_name(artist_input)
		artist.songs.each do |song|
			puts "#{artist.name} - #{song.name} - #{song.genre.name}"
		end
	end

	def list_genre_songs(genre_input)
		genre = Genre.find_by_name(genre_input)
		genre.songs.each do |song|
			puts "#{song.artist.name} - #{song.name} - #{genre.name}"
		end
	end

	def call
		input = ""
		until input == "exit"
			
		puts "Please enter 'list songs', 'list artist', 'list genres', 'play song', 'list artist', 'list genre' "

		input = gets.strip
		case input
			when "list songs"
				self.list_songs

			when "list artists"
				self.list_artists
			when "list genres"
				self.list_genres
			when "play song"
				self.list_songs
				puts "Which song would you like to play? Please put in the song number."
				song_input = gets.strip
				self.play_song(song_input)
			when "list artist"
				self.list_artists
				puts "Which artist's songs would you like to check out?"
				artist_input = gets.strip
				self.list_artist_songs(artist_input)
			when "list genre"
				self.list_genres
				puts "What kind of genre's songs would you like to check out?"
				genre_input = gets.strip
				self.list_genre_songs(genre_input)
			end
		end
	end

end
	


