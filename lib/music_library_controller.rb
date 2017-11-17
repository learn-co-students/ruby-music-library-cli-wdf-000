class MusicLibraryController
	
	# @@all = []
	attr_accessor :path

	def initialize(path = "./db/mp3s")
		# @path = path
		importer = MusicImporter.new(path)
		importer.import
	end

	def call
		input = ""
		until input == "exit"
			puts "Welcome to Music library CLI."
			puts "What would you like to do?"
			input = gets.chomp

			case input
			when "list songs"
				songs
			when "list artists"
				artists
			when "list genres"
				genres
			when "list artist"
				list_artist
			when "list genre"
				list_genre
			when "play song"
				play_song
			end
		end
	end

	def artists
		Artist.all.each do |artist| 
			puts artist.name
		end
	end

	def genres
		Genre.all.each do |genre|
			puts genre.name
		end
	end

	def songs
		Song.all.each.with_index(1) do |song, i|
      	puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
 	end

    def play_song
	    songs
	    puts "Choose a song by number:"
	    song_choice = gets.chomp.to_i - 1
	    puts "Playing #{Song.all[song_choice].artist.name} - #{Song.all[song_choice].name} - #{Song.all[song_choice].genre.name}"
	end

	def list_artist
	    puts "Choose an artist:"
	    artist_choice = gets.chomp
	    Artist.all.each do |artist|
	      if artist_choice == artist.name
	        artist.songs.each do |song|
	          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
	        end
	    end
	  end
    end

    def list_genre
		puts "Choose a genre:"
		genre_choice = gets.chomp
		Genre.all.each do |genre|
		if genre_choice == genre.name
			genre.songs.each do |song|
			 	puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
			 end
		end
	  end
	end
 end